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

abstract class GgetDeviceInfoData
    implements Built<GgetDeviceInfoData, GgetDeviceInfoDataBuilder> {
  GgetDeviceInfoData._();

  factory GgetDeviceInfoData([Function(GgetDeviceInfoDataBuilder b) updates]) =
      _$GgetDeviceInfoData;

  static void _initializeBuilder(GgetDeviceInfoDataBuilder b) =>
      b..G__typename = 'Queries';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GgetDeviceInfoData_deviceInfo get deviceInfo;
  static Serializer<GgetDeviceInfoData> get serializer =>
      _$ggetDeviceInfoDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GgetDeviceInfoData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GgetDeviceInfoData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GgetDeviceInfoData.serializer,
        json,
      );
}

abstract class GgetDeviceInfoData_deviceInfo
    implements
        Built<GgetDeviceInfoData_deviceInfo,
            GgetDeviceInfoData_deviceInfoBuilder> {
  GgetDeviceInfoData_deviceInfo._();

  factory GgetDeviceInfoData_deviceInfo(
          [Function(GgetDeviceInfoData_deviceInfoBuilder b) updates]) =
      _$GgetDeviceInfoData_deviceInfo;

  static void _initializeBuilder(GgetDeviceInfoData_deviceInfoBuilder b) =>
      b..G__typename = 'DeviceInfoReply';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GgetDeviceInfoData_deviceInfo_result> get result;
  static Serializer<GgetDeviceInfoData_deviceInfo> get serializer =>
      _$ggetDeviceInfoDataDeviceInfoSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GgetDeviceInfoData_deviceInfo.serializer,
        this,
      ) as Map<String, dynamic>);

  static GgetDeviceInfoData_deviceInfo? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GgetDeviceInfoData_deviceInfo.serializer,
        json,
      );
}

abstract class GgetDeviceInfoData_deviceInfo_result {
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<GgetDeviceInfoData_deviceInfo_result> get serializer =>
      _i2.InlineFragmentSerializer<GgetDeviceInfoData_deviceInfo_result>(
        'GgetDeviceInfoData_deviceInfo_result',
        GgetDeviceInfoData_deviceInfo_result__base,
        {
          'DeviceInfo': GgetDeviceInfoData_deviceInfo_result__asDeviceInfo,
          'ErrorReply': GgetDeviceInfoData_deviceInfo_result__asErrorReply,
        },
      );

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GgetDeviceInfoData_deviceInfo_result.serializer,
        this,
      ) as Map<String, dynamic>);

  static GgetDeviceInfoData_deviceInfo_result? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GgetDeviceInfoData_deviceInfo_result.serializer,
        json,
      );
}

abstract class GgetDeviceInfoData_deviceInfo_result__base
    implements
        Built<GgetDeviceInfoData_deviceInfo_result__base,
            GgetDeviceInfoData_deviceInfo_result__baseBuilder>,
        GgetDeviceInfoData_deviceInfo_result {
  GgetDeviceInfoData_deviceInfo_result__base._();

  factory GgetDeviceInfoData_deviceInfo_result__base(
      [Function(GgetDeviceInfoData_deviceInfo_result__baseBuilder b)
          updates]) = _$GgetDeviceInfoData_deviceInfo_result__base;

  static void _initializeBuilder(
          GgetDeviceInfoData_deviceInfo_result__baseBuilder b) =>
      b..G__typename = 'DeviceInfoResult';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<GgetDeviceInfoData_deviceInfo_result__base>
      get serializer => _$ggetDeviceInfoDataDeviceInfoResultBaseSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GgetDeviceInfoData_deviceInfo_result__base.serializer,
        this,
      ) as Map<String, dynamic>);

  static GgetDeviceInfoData_deviceInfo_result__base? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GgetDeviceInfoData_deviceInfo_result__base.serializer,
        json,
      );
}

abstract class GgetDeviceInfoData_deviceInfo_result__asDeviceInfo
    implements
        Built<GgetDeviceInfoData_deviceInfo_result__asDeviceInfo,
            GgetDeviceInfoData_deviceInfo_result__asDeviceInfoBuilder>,
        GgetDeviceInfoData_deviceInfo_result {
  GgetDeviceInfoData_deviceInfo_result__asDeviceInfo._();

  factory GgetDeviceInfoData_deviceInfo_result__asDeviceInfo(
      [Function(GgetDeviceInfoData_deviceInfo_result__asDeviceInfoBuilder b)
          updates]) = _$GgetDeviceInfoData_deviceInfo_result__asDeviceInfo;

  static void _initializeBuilder(
          GgetDeviceInfoData_deviceInfo_result__asDeviceInfoBuilder b) =>
      b..G__typename = 'DeviceInfo';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get description;
  GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_reading? get reading;
  GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_digControl? get digControl;
  GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus? get digStatus;
  GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_setting? get setting;
  static Serializer<GgetDeviceInfoData_deviceInfo_result__asDeviceInfo>
      get serializer =>
          _$ggetDeviceInfoDataDeviceInfoResultAsDeviceInfoSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GgetDeviceInfoData_deviceInfo_result__asDeviceInfo.serializer,
        this,
      ) as Map<String, dynamic>);

  static GgetDeviceInfoData_deviceInfo_result__asDeviceInfo? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GgetDeviceInfoData_deviceInfo_result__asDeviceInfo.serializer,
        json,
      );
}

