// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart' show StandardJsonPlugin;
import 'package:ferry_exec/ferry_exec.dart';
import 'package:flutter_controls_core/src/service/date_serializer.dart'
    show DateSerializer;
import 'package:flutter_controls_core/src/service/faas/schema/__generated__/to_clinks.data.gql.dart'
    show GToClinksData;
import 'package:flutter_controls_core/src/service/faas/schema/__generated__/to_clinks.req.gql.dart'
    show GToClinksReq;
import 'package:flutter_controls_core/src/service/faas/schema/__generated__/to_clinks.var.gql.dart'
    show GToClinksVars;
import 'package:flutter_controls_core/src/service/faas/schema/__generated__/to_unix.data.gql.dart'
    show GToUnixData;
import 'package:flutter_controls_core/src/service/faas/schema/__generated__/to_unix.req.gql.dart'
    show GToUnixReq;
import 'package:flutter_controls_core/src/service/faas/schema/__generated__/to_unix.var.gql.dart'
    show GToUnixVars;
import 'package:gql_code_builder_serializers/gql_code_builder_serializers.dart'
    show OperationSerializer;

part 'serializers.gql.g.dart';

final SerializersBuilder _serializersBuilder = _$serializers.toBuilder()
  ..add(OperationSerializer())
  ..add(DateSerializer())
  ..addPlugin(StandardJsonPlugin());
@SerializersFor([
  GToClinksData,
  GToClinksReq,
  GToClinksVars,
  GToUnixData,
  GToUnixReq,
  GToUnixVars,
])
final Serializers serializers = _serializersBuilder.build();
