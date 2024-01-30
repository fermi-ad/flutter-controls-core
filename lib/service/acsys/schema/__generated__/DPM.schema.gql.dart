// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_controls_core/service/acsys/schema/__generated__/serializers.gql.dart'
    as _i2;
import 'package:gql_code_builder/src/serializers/default_scalar_serializer.dart'
    as _i1;

part 'DPM.schema.gql.g.dart';

abstract class GDateTime implements Built<GDateTime, GDateTimeBuilder> {
  GDateTime._();

  factory GDateTime([String? value]) =>
      _$GDateTime((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GDateTime> get serializer =>
      _i1.DefaultScalarSerializer<GDateTime>(
          (Object serialized) => GDateTime((serialized as String?)));
}

abstract class GDevValue implements Built<GDevValue, GDevValueBuilder> {
  GDevValue._();

  factory GDevValue([void Function(GDevValueBuilder b) updates]) = _$GDevValue;

  int? get intVal;
  double? get scalarVal;
  BuiltList<double>? get scalarArrayVal;
  BuiltList<int>? get rawVal;
  String? get textVal;
  BuiltList<String>? get textArrayVal;
  static Serializer<GDevValue> get serializer => _$gDevValueSerializer;

  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GDevValue.serializer,
        this,
      ) as Map<String, dynamic>);

  static GDevValue? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GDevValue.serializer,
        json,
      );
}

const Map<String, Set<String>> possibleTypesMap = {
  'DataType': {
    'StatusReply',
    'Scalar',
    'ScalarArray',
    'Raw',
    'Text',
    'TextArray',
    'StructData',
  },
  'DeviceInfoResult': {
    'DeviceInfo',
    'ErrorReply',
  },
  'DeviceProperty': {
    'ReadingProp',
    'SettingProp',
  },
};