abstract class GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_reading
    implements
        Built<GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_reading,
            GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_readingBuilder>,
        GDevicePropertyFields {
  GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_reading._();

  factory GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_reading(
      [Function(
              GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_readingBuilder
                  b)
          updates]) = _$GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_reading;

  static void _initializeBuilder(
          GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_readingBuilder
              b) =>
      b..G__typename = 'ReadingProp';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  double get minVal;
  @override
  double get maxVal;
  @override
  String? get primaryUnits;
  @override
  int get primaryIndex;
  @override
  String? get commonUnits;
  @override
  int get commonIndex;
  @override
  BuiltList<double> get coeff;
  static Serializer<GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_reading>
      get serializer =>
          _$ggetDeviceInfoDataDeviceInfoResultAsDeviceInfoReadingSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_reading.serializer,
        this,
      ) as Map<String, dynamic>);

  static GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_reading? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_reading.serializer,
        json,
      );
}

abstract class GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_digControl
    implements
        Built<GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_digControl,
            GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_digControlBuilder> {
  GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_digControl._();

  factory GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_digControl(
          [Function(
                  GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_digControlBuilder
                      b)
              updates]) =
      _$GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_digControl;

  static void _initializeBuilder(
          GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_digControlBuilder
              b) =>
      b..G__typename = 'DigControl';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<
          GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_digControl_entries>
      get entries;
  static Serializer<
          GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_digControl>
      get serializer =>
          _$ggetDeviceInfoDataDeviceInfoResultAsDeviceInfoDigControlSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_digControl
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_digControl?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_digControl
                .serializer,
            json,
          );
}

abstract class GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_digControl_entries
    implements
        Built<
            GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_digControl_entries,
            GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_digControl_entriesBuilder> {
  GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_digControl_entries._();

  factory GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_digControl_entries(
          [Function(
                  GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_digControl_entriesBuilder
                      b)
              updates]) =
      _$GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_digControl_entries;

  static void _initializeBuilder(
          GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_digControl_entriesBuilder
              b) =>
      b..G__typename = 'DigControlEntry';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int get value;
  String get shortName;
  String get longName;
  static Serializer<
          GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_digControl_entries>
      get serializer =>
          _$ggetDeviceInfoDataDeviceInfoResultAsDeviceInfoDigControlEntriesSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_digControl_entries
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_digControl_entries?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_digControl_entries
                .serializer,
            json,
          );
}

abstract class GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus
    implements
        Built<GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus,
            GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatusBuilder> {
  GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus._();

  factory GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus(
          [Function(
                  GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatusBuilder
                      b)
              updates]) =
      _$GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus;

  static void _initializeBuilder(
          GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatusBuilder
              b) =>
      b..G__typename = 'DigStatus';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<
          GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_extEntries>
      get extEntries;
  BuiltList<
          GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_entries>
      get entries;
  static Serializer<
          GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus>
      get serializer =>
          _$ggetDeviceInfoDataDeviceInfoResultAsDeviceInfoDigStatusSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus.serializer,
        this,
      ) as Map<String, dynamic>);

  static GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus.serializer,
        json,
      );
}

abstract class GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_extEntries
    implements
        Built<
            GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_extEntries,
            GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_extEntriesBuilder> {
  GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_extEntries._();

  factory GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_extEntries(
          [Function(
                  GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_extEntriesBuilder
                      b)
              updates]) =
      _$GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_extEntries;

  static void _initializeBuilder(
          GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_extEntriesBuilder
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
          GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_extEntries>
      get serializer =>
          _$ggetDeviceInfoDataDeviceInfoResultAsDeviceInfoDigStatusExtEntriesSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_extEntries
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_extEntries?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_extEntries
                .serializer,
            json,
          );
}

abstract class GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_entries
    implements
        Built<
            GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_entries,
            GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_entriesBuilder> {
  GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_entries._();

  factory GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_entries(
          [Function(
                  GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_entriesBuilder
                      b)
              updates]) =
      _$GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_entries;

  static void _initializeBuilder(
          GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_entriesBuilder
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
          GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_entries>
      get serializer =>
          _$ggetDeviceInfoDataDeviceInfoResultAsDeviceInfoDigStatusEntriesSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_entries
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_entries?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_entries
                .serializer,
            json,
          );
}

