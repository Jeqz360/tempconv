//
//  Generated code. Do not modify.
//  source: tempconv.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class CelsiusRequest extends $pb.GeneratedMessage {
  factory CelsiusRequest({
    $core.double? celsius,
  }) {
    final $result = create();
    if (celsius != null) {
      $result.celsius = celsius;
    }
    return $result;
  }
  CelsiusRequest._() : super();
  factory CelsiusRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CelsiusRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CelsiusRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'tempconv'), createEmptyInstance: create)
    ..a<$core.double>(1, _omitFieldNames ? '' : 'celsius', $pb.PbFieldType.OD)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CelsiusRequest clone() => CelsiusRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CelsiusRequest copyWith(void Function(CelsiusRequest) updates) => super.copyWith((message) => updates(message as CelsiusRequest)) as CelsiusRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CelsiusRequest create() => CelsiusRequest._();
  CelsiusRequest createEmptyInstance() => create();
  static $pb.PbList<CelsiusRequest> createRepeated() => $pb.PbList<CelsiusRequest>();
  @$core.pragma('dart2js:noInline')
  static CelsiusRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CelsiusRequest>(create);
  static CelsiusRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get celsius => $_getN(0);
  @$pb.TagNumber(1)
  set celsius($core.double v) { $_setDouble(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCelsius() => $_has(0);
  @$pb.TagNumber(1)
  void clearCelsius() => $_clearField(1);
}

class FahrenheitResponse extends $pb.GeneratedMessage {
  factory FahrenheitResponse({
    $core.double? fahrenheit,
  }) {
    final $result = create();
    if (fahrenheit != null) {
      $result.fahrenheit = fahrenheit;
    }
    return $result;
  }
  FahrenheitResponse._() : super();
  factory FahrenheitResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FahrenheitResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FahrenheitResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'tempconv'), createEmptyInstance: create)
    ..a<$core.double>(1, _omitFieldNames ? '' : 'fahrenheit', $pb.PbFieldType.OD)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FahrenheitResponse clone() => FahrenheitResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FahrenheitResponse copyWith(void Function(FahrenheitResponse) updates) => super.copyWith((message) => updates(message as FahrenheitResponse)) as FahrenheitResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FahrenheitResponse create() => FahrenheitResponse._();
  FahrenheitResponse createEmptyInstance() => create();
  static $pb.PbList<FahrenheitResponse> createRepeated() => $pb.PbList<FahrenheitResponse>();
  @$core.pragma('dart2js:noInline')
  static FahrenheitResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FahrenheitResponse>(create);
  static FahrenheitResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get fahrenheit => $_getN(0);
  @$pb.TagNumber(1)
  set fahrenheit($core.double v) { $_setDouble(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFahrenheit() => $_has(0);
  @$pb.TagNumber(1)
  void clearFahrenheit() => $_clearField(1);
}

class FahrenheitRequest extends $pb.GeneratedMessage {
  factory FahrenheitRequest({
    $core.double? fahrenheit,
  }) {
    final $result = create();
    if (fahrenheit != null) {
      $result.fahrenheit = fahrenheit;
    }
    return $result;
  }
  FahrenheitRequest._() : super();
  factory FahrenheitRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FahrenheitRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FahrenheitRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'tempconv'), createEmptyInstance: create)
    ..a<$core.double>(1, _omitFieldNames ? '' : 'fahrenheit', $pb.PbFieldType.OD)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FahrenheitRequest clone() => FahrenheitRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FahrenheitRequest copyWith(void Function(FahrenheitRequest) updates) => super.copyWith((message) => updates(message as FahrenheitRequest)) as FahrenheitRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FahrenheitRequest create() => FahrenheitRequest._();
  FahrenheitRequest createEmptyInstance() => create();
  static $pb.PbList<FahrenheitRequest> createRepeated() => $pb.PbList<FahrenheitRequest>();
  @$core.pragma('dart2js:noInline')
  static FahrenheitRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FahrenheitRequest>(create);
  static FahrenheitRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get fahrenheit => $_getN(0);
  @$pb.TagNumber(1)
  set fahrenheit($core.double v) { $_setDouble(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFahrenheit() => $_has(0);
  @$pb.TagNumber(1)
  void clearFahrenheit() => $_clearField(1);
}

class CelsiusResponse extends $pb.GeneratedMessage {
  factory CelsiusResponse({
    $core.double? celsius,
  }) {
    final $result = create();
    if (celsius != null) {
      $result.celsius = celsius;
    }
    return $result;
  }
  CelsiusResponse._() : super();
  factory CelsiusResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CelsiusResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CelsiusResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'tempconv'), createEmptyInstance: create)
    ..a<$core.double>(1, _omitFieldNames ? '' : 'celsius', $pb.PbFieldType.OD)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CelsiusResponse clone() => CelsiusResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CelsiusResponse copyWith(void Function(CelsiusResponse) updates) => super.copyWith((message) => updates(message as CelsiusResponse)) as CelsiusResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CelsiusResponse create() => CelsiusResponse._();
  CelsiusResponse createEmptyInstance() => create();
  static $pb.PbList<CelsiusResponse> createRepeated() => $pb.PbList<CelsiusResponse>();
  @$core.pragma('dart2js:noInline')
  static CelsiusResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CelsiusResponse>(create);
  static CelsiusResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get celsius => $_getN(0);
  @$pb.TagNumber(1)
  set celsius($core.double v) { $_setDouble(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCelsius() => $_has(0);
  @$pb.TagNumber(1)
  void clearCelsius() => $_clearField(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
