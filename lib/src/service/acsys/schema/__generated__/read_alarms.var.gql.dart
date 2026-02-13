// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_controls_core/src/service/acsys/schema/__generated__/serializers.gql.dart'
    as _i1;

part 'read_alarms.var.gql.g.dart';

abstract class GAlarmsSnapshotVars
    implements Built<GAlarmsSnapshotVars, GAlarmsSnapshotVarsBuilder> {
  GAlarmsSnapshotVars._();

  factory GAlarmsSnapshotVars([
    void Function(GAlarmsSnapshotVarsBuilder b) updates,
  ]) = _$GAlarmsSnapshotVars;

  static Serializer<GAlarmsSnapshotVars> get serializer =>
      _$gAlarmsSnapshotVarsSerializer;

  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GAlarmsSnapshotVars.serializer, this)
          as Map<String, dynamic>);

  static GAlarmsSnapshotVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GAlarmsSnapshotVars.serializer, json);
}
