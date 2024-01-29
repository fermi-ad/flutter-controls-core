// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:flutter_controls_core/service/acsys/schema/__generated__/get_device_info.ast.gql.dart'
    as _i5;
import 'package:flutter_controls_core/service/acsys/schema/__generated__/get_device_info.data.gql.dart'
    as _i2;
import 'package:flutter_controls_core/service/acsys/schema/__generated__/get_device_info.var.gql.dart'
    as _i3;
import 'package:flutter_controls_core/service/acsys/schema/__generated__/serializers.gql.dart'
    as _i6;
import 'package:gql/ast.dart' as _i7;
import 'package:gql_exec/gql_exec.dart' as _i4;

part 'get_device_info.req.gql.g.dart';

abstract class GgetDeviceInfoReq
    implements
        Built<GgetDeviceInfoReq, GgetDeviceInfoReqBuilder>,
        _i1.OperationRequest<_i2.GgetDeviceInfoData, _i3.GgetDeviceInfoVars> {
  GgetDeviceInfoReq._();

  factory GgetDeviceInfoReq(
          [void Function(GgetDeviceInfoReqBuilder b) updates]) =
      _$GgetDeviceInfoReq;

  static void _initializeBuilder(GgetDeviceInfoReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'getDeviceInfo',
    )
    ..executeOnListen = true;

  @override
  _i3.GgetDeviceInfoVars get vars;
  @override
  _i4.Operation get operation;
  @override
  _i4.Request get execRequest => _i4.Request(
        operation: operation,
        variables: vars.toJson(),
      );

  @override
  String? get requestId;
  @override
  @BuiltValueField(serialize: false)
  _i2.GgetDeviceInfoData? Function(
    _i2.GgetDeviceInfoData?,
    _i2.GgetDeviceInfoData?,
  )? get updateResult;
  @override
  _i2.GgetDeviceInfoData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GgetDeviceInfoData? parseData(Map<String, dynamic> json) =>
      _i2.GgetDeviceInfoData.fromJson(json);

  @override
  Map<String, dynamic> varsToJson() => vars.toJson();

  @override
  Map<String, dynamic> dataToJson(_i2.GgetDeviceInfoData data) => data.toJson();

  @override
  _i1.OperationRequest<_i2.GgetDeviceInfoData, _i3.GgetDeviceInfoVars>
      transformOperation(_i4.Operation Function(_i4.Operation) transform) =>
          this.rebuild((b) => b..operation = transform(operation));

  static Serializer<GgetDeviceInfoReq> get serializer =>
      _$ggetDeviceInfoReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GgetDeviceInfoReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GgetDeviceInfoReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GgetDeviceInfoReq.serializer,
        json,
      );
}

abstract class GDevicePropertyFieldsReq
    implements
        Built<GDevicePropertyFieldsReq, GDevicePropertyFieldsReqBuilder>,
        _i1.FragmentRequest<_i2.GDevicePropertyFieldsData,
            _i3.GDevicePropertyFieldsVars> {
  GDevicePropertyFieldsReq._();

  factory GDevicePropertyFieldsReq(
          [void Function(GDevicePropertyFieldsReqBuilder b) updates]) =
      _$GDevicePropertyFieldsReq;

  static void _initializeBuilder(GDevicePropertyFieldsReqBuilder b) => b
    ..document = _i5.document
    ..fragmentName = 'DevicePropertyFields';

  @override
  _i3.GDevicePropertyFieldsVars get vars;
  @override
  _i7.DocumentNode get document;
  @override
  String? get fragmentName;
  @override
  Map<String, dynamic> get idFields;
  @override
  _i2.GDevicePropertyFieldsData? parseData(Map<String, dynamic> json) =>
      _i2.GDevicePropertyFieldsData.fromJson(json);

  @override
  Map<String, dynamic> varsToJson() => vars.toJson();

  @override
  Map<String, dynamic> dataToJson(_i2.GDevicePropertyFieldsData data) =>
      data.toJson();

  static Serializer<GDevicePropertyFieldsReq> get serializer =>
      _$gDevicePropertyFieldsReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GDevicePropertyFieldsReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GDevicePropertyFieldsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GDevicePropertyFieldsReq.serializer,
        json,
      );
}
