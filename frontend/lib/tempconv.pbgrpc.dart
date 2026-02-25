//
//  Generated code. Do not modify.
//  source: tempconv.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'tempconv.pb.dart' as $0;

export 'tempconv.pb.dart';

@$pb.GrpcServiceName('tempconv.TempConv')
class TempConvClient extends $grpc.Client {
  static final _$celsiusToFahrenheit = $grpc.ClientMethod<$0.CelsiusRequest, $0.FahrenheitResponse>(
      '/tempconv.TempConv/CelsiusToFahrenheit',
      ($0.CelsiusRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.FahrenheitResponse.fromBuffer(value));
  static final _$fahrenheitToCelsius = $grpc.ClientMethod<$0.FahrenheitRequest, $0.CelsiusResponse>(
      '/tempconv.TempConv/FahrenheitToCelsius',
      ($0.FahrenheitRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.CelsiusResponse.fromBuffer(value));

  TempConvClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$0.FahrenheitResponse> celsiusToFahrenheit($0.CelsiusRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$celsiusToFahrenheit, request, options: options);
  }

  $grpc.ResponseFuture<$0.CelsiusResponse> fahrenheitToCelsius($0.FahrenheitRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$fahrenheitToCelsius, request, options: options);
  }
}

@$pb.GrpcServiceName('tempconv.TempConv')
abstract class TempConvServiceBase extends $grpc.Service {
  $core.String get $name => 'tempconv.TempConv';

  TempConvServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.CelsiusRequest, $0.FahrenheitResponse>(
        'CelsiusToFahrenheit',
        celsiusToFahrenheit_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CelsiusRequest.fromBuffer(value),
        ($0.FahrenheitResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.FahrenheitRequest, $0.CelsiusResponse>(
        'FahrenheitToCelsius',
        fahrenheitToCelsius_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.FahrenheitRequest.fromBuffer(value),
        ($0.CelsiusResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.FahrenheitResponse> celsiusToFahrenheit_Pre($grpc.ServiceCall $call, $async.Future<$0.CelsiusRequest> $request) async {
    return celsiusToFahrenheit($call, await $request);
  }

  $async.Future<$0.CelsiusResponse> fahrenheitToCelsius_Pre($grpc.ServiceCall $call, $async.Future<$0.FahrenheitRequest> $request) async {
    return fahrenheitToCelsius($call, await $request);
  }

  $async.Future<$0.FahrenheitResponse> celsiusToFahrenheit($grpc.ServiceCall call, $0.CelsiusRequest request);
  $async.Future<$0.CelsiusResponse> fahrenheitToCelsius($grpc.ServiceCall call, $0.FahrenheitRequest request);
}
