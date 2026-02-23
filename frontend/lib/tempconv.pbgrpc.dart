///
///  Generated code – do not modify by hand.
///  Regenerate with:
///    dart pub global activate protoc_plugin
///    protoc --dart_out=grpc:lib -I ../backend/proto ../backend/proto/tempconv.proto
///
// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/grpc.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'tempconv.pb.dart';

export 'tempconv.pb.dart';

@$pb.ProtoServiceName('tempconv.TempConv')
class TempConvClient extends $grpc.Client {
  static final _$celsiusToFahrenheit =
      $grpc.ClientMethod<CelsiusRequest, FahrenheitResponse>(
    '/tempconv.TempConv/CelsiusToFahrenheit',
    (CelsiusRequest value) => value.writeToBuffer(),
    ($core.List<$core.int> value) => FahrenheitResponse.fromBuffer(value),
  );
  static final _$fahrenheitToCelsius =
      $grpc.ClientMethod<FahrenheitRequest, CelsiusResponse>(
    '/tempconv.TempConv/FahrenheitToCelsius',
    (FahrenheitRequest value) => value.writeToBuffer(),
    ($core.List<$core.int> value) => CelsiusResponse.fromBuffer(value),
  );

  TempConvClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<FahrenheitResponse> celsiusToFahrenheit(
      CelsiusRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$celsiusToFahrenheit, request, options: options);
  }

  $grpc.ResponseFuture<CelsiusResponse> fahrenheitToCelsius(
      FahrenheitRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$fahrenheitToCelsius, request, options: options);
  }
}

@$pb.ProtoServiceName('tempconv.TempConv')
abstract class TempConvServiceBase extends $grpc.Service {
  $core.String get $name => 'tempconv.TempConv';

  TempConvServiceBase() {
    $addMethod($grpc.ServiceMethod<CelsiusRequest, FahrenheitResponse>(
      'CelsiusToFahrenheit',
      celsiusToFahrenheit_Pre,
      false,
      false,
      ($core.List<$core.int> value) => CelsiusRequest.fromBuffer(value),
      (FahrenheitResponse value) => value.writeToBuffer(),
    ));
    $addMethod($grpc.ServiceMethod<FahrenheitRequest, CelsiusResponse>(
      'FahrenheitToCelsius',
      fahrenheitToCelsius_Pre,
      false,
      false,
      ($core.List<$core.int> value) => FahrenheitRequest.fromBuffer(value),
      (CelsiusResponse value) => value.writeToBuffer(),
    ));
  }

  $async.Future<FahrenheitResponse> celsiusToFahrenheit_Pre(
      $grpc.ServiceCall call, $async.Future<CelsiusRequest> request) async {
    return celsiusToFahrenheit(call, await request);
  }

  $async.Future<CelsiusResponse> fahrenheitToCelsius_Pre(
      $grpc.ServiceCall call, $async.Future<FahrenheitRequest> request) async {
    return fahrenheitToCelsius(call, await request);
  }

  $async.Future<FahrenheitResponse> celsiusToFahrenheit(
      $grpc.ServiceCall call, CelsiusRequest request);
  $async.Future<CelsiusResponse> fahrenheitToCelsius(
      $grpc.ServiceCall call, FahrenheitRequest request);
}
