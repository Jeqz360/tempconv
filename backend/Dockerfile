# ---- Build stage ----
FROM golang:1.24-alpine AS builder

WORKDIR /app

# Cache module downloads
COPY go.mod go.sum ./
RUN go mod download

# Copy source and generated protobuf code
COPY . .

# Produce a statically linked binary for linux/amd64
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o server .

# ---- Runtime stage ----
FROM gcr.io/distroless/static:nonroot

COPY --from=builder /app/server /server

EXPOSE 50051

ENTRYPOINT ["/server"]
