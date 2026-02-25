// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_controls_core/src/service/acsys/schema/__generated__/serializers.gql.dart'
    as _i1;

part 'users_last_config.data.gql.g.dart';

abstract class GUsersLastConfigData
    implements Built<GUsersLastConfigData, GUsersLastConfigDataBuilder> {
  GUsersLastConfigData._();

  factory GUsersLastConfigData([
    void Function(GUsersLastConfigDataBuilder b) updates,
  ]) = _$GUsersLastConfigData;

  static void _initializeBuilder(GUsersLastConfigDataBuilder b) =>
      b..G__typename = 'Query';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get usersLastConfiguration;
  static Serializer<GUsersLastConfigData> get serializer =>
      _$gUsersLastConfigDataSerializer;

  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GUsersLastConfigData.serializer, this)
          as Map<String, dynamic>);

  static GUsersLastConfigData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GUsersLastConfigData.serializer, json);
}
