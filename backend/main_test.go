package main

import (
	"context"
	"testing"

	pb "github.com/Jeqz360/tempconv/backend/gen"
)

func TestCelsiusToFahrenheit(t *testing.T) {
	s := &server{}
	tests := []struct {
		celsius    float64
		fahrenheit float64
	}{
		{0, 32},
		{100, 212},
		{-40, -40},
		{37, 98.6},
	}

	for _, tc := range tests {
		resp, err := s.CelsiusToFahrenheit(context.Background(), &pb.CelsiusRequest{Celsius: tc.celsius})
		if err != nil {
			t.Errorf("CelsiusToFahrenheit(%v): unexpected error: %v", tc.celsius, err)
			continue
		}
		if got := resp.Fahrenheit; abs(got-tc.fahrenheit) > 1e-9 {
			t.Errorf("CelsiusToFahrenheit(%v) = %v, want %v", tc.celsius, got, tc.fahrenheit)
		}
	}
}

func TestFahrenheitToCelsius(t *testing.T) {
	s := &server{}
	tests := []struct {
		fahrenheit float64
		celsius    float64
	}{
		{32, 0},
		{212, 100},
		{-40, -40},
		{98.6, 37},
	}

	for _, tc := range tests {
		resp, err := s.FahrenheitToCelsius(context.Background(), &pb.FahrenheitRequest{Fahrenheit: tc.fahrenheit})
		if err != nil {
			t.Errorf("FahrenheitToCelsius(%v): unexpected error: %v", tc.fahrenheit, err)
			continue
		}
		if got := resp.Celsius; abs(got-tc.celsius) > 1e-9 {
			t.Errorf("FahrenheitToCelsius(%v) = %v, want %v", tc.fahrenheit, got, tc.celsius)
		}
	}
}

func abs(x float64) float64 {
	if x < 0 {
		return -x
	}
	return x
}
