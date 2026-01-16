// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_controls_core/src/service/acsys/schema/__generated__/serializers.gql.dart'
    as _i1;

part 'stream_alarms.data.gql.g.dart';

abstract class GStreamAlarmsData
    implements Built<GStreamAlarmsData, GStreamAlarmsDataBuilder> {
  GStreamAlarmsData._();

  factory GStreamAlarmsData(
          [void Function(GStreamAlarmsDataBuilder b) updates]) =
      _$GStreamAlarmsData;

  static void _initializeBuilder(GStreamAlarmsDataBuilder b) =>
      b..G__typename = 'Subscription';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get alarms;
  static Serializer<GStreamAlarmsData> get serializer =>
      _$gStreamAlarmsDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GStreamAlarmsData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GStreamAlarmsData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GStreamAlarmsData.serializer,
        json,
      );
}
