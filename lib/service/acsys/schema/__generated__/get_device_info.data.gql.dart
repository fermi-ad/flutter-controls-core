// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_controls_core/service/acsys/schema/__generated__/serializers.gql.dart'
    as _i1;
import 'package:gql_code_builder/src/serializers/inline_fragment_serializer.dart'
    as _i2;

part 'get_device_info.data.gql.g.dart';

abstract class GGetDeviceInfoData
    implements Built<GGetDeviceInfoData, GGetDeviceInfoDataBuilder> {
  GGetDeviceInfoData._();

  factory GGetDeviceInfoData(
          [void Function(GGetDeviceInfoDataBuilder b) updates]) =
      _$GGetDeviceInfoData;

  static void _initializeBuilder(GGetDeviceInfoDataBuilder b) =>
      b..G__typename = 'QueryRoot';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GGetDeviceInfoData_deviceInfo get deviceInfo;
  static Serializer<GGetDeviceInfoData> get serializer =>
      _$gGetDeviceInfoDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetDeviceInfoData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetDeviceInfoData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetDeviceInfoData.serializer,
        json,
      );
}

abstract class GGetDeviceInfoData_deviceInfo
    implements
        Built<GGetDeviceInfoData_deviceInfo,
            GGetDeviceInfoData_deviceInfoBuilder> {
  GGetDeviceInfoData_deviceInfo._();

  factory GGetDeviceInfoData_deviceInfo(
          [void Function(GGetDeviceInfoData_deviceInfoBuilder b) updates]) =
      _$GGetDeviceInfoData_deviceInfo;

  static void _initializeBuilder(GGetDeviceInfoData_deviceInfoBuilder b) =>
      b..G__typename = 'DeviceInfoReply';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GGetDeviceInfoData_deviceInfo_result> get result;
  static Serializer<GGetDeviceInfoData_deviceInfo> get serializer =>
      _$gGetDeviceInfoDataDeviceInfoSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetDeviceInfoData_deviceInfo.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetDeviceInfoData_deviceInfo? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetDeviceInfoData_deviceInfo.serializer,
        json,
      );
}

abstract class GGetDeviceInfoData_deviceInfo_result {
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<GGetDeviceInfoData_deviceInfo_result> get serializer =>
      _i2.InlineFragmentSerializer<GGetDeviceInfoData_deviceInfo_result>(
        'GGetDeviceInfoData_deviceInfo_result',
        GGetDeviceInfoData_deviceInfo_result__base,
        {
          'DeviceInfo': GGetDeviceInfoData_deviceInfo_result__asDeviceInfo,
          'ErrorReply': GGetDeviceInfoData_deviceInfo_result__asErrorReply,
        },
      );

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetDeviceInfoData_deviceInfo_result.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetDeviceInfoData_deviceInfo_result? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetDeviceInfoData_deviceInfo_result.serializer,
        json,
      );
}

abstract class GGetDeviceInfoData_deviceInfo_result__base
    implements
        Built<GGetDeviceInfoData_deviceInfo_result__base,
            GGetDeviceInfoData_deviceInfo_result__baseBuilder>,
        GGetDeviceInfoData_deviceInfo_result {
  GGetDeviceInfoData_deviceInfo_result__base._();

  factory GGetDeviceInfoData_deviceInfo_result__base(
      [void Function(GGetDeviceInfoData_deviceInfo_result__baseBuilder b)
          updates]) = _$GGetDeviceInfoData_deviceInfo_result__base;

  static void _initializeBuilder(
          GGetDeviceInfoData_deviceInfo_result__baseBuilder b) =>
      b..G__typename = 'DeviceInfoResult';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<GGetDeviceInfoData_deviceInfo_result__base>
      get serializer => _$gGetDeviceInfoDataDeviceInfoResultBaseSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetDeviceInfoData_deviceInfo_result__base.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetDeviceInfoData_deviceInfo_result__base? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetDeviceInfoData_deviceInfo_result__base.serializer,
        json,
      );
}

