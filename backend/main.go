package main

import (
	"context"
	"log"
	"net"

	pb "github.com/Jeqz360/tempconv/backend/gen"
	"google.golang.org/grpc"
	"google.golang.org/grpc/reflection"
)

const port = ":50051"

type server struct {
	pb.UnimplementedTempConvServer
}

// CelsiusToFahrenheit converts °C → °F: F = C × 9/5 + 32
func (s *server) CelsiusToFahrenheit(_ context.Context, req *pb.CelsiusRequest) (*pb.FahrenheitResponse, error) {
	f := req.Celsius*9.0/5.0 + 32.0
	return &pb.FahrenheitResponse{Fahrenheit: f}, nil
}

// FahrenheitToCelsius converts °F → °C: C = (F − 32) × 5/9
func (s *server) FahrenheitToCelsius(_ context.Context, req *pb.FahrenheitRequest) (*pb.CelsiusResponse, error) {
	c := (req.Fahrenheit - 32.0) * 5.0 / 9.0
	return &pb.CelsiusResponse{Celsius: c}, nil
}

func main() {
	lis, err := net.Listen("tcp", port)
	if err != nil {
		log.Fatalf("failed to listen: %v", err)
	}

	s := grpc.NewServer()
	pb.RegisterTempConvServer(s, &server{})
	reflection.Register(s)

	log.Printf("gRPC server listening on %s", port)
	if err := s.Serve(lis); err != nil {
		log.Fatalf("failed to serve: %v", err)
	}
}
