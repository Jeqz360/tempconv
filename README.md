# tempconv — Temperature Converter (Go gRPC + Flutter Web + GKE)

A step-by-step guide to building, containerising, and deploying a distributed
temperature-conversion app on **Google Kubernetes Engine (GKE)**.

```
Browser
  │  gRPC-web (HTTP/1.1 or HTTP/2)
  ▼
[Flutter Web  :80]  → Nginx (static files)
  │
  │  gRPC-web
  ▼
[Envoy Proxy  :8080]
  │
  │  gRPC (HTTP/2)
  ▼
[Go gRPC Server :50051]
```

---

## Prerequisites

| Tool | Purpose |
|------|---------|
| Go ≥ 1.21 | Backend language |
| Flutter ≥ 3 | Frontend framework |
| protoc + protoc-gen-go + protoc-gen-go-grpc | Go code generation |
| dart pub global activate protoc_plugin | Dart code generation |
| Docker | Image build |
| kubectl | Cluster management |
| google-cloud-sdk + gke-gcloud-auth-plugin | GKE interaction |
| k6 | Load testing |

---

## Step 1 – Explore the project layout

```
tempconv/
├── backend/           # Go gRPC server
│   ├── proto/         #   Source of truth: tempconv.proto
│   ├── gen/           #   Generated Go protobuf/gRPC code
│   ├── main.go        #   Server entry-point
│   ├── main_test.go   #   Unit tests
│   └── Dockerfile
├── envoy/             # Envoy proxy (gRPC-web → gRPC translation)
│   ├── envoy.yaml
│   └── Dockerfile
├── frontend/          # Flutter web app
│   ├── lib/
│   │   ├── main.dart            # Flutter app
│   │   ├── tempconv.pb.dart     # Generated protobuf messages
│   │   └── tempconv.pbgrpc.dart # Generated gRPC client stub
│   ├── web/index.html
│   └── Dockerfile
├── k8s/               # Kubernetes manifests
│   ├── backend-deployment.yaml
│   ├── backend-service.yaml
│   ├── envoy-deployment.yaml
│   ├── envoy-service.yaml
│   ├── frontend-deployment.yaml
│   └── frontend-service.yaml
├── load-tests/
│   └── grpc_load_test.js  # k6 gRPC load test
└── Makefile
```

---

## Step 2 – The proto contract

`backend/proto/tempconv.proto` defines two unary RPC methods:

```protobuf
service TempConv {
  rpc CelsiusToFahrenheit(CelsiusRequest)    returns (FahrenheitResponse);
  rpc FahrenheitToCelsius(FahrenheitRequest) returns (CelsiusResponse);
}
```

Regenerate the generated code whenever you change the proto:

```bash
make proto
```

---

## Step 3 – Run the backend locally

```bash
cd backend
go test ./...          # run unit tests
go run .               # start the gRPC server on :50051
```

You can query it with [grpcurl](https://github.com/fullstorydev/grpcurl):

```bash
grpcurl -plaintext -d '{"celsius": 100}' \
  localhost:50051 tempconv.TempConv/CelsiusToFahrenheit
# → { "fahrenheit": 212 }
```

---

## Step 4 – Run the frontend locally

The Flutter web app communicates with the backend via **gRPC-web**.
Browsers cannot speak raw gRPC (HTTP/2 trailers are not exposed), so an
**Envoy proxy** translates between them.

### 4a – Start Envoy

```bash
docker run --rm -p 8080:8080 \
  -v "$PWD/envoy/envoy.yaml:/etc/envoy/envoy.yaml:ro" \
  envoyproxy/envoy:v1.31-latest \
  -c /etc/envoy/envoy.yaml
```

> Envoy listens on `:8080` and proxies to the Go server on `localhost:50051`.
> Edit `envoy/envoy.yaml` → `address: host.docker.internal` if the Go server
> is running directly on the host (not inside Docker).

### 4b – Run Flutter

```bash
cd frontend
flutter pub get
flutter run -d chrome --dart-define=BACKEND_URL=http://localhost:8080
```

---

## Step 5 – Build and push Docker images

Replace `<PROJECT_ID>` with your Google Cloud project.

```bash
export PROJECT_ID=<your-project-id>

# Build all three images for linux/amd64 (GKE node architecture)
make docker-build

# Authenticate Docker to Google Container Registry
gcloud auth configure-docker

# Push
make docker-push
```

Or build manually:

```bash
docker build --platform linux/amd64 -t gcr.io/$PROJECT_ID/tempconv-backend:latest  backend/
docker build --platform linux/amd64 -t gcr.io/$PROJECT_ID/tempconv-envoy:latest    envoy/
docker build --platform linux/amd64 \
  --build-arg BACKEND_URL=http://envoy:8080 \
  -t gcr.io/$PROJECT_ID/tempconv-frontend:latest frontend/
```

---

## Step 6 – Create a GKE cluster

```bash
export PROJECT_ID=<your-project-id>
export REGION=europe-west1   # or any region close to you

gcloud config set project $PROJECT_ID

# Create a two-node cluster (e2-medium, linux/amd64)
gcloud container clusters create tempconv-cluster \
  --region=$REGION \
  --num-nodes=2 \
  --machine-type=e2-medium

# Fetch credentials for kubectl
gcloud container clusters get-credentials tempconv-cluster --region=$REGION
```

Or use `make gke-create` (after exporting `PROJECT_ID` and `REGION`).

---

## Step 7 – Deploy to GKE

```bash
export PROJECT_ID=<your-project-id>
make gke-deploy
```

This applies all manifests under `k8s/`, substituting your project ID into
the image names.

Wait for the frontend's external IP:

```bash
kubectl get svc frontend --watch
```

Open `http://<EXTERNAL-IP>` in a browser.

### What gets deployed

| Workload | Replicas | Purpose |
|----------|----------|---------|
| `backend` | 2 | Go gRPC server |
| `envoy` | 1 | gRPC-web → gRPC translation |
| `frontend` | 2 | Flutter web app served by Nginx |

Services:
* `backend` – ClusterIP:50051 (internal only)
* `envoy`   – ClusterIP:8080  (internal only)
* `frontend` – **LoadBalancer**:80 (public)

---

## Step 8 – Load testing with k6

### Port-forward the backend for local testing

```bash
kubectl port-forward svc/backend 50051:50051 &
```

### Run the load test

```bash
k6 run load-tests/grpc_load_test.js
```

Or override the target address:

```bash
k6 run -e BACKEND_ADDR=<backend-ip>:50051 load-tests/grpc_load_test.js
```

The test ramps up to **100 virtual users** and enforces:
* p95 latency < 200 ms
* ≥ 99% success rate

---

## Step 9 – Scaling

Scale the backend up when more load is expected:

```bash
kubectl scale deployment backend --replicas=5
```

GKE can also autoscale nodes:

```bash
gcloud container clusters update tempconv-cluster \
  --region=$REGION \
  --enable-autoscaling \
  --min-nodes=1 --max-nodes=5
```

---

## Cleanup

```bash
make clean   # deletes the GKE cluster (billing stops)
```
