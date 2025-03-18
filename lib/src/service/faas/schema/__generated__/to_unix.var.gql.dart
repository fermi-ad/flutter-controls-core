// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_controls_core/src/service/faas/schema/__generated__/serializers.gql.dart'
    as _i1;

part 'to_unix.var.gql.g.dart';

abstract class GToUnixVars implements Built<GToUnixVars, GToUnixVarsBuilder> {
  GToUnixVars._();

  factory GToUnixVars([void Function(GToUnixVarsBuilder b) updates]) =
      _$GToUnixVars;

  int get clinks;
  static Serializer<GToUnixVars> get serializer => _$gToUnixVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GToUnixVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GToUnixVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GToUnixVars.serializer,
        json,
      );
}
