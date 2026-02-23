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

import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

// ──────────────────────────────── Messages ────────────────────────────────

class CelsiusRequest extends $pb.GeneratedMessage {
  factory CelsiusRequest({$core.double? celsius}) {
    final result = create();
    if (celsius != null) result.celsius = celsius;
    return result;
  }

  CelsiusRequest._();
  factory CelsiusRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CelsiusRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
    'CelsiusRequest',
    package: const $pb.PackageName('tempconv'),
    createEmptyInstance: create,
  )
    ..a<$core.double>(1, 'celsius', $pb.PbFieldType.OD)
    ..hasRequiredFields = false;

  @$core.override
  $pb.BuilderInfo get info_ => _i;
  @$core.override
  CelsiusRequest createEmptyInstance() => CelsiusRequest._();
  static CelsiusRequest create() => CelsiusRequest._();
  @$core.override
  CelsiusRequest clone() => CelsiusRequest()..mergeFromMessage(this);

  @$pb.TagNumber(1)
  $core.double get celsius => $_getN(0);
  @$pb.TagNumber(1)
  set celsius($core.double v) { $_setDouble(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCelsius() => $_has(0);
  @$pb.TagNumber(1)
  void clearCelsius() => clearField(1);
}

class FahrenheitResponse extends $pb.GeneratedMessage {
  factory FahrenheitResponse({$core.double? fahrenheit}) {
    final result = create();
    if (fahrenheit != null) result.fahrenheit = fahrenheit;
    return result;
  }

  FahrenheitResponse._();
  factory FahrenheitResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory FahrenheitResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
    'FahrenheitResponse',
    package: const $pb.PackageName('tempconv'),
    createEmptyInstance: create,
  )
    ..a<$core.double>(1, 'fahrenheit', $pb.PbFieldType.OD)
    ..hasRequiredFields = false;

  @$core.override
  $pb.BuilderInfo get info_ => _i;
  @$core.override
  FahrenheitResponse createEmptyInstance() => FahrenheitResponse._();
  static FahrenheitResponse create() => FahrenheitResponse._();
  @$core.override
  FahrenheitResponse clone() => FahrenheitResponse()..mergeFromMessage(this);

  @$pb.TagNumber(1)
  $core.double get fahrenheit => $_getN(0);
  @$pb.TagNumber(1)
  set fahrenheit($core.double v) { $_setDouble(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFahrenheit() => $_has(0);
  @$pb.TagNumber(1)
  void clearFahrenheit() => clearField(1);
}

class FahrenheitRequest extends $pb.GeneratedMessage {
  factory FahrenheitRequest({$core.double? fahrenheit}) {
    final result = create();
    if (fahrenheit != null) result.fahrenheit = fahrenheit;
    return result;
  }

  FahrenheitRequest._();
  factory FahrenheitRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory FahrenheitRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
    'FahrenheitRequest',
    package: const $pb.PackageName('tempconv'),
    createEmptyInstance: create,
  )
    ..a<$core.double>(1, 'fahrenheit', $pb.PbFieldType.OD)
    ..hasRequiredFields = false;

  @$core.override
  $pb.BuilderInfo get info_ => _i;
  @$core.override
  FahrenheitRequest createEmptyInstance() => FahrenheitRequest._();
  static FahrenheitRequest create() => FahrenheitRequest._();
  @$core.override
  FahrenheitRequest clone() => FahrenheitRequest()..mergeFromMessage(this);

  @$pb.TagNumber(1)
  $core.double get fahrenheit => $_getN(0);
  @$pb.TagNumber(1)
  set fahrenheit($core.double v) { $_setDouble(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFahrenheit() => $_has(0);
  @$pb.TagNumber(1)
  void clearFahrenheit() => clearField(1);
}

class CelsiusResponse extends $pb.GeneratedMessage {
  factory CelsiusResponse({$core.double? celsius}) {
    final result = create();
    if (celsius != null) result.celsius = celsius;
    return result;
  }

  CelsiusResponse._();
  factory CelsiusResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CelsiusResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
    'CelsiusResponse',
    package: const $pb.PackageName('tempconv'),
    createEmptyInstance: create,
  )
    ..a<$core.double>(1, 'celsius', $pb.PbFieldType.OD)
    ..hasRequiredFields = false;

  @$core.override
  $pb.BuilderInfo get info_ => _i;
  @$core.override
  CelsiusResponse createEmptyInstance() => CelsiusResponse._();
  static CelsiusResponse create() => CelsiusResponse._();
  @$core.override
  CelsiusResponse clone() => CelsiusResponse()..mergeFromMessage(this);

  @$pb.TagNumber(1)
  $core.double get celsius => $_getN(0);
  @$pb.TagNumber(1)
  set celsius($core.double v) { $_setDouble(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCelsius() => $_has(0);
  @$pb.TagNumber(1)
  void clearCelsius() => clearField(1);
}
