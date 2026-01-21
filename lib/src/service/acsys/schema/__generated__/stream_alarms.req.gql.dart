// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:flutter_controls_core/src/service/acsys/schema/__generated__/serializers.gql.dart'
    as _i6;
import 'package:flutter_controls_core/src/service/acsys/schema/__generated__/stream_alarms.ast.gql.dart'
    as _i5;
import 'package:flutter_controls_core/src/service/acsys/schema/__generated__/stream_alarms.data.gql.dart'
    as _i2;
import 'package:flutter_controls_core/src/service/acsys/schema/__generated__/stream_alarms.var.gql.dart'
    as _i3;
import 'package:gql_exec/gql_exec.dart' as _i4;

part 'stream_alarms.req.gql.g.dart';

abstract class GStreamAlarmsReq
    implements
        Built<GStreamAlarmsReq, GStreamAlarmsReqBuilder>,
        _i1.OperationRequest<_i2.GStreamAlarmsData, _i3.GStreamAlarmsVars> {
  GStreamAlarmsReq._();

  factory GStreamAlarmsReq([void Function(GStreamAlarmsReqBuilder b) updates]) =
      _$GStreamAlarmsReq;

  static void _initializeBuilder(GStreamAlarmsReqBuilder b) =>
      b
        ..operation = _i4.Operation(
          document: _i5.document,
          operationName: 'StreamAlarms',
        )
        ..executeOnListen = true;

  @override
  _i3.GStreamAlarmsVars get vars;
  @override
  _i4.Operation get operation;
  @override
  _i4.Request get execRequest => _i4.Request(
    operation: operation,
    variables: vars.toJson(),
    context: context ?? const _i4.Context(),
  );

  @override
  String? get requestId;
  @override
  @BuiltValueField(serialize: false)
  _i2.GStreamAlarmsData? Function(
    _i2.GStreamAlarmsData?,
    _i2.GStreamAlarmsData?,
  )?
  get updateResult;
  @override
  _i2.GStreamAlarmsData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  @BuiltValueField(serialize: false)
  _i4.Context? get context;
  @override
  _i2.GStreamAlarmsData? parseData(Map<String, dynamic> json) =>
      _i2.GStreamAlarmsData.fromJson(json);

  @override
  Map<String, dynamic> varsToJson() => vars.toJson();

  @override
  Map<String, dynamic> dataToJson(_i2.GStreamAlarmsData data) => data.toJson();

  @override
  _i1.OperationRequest<_i2.GStreamAlarmsData, _i3.GStreamAlarmsVars>
  transformOperation(_i4.Operation Function(_i4.Operation) transform) =>
      this.rebuild((b) => b..operation = transform(operation));

  static Serializer<GStreamAlarmsReq> get serializer =>
      _$gStreamAlarmsReqSerializer;

  Map<String, dynamic> toJson() =>
      (_i6.serializers.serializeWith(GStreamAlarmsReq.serializer, this)
          as Map<String, dynamic>);

  static GStreamAlarmsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GStreamAlarmsReq.serializer, json);
}
