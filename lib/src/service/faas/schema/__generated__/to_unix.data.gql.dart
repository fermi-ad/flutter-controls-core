// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_controls_core/src/service/faas/schema/__generated__/serializers.gql.dart'
    as _i1;

part 'to_unix.data.gql.g.dart';

abstract class GToUnixData implements Built<GToUnixData, GToUnixDataBuilder> {
  GToUnixData._();

  factory GToUnixData([void Function(GToUnixDataBuilder b) updates]) =
      _$GToUnixData;

  static void _initializeBuilder(GToUnixDataBuilder b) =>
      b..G__typename = 'Query';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int get clinksToUnix;
  static Serializer<GToUnixData> get serializer => _$gToUnixDataSerializer;

  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GToUnixData.serializer, this)
          as Map<String, dynamic>);

  static GToUnixData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GToUnixData.serializer, json);
}
