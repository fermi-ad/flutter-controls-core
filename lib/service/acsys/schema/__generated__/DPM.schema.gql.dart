// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_controls_core/service/acsys/schema/__generated__/serializers.gql.dart'
    as _i1;

part 'DPM.schema.gql.g.dart';

abstract class GDevValue implements Built<GDevValue, GDevValueBuilder> {
  GDevValue._();

  factory GDevValue([Function(GDevValueBuilder b) updates]) = _$GDevValue;

  int? get intVal;
  double? get scalarVal;
  BuiltList<double>? get scalarArrayVal;
  BuiltList<int>? get rawVal;
  String? get textVal;
  BuiltList<String>? get textArrayVal;
  static Serializer<GDevValue> get serializer => _$gDevValueSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDevValue.serializer,
        this,
      ) as Map<String, dynamic>);

  static GDevValue? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDevValue.serializer,
        json,
      );
}

abstract class GXformAvgExpr
    implements Built<GXformAvgExpr, GXformAvgExprBuilder> {
  GXformAvgExpr._();

  factory GXformAvgExpr([Function(GXformAvgExprBuilder b) updates]) =
      _$GXformAvgExpr;

  GXformExpr get expr;
  int get n;
  static Serializer<GXformAvgExpr> get serializer => _$gXformAvgExprSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GXformAvgExpr.serializer,
        this,
      ) as Map<String, dynamic>);

  static GXformAvgExpr? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GXformAvgExpr.serializer,
        json,
      );
}

abstract class GXformDeviceExpr
    implements Built<GXformDeviceExpr, GXformDeviceExprBuilder> {
  GXformDeviceExpr._();

  factory GXformDeviceExpr([Function(GXformDeviceExprBuilder b) updates]) =
      _$GXformDeviceExpr;

  String get device;
  static Serializer<GXformDeviceExpr> get serializer =>
      _$gXformDeviceExprSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GXformDeviceExpr.serializer,
        this,
      ) as Map<String, dynamic>);

  static GXformDeviceExpr? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GXformDeviceExpr.serializer,
        json,
      );
}

abstract class GXformExpr implements Built<GXformExpr, GXformExprBuilder> {
  GXformExpr._();

  factory GXformExpr([Function(GXformExprBuilder b) updates]) = _$GXformExpr;

  GXformDeviceExpr? get devEx;
  GXformAvgExpr? get avgEx;
  static Serializer<GXformExpr> get serializer => _$gXformExprSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GXformExpr.serializer,
        this,
      ) as Map<String, dynamic>);

  static GXformExpr? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GXformExpr.serializer,
        json,
      );
}

abstract class GXformRequest
    implements Built<GXformRequest, GXformRequestBuilder> {
  GXformRequest._();

  factory GXformRequest([Function(GXformRequestBuilder b) updates]) =
      _$GXformRequest;

  String get event;
  GXformExpr get expr;
  static Serializer<GXformRequest> get serializer => _$gXformRequestSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GXformRequest.serializer,
        this,
      ) as Map<String, dynamic>);

  static GXformRequest? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GXformRequest.serializer,
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
  }
};
