// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_controls_core/src/service/acsys/schema/__generated__/serializers.gql.dart'
    as _i1;

part 'read_alarms.data.gql.g.dart';

abstract class GAlarmsSnapshotData
    implements Built<GAlarmsSnapshotData, GAlarmsSnapshotDataBuilder> {
  GAlarmsSnapshotData._();

  factory GAlarmsSnapshotData([
    void Function(GAlarmsSnapshotDataBuilder b) updates,
  ]) = _$GAlarmsSnapshotData;

  static void _initializeBuilder(GAlarmsSnapshotDataBuilder b) =>
      b..G__typename = 'Query';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GAlarmsSnapshotData_alarmsSnapshot get alarmsSnapshot;
  static Serializer<GAlarmsSnapshotData> get serializer =>
      _$gAlarmsSnapshotDataSerializer;

  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GAlarmsSnapshotData.serializer, this)
          as Map<String, dynamic>);

  static GAlarmsSnapshotData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GAlarmsSnapshotData.serializer, json);
}

abstract class GAlarmsSnapshotData_alarmsSnapshot
    implements
        Built<
          GAlarmsSnapshotData_alarmsSnapshot,
          GAlarmsSnapshotData_alarmsSnapshotBuilder
        > {
  GAlarmsSnapshotData_alarmsSnapshot._();

  factory GAlarmsSnapshotData_alarmsSnapshot([
    void Function(GAlarmsSnapshotData_alarmsSnapshotBuilder b) updates,
  ]) = _$GAlarmsSnapshotData_alarmsSnapshot;

  static void _initializeBuilder(GAlarmsSnapshotData_alarmsSnapshotBuilder b) =>
      b..G__typename = 'Message';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get key;
  String get value;
  static Serializer<GAlarmsSnapshotData_alarmsSnapshot> get serializer =>
      _$gAlarmsSnapshotDataAlarmsSnapshotSerializer;

  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(
            GAlarmsSnapshotData_alarmsSnapshot.serializer,
            this,
          )
          as Map<String, dynamic>);

  static GAlarmsSnapshotData_alarmsSnapshot? fromJson(
    Map<String, dynamic> json,
  ) => _i1.serializers.deserializeWith(
    GAlarmsSnapshotData_alarmsSnapshot.serializer,
    json,
  );
}