abstract class GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_setting
    implements
        Built<GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_setting,
            GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_settingBuilder>,
        GDevicePropertyFields {
  GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_setting._();

  factory GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_setting(
      [Function(
              GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_settingBuilder
                  b)
          updates]) = _$GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_setting;

  static void _initializeBuilder(
          GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_settingBuilder
              b) =>
      b..G__typename = 'SettingProp';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  double get minVal;
  @override
  double get maxVal;
  @override
  String? get primaryUnits;
  @override
  int get primaryIndex;
  @override
  String? get commonUnits;
  @override
  int get commonIndex;
  @override
  BuiltList<double> get coeff;
  GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_setting_knobInfo
      get knobInfo;
  static Serializer<GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_setting>
      get serializer =>
          _$ggetDeviceInfoDataDeviceInfoResultAsDeviceInfoSettingSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_setting.serializer,
        this,
      ) as Map<String, dynamic>);

  static GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_setting? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_setting.serializer,
        json,
      );
}

abstract class GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_setting_knobInfo
    implements
        Built<
            GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_setting_knobInfo,
            GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_setting_knobInfoBuilder> {
  GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_setting_knobInfo._();

  factory GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_setting_knobInfo(
          [Function(
                  GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_setting_knobInfoBuilder
                      b)
              updates]) =
      _$GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_setting_knobInfo;

  static void _initializeBuilder(
          GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_setting_knobInfoBuilder
              b) =>
      b..G__typename = 'KnobInfo';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  double get minVal;
  double get maxVal;
  double get step;
  static Serializer<
          GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_setting_knobInfo>
      get serializer =>
          _$ggetDeviceInfoDataDeviceInfoResultAsDeviceInfoSettingKnobInfoSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_setting_knobInfo
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_setting_knobInfo?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_setting_knobInfo
                .serializer,
            json,
          );
}

abstract class GgetDeviceInfoData_deviceInfo_result__asErrorReply
    implements
        Built<GgetDeviceInfoData_deviceInfo_result__asErrorReply,
            GgetDeviceInfoData_deviceInfo_result__asErrorReplyBuilder>,
        GgetDeviceInfoData_deviceInfo_result {
  GgetDeviceInfoData_deviceInfo_result__asErrorReply._();

  factory GgetDeviceInfoData_deviceInfo_result__asErrorReply(
      [Function(GgetDeviceInfoData_deviceInfo_result__asErrorReplyBuilder b)
          updates]) = _$GgetDeviceInfoData_deviceInfo_result__asErrorReply;

  static void _initializeBuilder(
          GgetDeviceInfoData_deviceInfo_result__asErrorReplyBuilder b) =>
      b..G__typename = 'ErrorReply';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get message;
  static Serializer<GgetDeviceInfoData_deviceInfo_result__asErrorReply>
      get serializer =>
          _$ggetDeviceInfoDataDeviceInfoResultAsErrorReplySerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GgetDeviceInfoData_deviceInfo_result__asErrorReply.serializer,
        this,
      ) as Map<String, dynamic>);

  static GgetDeviceInfoData_deviceInfo_result__asErrorReply? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GgetDeviceInfoData_deviceInfo_result__asErrorReply.serializer,
        json,
      );
}

abstract class GDevicePropertyFields {
  String get G__typename;
  double get minVal;
  double get maxVal;
  String? get primaryUnits;
  int get primaryIndex;
  String? get commonUnits;
  int get commonIndex;
  BuiltList<double> get coeff;
  Map<String, dynamic> toJson();
}

abstract class GDevicePropertyFieldsData
    implements
        Built<GDevicePropertyFieldsData, GDevicePropertyFieldsDataBuilder>,
        GDevicePropertyFields {
  GDevicePropertyFieldsData._();

  factory GDevicePropertyFieldsData(
          [Function(GDevicePropertyFieldsDataBuilder b) updates]) =
      _$GDevicePropertyFieldsData;

  static void _initializeBuilder(GDevicePropertyFieldsDataBuilder b) =>
      b..G__typename = 'DeviceProperty';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  double get minVal;
  @override
  double get maxVal;
  @override
  String? get primaryUnits;
  @override
  int get primaryIndex;
  @override
  String? get commonUnits;
  @override
  int get commonIndex;
  @override
  BuiltList<double> get coeff;
  static Serializer<GDevicePropertyFieldsData> get serializer =>
      _$gDevicePropertyFieldsDataSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDevicePropertyFieldsData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GDevicePropertyFieldsData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDevicePropertyFieldsData.serializer,
        json,
      );
}
