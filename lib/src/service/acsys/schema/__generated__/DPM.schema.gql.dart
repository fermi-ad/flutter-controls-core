// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_controls_core/src/service/acsys/schema/__generated__/serializers.gql.dart'
    as _i1;
import 'package:gql_code_builder_serializers/gql_code_builder_serializers.dart'
    as _i2;

part 'DPM.schema.gql.g.dart';

abstract class GDevValue implements Built<GDevValue, GDevValueBuilder> {
  GDevValue._();

  factory GDevValue([void Function(GDevValueBuilder b) updates]) = _$GDevValue;

  int? get intVal;
  double? get scalarVal;
  BuiltList<double>? get scalarArrayVal;
  BuiltList<int>? get rawVal;
  String? get textVal;
  BuiltList<String>? get textArrayVal;
  BuiltList<GTimeSeriesEntryIn>? get timeSeriesVal;
  static Serializer<GDevValue> get serializer => _$gDevValueSerializer;

  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GDevValue.serializer, this)
          as Map<String, dynamic>);

  static GDevValue? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GDevValue.serializer, json);
}

abstract class GTimeSeriesEntryIn
    implements Built<GTimeSeriesEntryIn, GTimeSeriesEntryInBuilder> {
  GTimeSeriesEntryIn._();

  factory GTimeSeriesEntryIn([
    void Function(GTimeSeriesEntryInBuilder b) updates,
  ]) = _$GTimeSeriesEntryIn;

  double get stamp;
  double get value;
  static Serializer<GTimeSeriesEntryIn> get serializer =>
      _$gTimeSeriesEntryInSerializer;

  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GTimeSeriesEntryIn.serializer, this)
          as Map<String, dynamic>);

  static GTimeSeriesEntryIn? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GTimeSeriesEntryIn.serializer, json);
}

abstract class GDateTime implements Built<GDateTime, GDateTimeBuilder> {
  GDateTime._();

  factory GDateTime([String? value]) =>
      _$GDateTime((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GDateTime> get serializer =>
      _i2.DefaultScalarSerializer<GDateTime>(
        (Object serialized) => GDateTime((serialized as String?)),
      );
}

class GSeverity extends EnumClass {
  const GSeverity._(String name) : super(name);

  static const GSeverity UNKNOWN = _$gSeverityUNKNOWN;

  static const GSeverity LOW = _$gSeverityLOW;

  static const GSeverity HIGH = _$gSeverityHIGH;

  static Serializer<GSeverity> get serializer => _$gSeveritySerializer;

  static BuiltSet<GSeverity> get values => _$gSeverityValues;

  static GSeverity valueOf(String name) => _$gSeverityValueOf(name);
}

class GSource extends EnumClass {
  const GSource._(String name) : super(name);

  static const GSource UNKNOWN = _$gSourceUNKNOWN;

  static const GSource ANALOG = _$gSourceANALOG;

  static const GSource DIGITAL = _$gSourceDIGITAL;

  static const GSource EPICS = _$gSourceEPICS;

  static Serializer<GSource> get serializer => _$gSourceSerializer;

  static BuiltSet<GSource> get values => _$gSourceValues;

  static GSource valueOf(String name) => _$gSourceValueOf(name);
}

class GState extends EnumClass {
  const GState._(String name) : super(name);

  static const GState UNKNOWN = _$gStateUNKNOWN;

  static const GState OK = _$gStateOK;

  static const GState ALARMED = _$gStateALARMED;

  static const GState BYPASSED = _$gStateBYPASSED;

  static const GState LATCHED = _$gStateLATCHED;

  static const GState ACKNOWLEDGED = _$gStateACKNOWLEDGED;

  static const GState UNBYPASSED = _$gStateUNBYPASSED;

  static Serializer<GState> get serializer => _$gStateSerializer;

  static BuiltSet<GState> get values => _$gStateValues;

  static GState valueOf(String name) => _$gStateValueOf(name);
}

const Map<String, Set<String>> possibleTypesMap = {
  'DataType': {
    'StatusReply',
    'Scalar',
    'ScalarArray',
    'Raw',
    'Text',
    'TextArray',
    'TimeSeries',
    'StructData',
  },
};
