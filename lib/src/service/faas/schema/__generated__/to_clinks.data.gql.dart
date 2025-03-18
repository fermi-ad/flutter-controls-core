// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_controls_core/src/service/faas/schema/__generated__/serializers.gql.dart'
    as _i1;

part 'to_clinks.data.gql.g.dart';

abstract class GToClinksData
    implements Built<GToClinksData, GToClinksDataBuilder> {
  GToClinksData._();

  factory GToClinksData([void Function(GToClinksDataBuilder b) updates]) =
      _$GToClinksData;

  static void _initializeBuilder(GToClinksDataBuilder b) =>
      b..G__typename = 'Query';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int? get unixToClinks;
  static Serializer<GToClinksData> get serializer => _$gToClinksDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GToClinksData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GToClinksData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GToClinksData.serializer,
        json,
      );
}
