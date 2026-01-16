// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_controls_core/src/service/acsys/schema/__generated__/serializers.gql.dart'
    as _i1;

part 'stream_alarms.var.gql.g.dart';

abstract class GStreamAlarmsVars
    implements Built<GStreamAlarmsVars, GStreamAlarmsVarsBuilder> {
  GStreamAlarmsVars._();

  factory GStreamAlarmsVars(
          [void Function(GStreamAlarmsVarsBuilder b) updates]) =
      _$GStreamAlarmsVars;

  static Serializer<GStreamAlarmsVars> get serializer =>
      _$gStreamAlarmsVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GStreamAlarmsVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GStreamAlarmsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GStreamAlarmsVars.serializer,
        json,
      );
}