abstract class GGetDeviceInfoData_deviceInfo_result__asDeviceInfo
    implements
        Built<GGetDeviceInfoData_deviceInfo_result__asDeviceInfo,
            GGetDeviceInfoData_deviceInfo_result__asDeviceInfoBuilder>,
        GGetDeviceInfoData_deviceInfo_result {
  GGetDeviceInfoData_deviceInfo_result__asDeviceInfo._();

  factory GGetDeviceInfoData_deviceInfo_result__asDeviceInfo(
      [void Function(
              GGetDeviceInfoData_deviceInfo_result__asDeviceInfoBuilder b)
          updates]) = _$GGetDeviceInfoData_deviceInfo_result__asDeviceInfo;

  static void _initializeBuilder(
          GGetDeviceInfoData_deviceInfo_result__asDeviceInfoBuilder b) =>
      b..G__typename = 'DeviceInfo';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get description;
  GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_reading? get reading;
  GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_setting? get setting;
  GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digControl? get digControl;
  GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus? get digStatus;
  static Serializer<GGetDeviceInfoData_deviceInfo_result__asDeviceInfo>
      get serializer =>
          _$gGetDeviceInfoDataDeviceInfoResultAsDeviceInfoSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetDeviceInfoData_deviceInfo_result__asDeviceInfo.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetDeviceInfoData_deviceInfo_result__asDeviceInfo? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetDeviceInfoData_deviceInfo_result__asDeviceInfo.serializer,
        json,
      );
}

abstract class GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_reading
    implements
        Built<GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_reading,
            GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_readingBuilder> {
  GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_reading._();

  factory GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_reading(
      [void Function(
              GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_readingBuilder
                  b)
          updates]) = _$GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_reading;

  static void _initializeBuilder(
          GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_readingBuilder
              b) =>
      b..G__typename = 'DeviceProperty';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get primaryUnits;
  String? get commonUnits;
  static Serializer<GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_reading>
      get serializer =>
          _$gGetDeviceInfoDataDeviceInfoResultAsDeviceInfoReadingSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_reading.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_reading? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_reading.serializer,
        json,
      );
}

abstract class GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_setting
    implements
        Built<GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_setting,
            GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_settingBuilder> {
  GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_setting._();

  factory GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_setting(
      [void Function(
              GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_settingBuilder
                  b)
          updates]) = _$GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_setting;

  static void _initializeBuilder(
          GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_settingBuilder
              b) =>
      b..G__typename = 'DeviceProperty';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get primaryUnits;
  String? get commonUnits;
  static Serializer<GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_setting>
      get serializer =>
          _$gGetDeviceInfoDataDeviceInfoResultAsDeviceInfoSettingSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_setting.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_setting? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_setting.serializer,
        json,
      );
}

abstract class GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digControl
    implements
        Built<GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digControl,
            GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digControlBuilder> {
  GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digControl._();

  factory GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digControl(
          [void Function(
                  GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digControlBuilder
                      b)
              updates]) =
      _$GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digControl;

  static void _initializeBuilder(
          GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digControlBuilder
              b) =>
      b..G__typename = 'DigControl';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<
          GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digControl_entries>
      get entries;
  static Serializer<
          GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digControl>
      get serializer =>
          _$gGetDeviceInfoDataDeviceInfoResultAsDeviceInfoDigControlSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digControl
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digControl?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digControl
                .serializer,
            json,
          );
}

abstract class GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digControl_entries
    implements
        Built<
            GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digControl_entries,
            GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digControl_entriesBuilder> {
  GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digControl_entries._();

  factory GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digControl_entries(
          [void Function(
                  GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digControl_entriesBuilder
                      b)
              updates]) =
      _$GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digControl_entries;

  static void _initializeBuilder(
          GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digControl_entriesBuilder
              b) =>
      b..G__typename = 'DigControlEntry';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int get value;
  String get shortName;
  String get longName;
  static Serializer<
          GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digControl_entries>
      get serializer =>
          _$gGetDeviceInfoDataDeviceInfoResultAsDeviceInfoDigControlEntriesSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digControl_entries
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digControl_entries?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digControl_entries
                .serializer,
            json,
          );
}

