// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_controls_core/service/acsys/schema/__generated__/serializers.gql.dart'
    as _i1;

part 'get_device_info.var.gql.g.dart';

abstract class GgetDeviceInfoVars
    implements Built<GgetDeviceInfoVars, GgetDeviceInfoVarsBuilder> {
  GgetDeviceInfoVars._();

  factory GgetDeviceInfoVars(
          [void Function(GgetDeviceInfoVarsBuilder b) updates]) =
      _$GgetDeviceInfoVars;

  BuiltList<String> get devices;
  static Serializer<GgetDeviceInfoVars> get serializer =>
      _$ggetDeviceInfoVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GgetDeviceInfoVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GgetDeviceInfoVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GgetDeviceInfoVars.serializer,
        json,
      );
}

abstract class GDevicePropertyFieldsVars
    implements
        Built<GDevicePropertyFieldsVars, GDevicePropertyFieldsVarsBuilder> {
  GDevicePropertyFieldsVars._();

  factory GDevicePropertyFieldsVars(
          [void Function(GDevicePropertyFieldsVarsBuilder b) updates]) =
      _$GDevicePropertyFieldsVars;

  static Serializer<GDevicePropertyFieldsVars> get serializer =>
      _$gDevicePropertyFieldsVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDevicePropertyFieldsVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GDevicePropertyFieldsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDevicePropertyFieldsVars.serializer,
        json,
      );
}
