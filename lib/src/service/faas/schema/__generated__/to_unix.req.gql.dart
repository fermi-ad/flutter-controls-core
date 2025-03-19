// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:flutter_controls_core/src/service/faas/schema/__generated__/serializers.gql.dart'
    as _i6;
import 'package:flutter_controls_core/src/service/faas/schema/__generated__/to_unix.ast.gql.dart'
    as _i5;
import 'package:flutter_controls_core/src/service/faas/schema/__generated__/to_unix.data.gql.dart'
    as _i2;
import 'package:flutter_controls_core/src/service/faas/schema/__generated__/to_unix.var.gql.dart'
    as _i3;
import 'package:gql_exec/gql_exec.dart' as _i4;

part 'to_unix.req.gql.g.dart';

abstract class GToUnixReq
    implements
        Built<GToUnixReq, GToUnixReqBuilder>,
        _i1.OperationRequest<_i2.GToUnixData, _i3.GToUnixVars> {
  GToUnixReq._();

  factory GToUnixReq([void Function(GToUnixReqBuilder b) updates]) =
      _$GToUnixReq;

  static void _initializeBuilder(GToUnixReqBuilder b) =>
      b
        ..operation = _i4.Operation(
          document: _i5.document,
          operationName: 'ToUnix',
        )
        ..executeOnListen = true;

  @override
  _i3.GToUnixVars get vars;
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
  _i2.GToUnixData? Function(_i2.GToUnixData?, _i2.GToUnixData?)?
  get updateResult;
  @override
  _i2.GToUnixData? get optimisticResponse;
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
  _i2.GToUnixData? parseData(Map<String, dynamic> json) =>
      _i2.GToUnixData.fromJson(json);

  @override
  Map<String, dynamic> varsToJson() => vars.toJson();

  @override
  Map<String, dynamic> dataToJson(_i2.GToUnixData data) => data.toJson();

  @override
  _i1.OperationRequest<_i2.GToUnixData, _i3.GToUnixVars> transformOperation(
    _i4.Operation Function(_i4.Operation) transform,
  ) => this.rebuild((b) => b..operation = transform(operation));

  static Serializer<GToUnixReq> get serializer => _$gToUnixReqSerializer;

  Map<String, dynamic> toJson() =>
      (_i6.serializers.serializeWith(GToUnixReq.serializer, this)
          as Map<String, dynamic>);

  static GToUnixReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GToUnixReq.serializer, json);
}
