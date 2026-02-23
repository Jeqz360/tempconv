/**
 * k6 gRPC load test for the tempconv backend.
 *
 * Prerequisites:
 *   - k6 v0.49+ (ships with built-in gRPC support)
 *   - The backend is reachable at BACKEND_ADDR (default: localhost:50051)
 *
 * Run locally:
 *   k6 run load-tests/grpc_load_test.js
 *
 * Run against Kubernetes (port-forwarded):
 *   kubectl port-forward svc/backend 50051:50051 &
 *   k6 run load-tests/grpc_load_test.js
 *
 * Override the target:
 *   k6 run -e BACKEND_ADDR=<IP>:50051 load-tests/grpc_load_test.js
 */

import grpc from 'k6/net/grpc';
import { check, sleep } from 'k6';

export const options = {
  stages: [
    { duration: '30s', target: 20 },   // ramp up to 20 VUs
    { duration: '1m',  target: 100 },  // stay at 100 VUs (load)
    { duration: '30s', target: 0 },    // ramp down
  ],
  thresholds: {
    grpc_req_duration: ['p(95)<200'],  // 95th percentile below 200 ms
    checks:            ['rate>0.99'],  // 99% success rate
  },
};

const client = new grpc.Client();

// Load the proto descriptor so k6 knows the message schema.
client.load(
  ['../backend/proto'],   // path relative to this script
  'tempconv.proto',
);

const BACKEND_ADDR = __ENV.BACKEND_ADDR || 'localhost:50051';

export default function () {
  client.connect(BACKEND_ADDR, { plaintext: true });

  // ---- CelsiusToFahrenheit ----
  const c2fResp = client.invoke(
    'tempconv.TempConv/CelsiusToFahrenheit',
    { celsius: 100 },
  );
  check(c2fResp, {
    'C→F status OK':         (r) => r && r.status === grpc.StatusOK,
    'C→F result is 212':     (r) => r && r.message.fahrenheit === 212,
  });

  // ---- FahrenheitToCelsius ----
  const f2cResp = client.invoke(
    'tempconv.TempConv/FahrenheitToCelsius',
    { fahrenheit: 32 },
  );
  check(f2cResp, {
    'F→C status OK':         (r) => r && r.status === grpc.StatusOK,
    'F→C result is 0':       (r) => r && r.message.celsius === 0,
  });

  client.close();
  sleep(0.1);
}