abstract class GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus
    implements
        Built<GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus,
            GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatusBuilder> {
  GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus._();

  factory GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus(
          [void Function(
                  GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatusBuilder
                      b)
              updates]) =
      _$GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus;

  static void _initializeBuilder(
          GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatusBuilder
              b) =>
      b..G__typename = 'DigStatus';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<
          GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_extEntries>
      get extEntries;
  BuiltList<
          GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_entries>
      get entries;
  static Serializer<
          GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus>
      get serializer =>
          _$gGetDeviceInfoDataDeviceInfoResultAsDeviceInfoDigStatusSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus.serializer,
        json,
      );
}

abstract class GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_extEntries
    implements
        Built<
            GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_extEntries,
            GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_extEntriesBuilder> {
  GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_extEntries._();

  factory GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_extEntries(
          [void Function(
                  GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_extEntriesBuilder
                      b)
              updates]) =
      _$GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_extEntries;

  static void _initializeBuilder(
          GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_extEntriesBuilder
              b) =>
      b..G__typename = 'DigExtStatusEntry';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int get bitNo;
  int get color0;
  String get name0;
  int get color1;
  String get name1;
  String get description;
  static Serializer<
          GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_extEntries>
      get serializer =>
          _$gGetDeviceInfoDataDeviceInfoResultAsDeviceInfoDigStatusExtEntriesSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_extEntries
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_extEntries?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_extEntries
                .serializer,
            json,
          );
}

abstract class GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_entries
    implements
        Built<
            GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_entries,
            GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_entriesBuilder> {
  GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_entries._();

  factory GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_entries(
          [void Function(
                  GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_entriesBuilder
                      b)
              updates]) =
      _$GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_entries;

  static void _initializeBuilder(
          GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_entriesBuilder
              b) =>
      b..G__typename = 'DigStatusEntry';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int get maskVal;
  int get matchVal;
  bool get invert;
  String get shortName;
  String get longName;
  String get trueStr;
  int get trueColor;
  String get trueChar;
  String get falseStr;
  int get falseColor;
  String get falseChar;
  static Serializer<
          GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_entries>
      get serializer =>
          _$gGetDeviceInfoDataDeviceInfoResultAsDeviceInfoDigStatusEntriesSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_entries
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_entries?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_entries
                .serializer,
            json,
          );
}

abstract class GGetDeviceInfoData_deviceInfo_result__asErrorReply
    implements
        Built<GGetDeviceInfoData_deviceInfo_result__asErrorReply,
            GGetDeviceInfoData_deviceInfo_result__asErrorReplyBuilder>,
        GGetDeviceInfoData_deviceInfo_result {
  GGetDeviceInfoData_deviceInfo_result__asErrorReply._();

  factory GGetDeviceInfoData_deviceInfo_result__asErrorReply(
      [void Function(
              GGetDeviceInfoData_deviceInfo_result__asErrorReplyBuilder b)
          updates]) = _$GGetDeviceInfoData_deviceInfo_result__asErrorReply;

  static void _initializeBuilder(
          GGetDeviceInfoData_deviceInfo_result__asErrorReplyBuilder b) =>
      b..G__typename = 'ErrorReply';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get message;
  static Serializer<GGetDeviceInfoData_deviceInfo_result__asErrorReply>
      get serializer =>
          _$gGetDeviceInfoDataDeviceInfoResultAsErrorReplySerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetDeviceInfoData_deviceInfo_result__asErrorReply.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetDeviceInfoData_deviceInfo_result__asErrorReply? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetDeviceInfoData_deviceInfo_result__asErrorReply.serializer,
        json,
      );
}
