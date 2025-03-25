// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_controls_core/src/service/faas/schema/__generated__/serializers.gql.dart'
    as _i1;

part 'to_clinks.var.gql.g.dart';

abstract class GToClinksVars
    implements Built<GToClinksVars, GToClinksVarsBuilder> {
  GToClinksVars._();

  factory GToClinksVars([void Function(GToClinksVarsBuilder b) updates]) =
      _$GToClinksVars;

  int get time;
  static Serializer<GToClinksVars> get serializer => _$gToClinksVarsSerializer;

  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GToClinksVars.serializer, this)
          as Map<String, dynamic>);

  static GToClinksVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GToClinksVars.serializer, json);
}
