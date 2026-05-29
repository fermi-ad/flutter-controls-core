// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_controls_core/src/service/acsys/schema/__generated__/DPM.schema.gql.dart'
    as _i2;
import 'package:flutter_controls_core/src/service/acsys/schema/__generated__/serializers.gql.dart'
    as _i1;

part 'stream_alarms.data.gql.g.dart';

abstract class GStreamAlarmsData
    implements Built<GStreamAlarmsData, GStreamAlarmsDataBuilder> {
  GStreamAlarmsData._();

  factory GStreamAlarmsData([
    void Function(GStreamAlarmsDataBuilder b) updates,
  ]) = _$GStreamAlarmsData;

  static void _initializeBuilder(GStreamAlarmsDataBuilder b) =>
      b..G__typename = 'Subscription';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GStreamAlarmsData_alarms get alarms;
  static Serializer<GStreamAlarmsData> get serializer =>
      _$gStreamAlarmsDataSerializer;

  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GStreamAlarmsData.serializer, this)
          as Map<String, dynamic>);

  static GStreamAlarmsData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GStreamAlarmsData.serializer, json);
}

abstract class GStreamAlarmsData_alarms
    implements
        Built<GStreamAlarmsData_alarms, GStreamAlarmsData_alarmsBuilder> {
  GStreamAlarmsData_alarms._();

  factory GStreamAlarmsData_alarms([
    void Function(GStreamAlarmsData_alarmsBuilder b) updates,
  ]) = _$GStreamAlarmsData_alarms;

  static void _initializeBuilder(GStreamAlarmsData_alarmsBuilder b) =>
      b..G__typename = 'Alarm';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get device;
  _i2.GSource get source;
  _i2.GState get state;
  _i2.GSeverity get severity;
  bool get acknowledgeable;
  _i2.GDateTime? get time;
  String get epicsType;
  String get user;
  _i2.GDateTime? get wake;
  static Serializer<GStreamAlarmsData_alarms> get serializer =>
      _$gStreamAlarmsDataAlarmsSerializer;

  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GStreamAlarmsData_alarms.serializer, this)
          as Map<String, dynamic>);

  static GStreamAlarmsData_alarms? fromJson(Map<String, dynamic> json) => _i1
      .serializers
      .deserializeWith(GStreamAlarmsData_alarms.serializer, json);
}
