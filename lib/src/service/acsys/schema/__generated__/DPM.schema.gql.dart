// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_controls_core/src/service/acsys/schema/__generated__/serializers.gql.dart'
    as _i1;

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
