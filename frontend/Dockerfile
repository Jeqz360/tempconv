# ---- Build stage ----
FROM ghcr.io/cirruslabs/flutter:stable AS builder

WORKDIR /app

# Copy dependency manifest and fetch packages
COPY pubspec.yaml pubspec.lock* ./
RUN flutter pub get

# Copy the rest of the source
COPY . .

# Build for web, pointing at the Envoy proxy Service in Kubernetes
ARG BACKEND_URL=http://envoy:8080
RUN flutter build web --dart-define=BACKEND_URL=${BACKEND_URL} --release

# ---- Runtime stage ----
FROM nginx:1.27-alpine

COPY --from=builder /app/build/web /usr/share/nginx/html

# Simple nginx config that routes everything to index.html (SPA)
RUN printf 'server {\n\
  listen 80;\n\
  root /usr/share/nginx/html;\n\
  index index.html;\n\
  location / {\n\
    try_files $uri $uri/ /index.html;\n\
  }\n\
}\n' > /etc/nginx/conf.d/default.conf

EXPOSE 80
