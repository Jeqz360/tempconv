PROJECT_ID ?= $(shell gcloud config get-value project 2>/dev/null)
REGION     ?= europe-west1
CLUSTER    ?= tempconv-cluster
REPO       = gcr.io/$(PROJECT_ID)

.PHONY: proto backend-test backend-build docker-build docker-push \
        gke-create gke-deploy load-test clean

# ── Protobuf ─────────────────────────────────────────────────────────────────
proto:
	protoc \
	  --go_out=backend/gen --go_opt=paths=source_relative \
	  --go-grpc_out=backend/gen --go-grpc_opt=paths=source_relative \
	  -I backend/proto backend/proto/tempconv.proto
	# Dart client (requires dart pub global activate protoc_plugin)
	protoc \
	  --dart_out=grpc:frontend/lib \
	  -I backend/proto backend/proto/tempconv.proto

# ── Backend ──────────────────────────────────────────────────────────────────
backend-test:
	cd backend && go test ./... -v

backend-build:
	cd backend && go build -o server .

# ── Docker ───────────────────────────────────────────────────────────────────
docker-build:
	docker build --platform linux/amd64 -t $(REPO)/tempconv-backend:latest  backend/
	docker build --platform linux/amd64 -t $(REPO)/tempconv-envoy:latest    envoy/
	docker build --platform linux/amd64 \
	  --build-arg BACKEND_URL=http://envoy:8080 \
	  -t $(REPO)/tempconv-frontend:latest frontend/

docker-push: docker-build
	docker push $(REPO)/tempconv-backend:latest
	docker push $(REPO)/tempconv-envoy:latest
	docker push $(REPO)/tempconv-frontend:latest

# ── GKE ──────────────────────────────────────────────────────────────────────
gke-create:
	gcloud container clusters create $(CLUSTER) \
	  --region=$(REGION) \
	  --num-nodes=2 \
	  --machine-type=e2-medium \
	  --workload-pool=$(PROJECT_ID).svc.id.goog
	gcloud container clusters get-credentials $(CLUSTER) --region=$(REGION)

gke-deploy:
	@# Substitute the real project ID into the manifests before applying
	sed "s/<PROJECT_ID>/$(PROJECT_ID)/g" k8s/backend-deployment.yaml  | kubectl apply -f -
	kubectl apply -f k8s/backend-service.yaml
	sed "s/<PROJECT_ID>/$(PROJECT_ID)/g" k8s/envoy-deployment.yaml    | kubectl apply -f -
	kubectl apply -f k8s/envoy-service.yaml
	sed "s/<PROJECT_ID>/$(PROJECT_ID)/g" k8s/frontend-deployment.yaml | kubectl apply -f -
	kubectl apply -f k8s/frontend-service.yaml
	kubectl rollout status deployment/backend
	kubectl rollout status deployment/envoy
	kubectl rollout status deployment/frontend

# ── Load test ────────────────────────────────────────────────────────────────
load-test:
	k6 run load-tests/grpc_load_test.js

# ── Cleanup ──────────────────────────────────────────────────────────────────
clean:
	rm -f backend/server
	gcloud container clusters delete $(CLUSTER) --region=$(REGION) --quiet || true
