// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_device_info.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GGetDeviceInfoData> _$gGetDeviceInfoDataSerializer =
    new _$GGetDeviceInfoDataSerializer();
Serializer<GGetDeviceInfoData_deviceInfo>
    _$gGetDeviceInfoDataDeviceInfoSerializer =
    new _$GGetDeviceInfoData_deviceInfoSerializer();
Serializer<GGetDeviceInfoData_deviceInfo_result__base>
    _$gGetDeviceInfoDataDeviceInfoResultBaseSerializer =
    new _$GGetDeviceInfoData_deviceInfo_result__baseSerializer();
Serializer<GGetDeviceInfoData_deviceInfo_result__asDeviceInfo>
    _$gGetDeviceInfoDataDeviceInfoResultAsDeviceInfoSerializer =
    new _$GGetDeviceInfoData_deviceInfo_result__asDeviceInfoSerializer();
Serializer<GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_reading>
    _$gGetDeviceInfoDataDeviceInfoResultAsDeviceInfoReadingSerializer =
    new _$GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_readingSerializer();
Serializer<GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_setting>
    _$gGetDeviceInfoDataDeviceInfoResultAsDeviceInfoSettingSerializer =
    new _$GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_settingSerializer();
Serializer<GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus>
    _$gGetDeviceInfoDataDeviceInfoResultAsDeviceInfoDigStatusSerializer =
    new _$GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatusSerializer();
Serializer<GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_entries>
    _$gGetDeviceInfoDataDeviceInfoResultAsDeviceInfoDigStatusEntriesSerializer =
    new _$GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_entriesSerializer();
Serializer<GGetDeviceInfoData_deviceInfo_result__asErrorReply>
    _$gGetDeviceInfoDataDeviceInfoResultAsErrorReplySerializer =
    new _$GGetDeviceInfoData_deviceInfo_result__asErrorReplySerializer();

class _$GGetDeviceInfoDataSerializer
    implements StructuredSerializer<GGetDeviceInfoData> {
  @override
  final Iterable<Type> types = const [GGetDeviceInfoData, _$GGetDeviceInfoData];
  @override
  final String wireName = 'GGetDeviceInfoData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetDeviceInfoData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'deviceInfo',
      serializers.serialize(object.deviceInfo,
          specifiedType: const FullType(GGetDeviceInfoData_deviceInfo)),
    ];

    return result;
  }

  @override
  GGetDeviceInfoData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetDeviceInfoDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'deviceInfo':
          result.deviceInfo.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GGetDeviceInfoData_deviceInfo))!
              as GGetDeviceInfoData_deviceInfo);
          break;
      }
    }

    return result.build();
  }
}

class _$GGetDeviceInfoData_deviceInfoSerializer
    implements StructuredSerializer<GGetDeviceInfoData_deviceInfo> {
  @override
  final Iterable<Type> types = const [
    GGetDeviceInfoData_deviceInfo,
    _$GGetDeviceInfoData_deviceInfo
  ];
  @override
  final String wireName = 'GGetDeviceInfoData_deviceInfo';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetDeviceInfoData_deviceInfo object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'result',
      serializers.serialize(object.result,
          specifiedType: const FullType(BuiltList,
              const [const FullType(GGetDeviceInfoData_deviceInfo_result)])),
    ];

    return result;
  }

  @override
  GGetDeviceInfoData_deviceInfo deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetDeviceInfoData_deviceInfoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'result':
          result.result.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GGetDeviceInfoData_deviceInfo_result)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GGetDeviceInfoData_deviceInfo_result__baseSerializer
    implements
        StructuredSerializer<GGetDeviceInfoData_deviceInfo_result__base> {
  @override
  final Iterable<Type> types = const [
    GGetDeviceInfoData_deviceInfo_result__base,
    _$GGetDeviceInfoData_deviceInfo_result__base
  ];
  @override
  final String wireName = 'GGetDeviceInfoData_deviceInfo_result__base';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GGetDeviceInfoData_deviceInfo_result__base object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GGetDeviceInfoData_deviceInfo_result__base deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetDeviceInfoData_deviceInfo_result__baseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GGetDeviceInfoData_deviceInfo_result__asDeviceInfoSerializer
    implements
        StructuredSerializer<
            GGetDeviceInfoData_deviceInfo_result__asDeviceInfo> {
  @override
  final Iterable<Type> types = const [
    GGetDeviceInfoData_deviceInfo_result__asDeviceInfo,
    _$GGetDeviceInfoData_deviceInfo_result__asDeviceInfo
  ];
  @override
  final String wireName = 'GGetDeviceInfoData_deviceInfo_result__asDeviceInfo';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GGetDeviceInfoData_deviceInfo_result__asDeviceInfo object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'description',
      serializers.serialize(object.description,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.reading;
    if (value != null) {
      result
        ..add('reading')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_reading)));
    }
    value = object.setting;
    if (value != null) {
      result
        ..add('setting')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_setting)));
    }
    value = object.digStatus;
    if (value != null) {
      result
        ..add('digStatus')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus)));
    }
    return result;
  }

  @override
  GGetDeviceInfoData_deviceInfo_result__asDeviceInfo deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GGetDeviceInfoData_deviceInfo_result__asDeviceInfoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'reading':
          result.reading.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_reading))!
              as GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_reading);
          break;
        case 'setting':
          result.setting.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_setting))!
              as GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_setting);
          break;
        case 'digStatus':
          result.digStatus.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus))!
              as GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus);
          break;
      }
    }

    return result.build();
  }
}

class _$GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_readingSerializer
    implements
        StructuredSerializer<
            GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_reading> {
  @override
  final Iterable<Type> types = const [
    GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_reading,
    _$GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_reading
  ];
  @override
  final String wireName =
      'GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_reading';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_reading object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.primaryUnits;
    if (value != null) {
      result
        ..add('primaryUnits')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.commonUnits;
    if (value != null) {
      result
        ..add('commonUnits')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_reading deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_readingBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'primaryUnits':
          result.primaryUnits = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'commonUnits':
          result.commonUnits = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_settingSerializer
    implements
        StructuredSerializer<
            GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_setting> {
  @override
  final Iterable<Type> types = const [
    GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_setting,
    _$GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_setting
  ];
  @override
  final String wireName =
      'GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_setting';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_setting object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.primaryUnits;
    if (value != null) {
      result
        ..add('primaryUnits')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.commonUnits;
    if (value != null) {
      result
        ..add('commonUnits')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_setting deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_settingBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'primaryUnits':
          result.primaryUnits = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'commonUnits':
          result.commonUnits = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatusSerializer
    implements
        StructuredSerializer<
            GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus> {
  @override
  final Iterable<Type> types = const [
    GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus,
    _$GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus
  ];
  @override
  final String wireName =
      'GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'entries',
      serializers.serialize(object.entries,
          specifiedType: const FullType(BuiltList, const [
            const FullType(
                GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_entries)
          ])),
    ];

    return result;
  }

  @override
  GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatusBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'entries':
          result.entries.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_entries)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_entriesSerializer
    implements
        StructuredSerializer<
            GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_entries> {
  @override
  final Iterable<Type> types = const [
    GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_entries,
    _$GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_entries
  ];
  @override
  final String wireName =
      'GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_entries';

  @override
  Iterable<Object?> serialize(
      Serializers serializers,
      GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_entries
          object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'maskVal',
      serializers.serialize(object.maskVal, specifiedType: const FullType(int)),
      'matchVal',
      serializers.serialize(object.matchVal,
          specifiedType: const FullType(int)),
      'invert',
      serializers.serialize(object.invert, specifiedType: const FullType(bool)),
      'shortName',
      serializers.serialize(object.shortName,
          specifiedType: const FullType(String)),
      'longName',
      serializers.serialize(object.longName,
          specifiedType: const FullType(String)),
      'trueStr',
      serializers.serialize(object.trueStr,
          specifiedType: const FullType(String)),
      'trueColor',
      serializers.serialize(object.trueColor,
          specifiedType: const FullType(int)),
      'trueChar',
      serializers.serialize(object.trueChar,
          specifiedType: const FullType(String)),
      'falseStr',
      serializers.serialize(object.falseStr,
          specifiedType: const FullType(String)),
      'falseColor',
      serializers.serialize(object.falseColor,
          specifiedType: const FullType(int)),
      'falseChar',
      serializers.serialize(object.falseChar,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_entries
      deserialize(Serializers serializers, Iterable<Object?> serialized,
          {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_entriesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'maskVal':
          result.maskVal = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'matchVal':
          result.matchVal = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'invert':
          result.invert = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
        case 'shortName':
          result.shortName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'longName':
          result.longName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'trueStr':
          result.trueStr = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'trueColor':
          result.trueColor = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'trueChar':
          result.trueChar = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'falseStr':
          result.falseStr = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'falseColor':
          result.falseColor = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'falseChar':
          result.falseChar = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GGetDeviceInfoData_deviceInfo_result__asErrorReplySerializer
    implements
        StructuredSerializer<
            GGetDeviceInfoData_deviceInfo_result__asErrorReply> {
  @override
  final Iterable<Type> types = const [
    GGetDeviceInfoData_deviceInfo_result__asErrorReply,
    _$GGetDeviceInfoData_deviceInfo_result__asErrorReply
  ];
  @override
  final String wireName = 'GGetDeviceInfoData_deviceInfo_result__asErrorReply';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GGetDeviceInfoData_deviceInfo_result__asErrorReply object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'message',
      serializers.serialize(object.message,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GGetDeviceInfoData_deviceInfo_result__asErrorReply deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GGetDeviceInfoData_deviceInfo_result__asErrorReplyBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'message':
          result.message = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GGetDeviceInfoData extends GGetDeviceInfoData {
  @override
  final String G__typename;
  @override
  final GGetDeviceInfoData_deviceInfo deviceInfo;

  factory _$GGetDeviceInfoData(
          [void Function(GGetDeviceInfoDataBuilder)? updates]) =>
      (new GGetDeviceInfoDataBuilder()..update(updates))._build();

  _$GGetDeviceInfoData._({required this.G__typename, required this.deviceInfo})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GGetDeviceInfoData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        deviceInfo, r'GGetDeviceInfoData', 'deviceInfo');
  }

  @override
  GGetDeviceInfoData rebuild(
          void Function(GGetDeviceInfoDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetDeviceInfoDataBuilder toBuilder() =>
      new GGetDeviceInfoDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetDeviceInfoData &&
        G__typename == other.G__typename &&
        deviceInfo == other.deviceInfo;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, deviceInfo.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GGetDeviceInfoData')
          ..add('G__typename', G__typename)
          ..add('deviceInfo', deviceInfo))
        .toString();
  }
}

class GGetDeviceInfoDataBuilder
    implements Builder<GGetDeviceInfoData, GGetDeviceInfoDataBuilder> {
  _$GGetDeviceInfoData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GGetDeviceInfoData_deviceInfoBuilder? _deviceInfo;
  GGetDeviceInfoData_deviceInfoBuilder get deviceInfo =>
      _$this._deviceInfo ??= new GGetDeviceInfoData_deviceInfoBuilder();
  set deviceInfo(GGetDeviceInfoData_deviceInfoBuilder? deviceInfo) =>
      _$this._deviceInfo = deviceInfo;

  GGetDeviceInfoDataBuilder() {
    GGetDeviceInfoData._initializeBuilder(this);
  }

  GGetDeviceInfoDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _deviceInfo = $v.deviceInfo.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetDeviceInfoData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetDeviceInfoData;
  }

  @override
  void update(void Function(GGetDeviceInfoDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetDeviceInfoData build() => _build();

  _$GGetDeviceInfoData _build() {
    _$GGetDeviceInfoData _$result;
    try {
      _$result = _$v ??
          new _$GGetDeviceInfoData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GGetDeviceInfoData', 'G__typename'),
              deviceInfo: deviceInfo.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'deviceInfo';
        deviceInfo.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GGetDeviceInfoData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GGetDeviceInfoData_deviceInfo extends GGetDeviceInfoData_deviceInfo {
  @override
  final String G__typename;
  @override
  final BuiltList<GGetDeviceInfoData_deviceInfo_result> result;

  factory _$GGetDeviceInfoData_deviceInfo(
          [void Function(GGetDeviceInfoData_deviceInfoBuilder)? updates]) =>
      (new GGetDeviceInfoData_deviceInfoBuilder()..update(updates))._build();

  _$GGetDeviceInfoData_deviceInfo._(
      {required this.G__typename, required this.result})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GGetDeviceInfoData_deviceInfo', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        result, r'GGetDeviceInfoData_deviceInfo', 'result');
  }

  @override
  GGetDeviceInfoData_deviceInfo rebuild(
          void Function(GGetDeviceInfoData_deviceInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetDeviceInfoData_deviceInfoBuilder toBuilder() =>
      new GGetDeviceInfoData_deviceInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetDeviceInfoData_deviceInfo &&
        G__typename == other.G__typename &&
        result == other.result;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, result.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GGetDeviceInfoData_deviceInfo')
          ..add('G__typename', G__typename)
          ..add('result', result))
        .toString();
  }
}

class GGetDeviceInfoData_deviceInfoBuilder
    implements
        Builder<GGetDeviceInfoData_deviceInfo,
            GGetDeviceInfoData_deviceInfoBuilder> {
  _$GGetDeviceInfoData_deviceInfo? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GGetDeviceInfoData_deviceInfo_result>? _result;
  ListBuilder<GGetDeviceInfoData_deviceInfo_result> get result =>
      _$this._result ??=
          new ListBuilder<GGetDeviceInfoData_deviceInfo_result>();
  set result(ListBuilder<GGetDeviceInfoData_deviceInfo_result>? result) =>
      _$this._result = result;

  GGetDeviceInfoData_deviceInfoBuilder() {
    GGetDeviceInfoData_deviceInfo._initializeBuilder(this);
  }

  GGetDeviceInfoData_deviceInfoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _result = $v.result.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetDeviceInfoData_deviceInfo other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetDeviceInfoData_deviceInfo;
  }

  @override
  void update(void Function(GGetDeviceInfoData_deviceInfoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetDeviceInfoData_deviceInfo build() => _build();

  _$GGetDeviceInfoData_deviceInfo _build() {
    _$GGetDeviceInfoData_deviceInfo _$result;
    try {
      _$result = _$v ??
          new _$GGetDeviceInfoData_deviceInfo._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GGetDeviceInfoData_deviceInfo', 'G__typename'),
              result: result.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'result';
        result.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GGetDeviceInfoData_deviceInfo', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GGetDeviceInfoData_deviceInfo_result__base
    extends GGetDeviceInfoData_deviceInfo_result__base {
  @override
  final String G__typename;

  factory _$GGetDeviceInfoData_deviceInfo_result__base(
          [void Function(GGetDeviceInfoData_deviceInfo_result__baseBuilder)?
              updates]) =>
      (new GGetDeviceInfoData_deviceInfo_result__baseBuilder()..update(updates))
          ._build();

  _$GGetDeviceInfoData_deviceInfo_result__base._({required this.G__typename})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GGetDeviceInfoData_deviceInfo_result__base', 'G__typename');
  }

  @override
  GGetDeviceInfoData_deviceInfo_result__base rebuild(
          void Function(GGetDeviceInfoData_deviceInfo_result__baseBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetDeviceInfoData_deviceInfo_result__baseBuilder toBuilder() =>
      new GGetDeviceInfoData_deviceInfo_result__baseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetDeviceInfoData_deviceInfo_result__base &&
        G__typename == other.G__typename;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GGetDeviceInfoData_deviceInfo_result__base')
          ..add('G__typename', G__typename))
        .toString();
  }
}

class GGetDeviceInfoData_deviceInfo_result__baseBuilder
    implements
        Builder<GGetDeviceInfoData_deviceInfo_result__base,
            GGetDeviceInfoData_deviceInfo_result__baseBuilder> {
  _$GGetDeviceInfoData_deviceInfo_result__base? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GGetDeviceInfoData_deviceInfo_result__baseBuilder() {
    GGetDeviceInfoData_deviceInfo_result__base._initializeBuilder(this);
  }

  GGetDeviceInfoData_deviceInfo_result__baseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetDeviceInfoData_deviceInfo_result__base other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetDeviceInfoData_deviceInfo_result__base;
  }

  @override
  void update(
      void Function(GGetDeviceInfoData_deviceInfo_result__baseBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetDeviceInfoData_deviceInfo_result__base build() => _build();

  _$GGetDeviceInfoData_deviceInfo_result__base _build() {
    final _$result = _$v ??
        new _$GGetDeviceInfoData_deviceInfo_result__base._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GGetDeviceInfoData_deviceInfo_result__base', 'G__typename'));
    replace(_$result);
    return _$result;
  }
}

class _$GGetDeviceInfoData_deviceInfo_result__asDeviceInfo
    extends GGetDeviceInfoData_deviceInfo_result__asDeviceInfo {
  @override
  final String G__typename;
  @override
  final String description;
  @override
  final GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_reading? reading;
  @override
  final GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_setting? setting;
  @override
  final GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus? digStatus;

  factory _$GGetDeviceInfoData_deviceInfo_result__asDeviceInfo(
          [void Function(
                  GGetDeviceInfoData_deviceInfo_result__asDeviceInfoBuilder)?
              updates]) =>
      (new GGetDeviceInfoData_deviceInfo_result__asDeviceInfoBuilder()
            ..update(updates))
          ._build();

  _$GGetDeviceInfoData_deviceInfo_result__asDeviceInfo._(
      {required this.G__typename,
      required this.description,
      this.reading,
      this.setting,
      this.digStatus})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GGetDeviceInfoData_deviceInfo_result__asDeviceInfo', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(description,
        r'GGetDeviceInfoData_deviceInfo_result__asDeviceInfo', 'description');
  }

  @override
  GGetDeviceInfoData_deviceInfo_result__asDeviceInfo rebuild(
          void Function(
                  GGetDeviceInfoData_deviceInfo_result__asDeviceInfoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetDeviceInfoData_deviceInfo_result__asDeviceInfoBuilder toBuilder() =>
      new GGetDeviceInfoData_deviceInfo_result__asDeviceInfoBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetDeviceInfoData_deviceInfo_result__asDeviceInfo &&
        G__typename == other.G__typename &&
        description == other.description &&
        reading == other.reading &&
        setting == other.setting &&
        digStatus == other.digStatus;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, reading.hashCode);
    _$hash = $jc(_$hash, setting.hashCode);
    _$hash = $jc(_$hash, digStatus.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GGetDeviceInfoData_deviceInfo_result__asDeviceInfo')
          ..add('G__typename', G__typename)
          ..add('description', description)
          ..add('reading', reading)
          ..add('setting', setting)
          ..add('digStatus', digStatus))
        .toString();
  }
}

class GGetDeviceInfoData_deviceInfo_result__asDeviceInfoBuilder
    implements
        Builder<GGetDeviceInfoData_deviceInfo_result__asDeviceInfo,
            GGetDeviceInfoData_deviceInfo_result__asDeviceInfoBuilder> {
  _$GGetDeviceInfoData_deviceInfo_result__asDeviceInfo? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_readingBuilder? _reading;
  GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_readingBuilder
      get reading => _$this._reading ??=
          new GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_readingBuilder();
  set reading(
          GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_readingBuilder?
              reading) =>
      _$this._reading = reading;

  GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_settingBuilder? _setting;
  GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_settingBuilder
      get setting => _$this._setting ??=
          new GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_settingBuilder();
  set setting(
          GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_settingBuilder?
              setting) =>
      _$this._setting = setting;

  GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatusBuilder?
      _digStatus;
  GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatusBuilder
      get digStatus => _$this._digStatus ??=
          new GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatusBuilder();
  set digStatus(
          GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatusBuilder?
              digStatus) =>
      _$this._digStatus = digStatus;

  GGetDeviceInfoData_deviceInfo_result__asDeviceInfoBuilder() {
    GGetDeviceInfoData_deviceInfo_result__asDeviceInfo._initializeBuilder(this);
  }

  GGetDeviceInfoData_deviceInfo_result__asDeviceInfoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _description = $v.description;
      _reading = $v.reading?.toBuilder();
      _setting = $v.setting?.toBuilder();
      _digStatus = $v.digStatus?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetDeviceInfoData_deviceInfo_result__asDeviceInfo other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetDeviceInfoData_deviceInfo_result__asDeviceInfo;
  }

  @override
  void update(
      void Function(GGetDeviceInfoData_deviceInfo_result__asDeviceInfoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetDeviceInfoData_deviceInfo_result__asDeviceInfo build() => _build();

  _$GGetDeviceInfoData_deviceInfo_result__asDeviceInfo _build() {
    _$GGetDeviceInfoData_deviceInfo_result__asDeviceInfo _$result;
    try {
      _$result = _$v ??
          new _$GGetDeviceInfoData_deviceInfo_result__asDeviceInfo._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename,
                  r'GGetDeviceInfoData_deviceInfo_result__asDeviceInfo',
                  'G__typename'),
              description: BuiltValueNullFieldError.checkNotNull(
                  description,
                  r'GGetDeviceInfoData_deviceInfo_result__asDeviceInfo',
                  'description'),
              reading: _reading?.build(),
              setting: _setting?.build(),
              digStatus: _digStatus?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'reading';
        _reading?.build();
        _$failedField = 'setting';
        _setting?.build();
        _$failedField = 'digStatus';
        _digStatus?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GGetDeviceInfoData_deviceInfo_result__asDeviceInfo',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_reading
    extends GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_reading {
  @override
  final String G__typename;
  @override
  final String? primaryUnits;
  @override
  final String? commonUnits;

  factory _$GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_reading(
          [void Function(
                  GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_readingBuilder)?
              updates]) =>
      (new GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_readingBuilder()
            ..update(updates))
          ._build();

  _$GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_reading._(
      {required this.G__typename, this.primaryUnits, this.commonUnits})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        r'GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_reading',
        'G__typename');
  }

  @override
  GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_reading rebuild(
          void Function(
                  GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_readingBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_readingBuilder
      toBuilder() =>
          new GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_readingBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_reading &&
        G__typename == other.G__typename &&
        primaryUnits == other.primaryUnits &&
        commonUnits == other.commonUnits;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, primaryUnits.hashCode);
    _$hash = $jc(_$hash, commonUnits.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_reading')
          ..add('G__typename', G__typename)
          ..add('primaryUnits', primaryUnits)
          ..add('commonUnits', commonUnits))
        .toString();
  }
}

class GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_readingBuilder
    implements
        Builder<GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_reading,
            GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_readingBuilder> {
  _$GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_reading? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _primaryUnits;
  String? get primaryUnits => _$this._primaryUnits;
  set primaryUnits(String? primaryUnits) => _$this._primaryUnits = primaryUnits;

  String? _commonUnits;
  String? get commonUnits => _$this._commonUnits;
  set commonUnits(String? commonUnits) => _$this._commonUnits = commonUnits;

  GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_readingBuilder() {
    GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_reading
        ._initializeBuilder(this);
  }

  GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_readingBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _primaryUnits = $v.primaryUnits;
      _commonUnits = $v.commonUnits;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_reading other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_reading;
  }

  @override
  void update(
      void Function(
              GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_readingBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_reading build() =>
      _build();

  _$GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_reading _build() {
    final _$result = _$v ??
        new _$GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_reading._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_reading',
                'G__typename'),
            primaryUnits: primaryUnits,
            commonUnits: commonUnits);
    replace(_$result);
    return _$result;
  }
}

class _$GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_setting
    extends GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_setting {
  @override
  final String G__typename;
  @override
  final String? primaryUnits;
  @override
  final String? commonUnits;

  factory _$GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_setting(
          [void Function(
                  GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_settingBuilder)?
              updates]) =>
      (new GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_settingBuilder()
            ..update(updates))
          ._build();

  _$GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_setting._(
      {required this.G__typename, this.primaryUnits, this.commonUnits})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        r'GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_setting',
        'G__typename');
  }

  @override
  GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_setting rebuild(
          void Function(
                  GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_settingBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_settingBuilder
      toBuilder() =>
          new GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_settingBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_setting &&
        G__typename == other.G__typename &&
        primaryUnits == other.primaryUnits &&
        commonUnits == other.commonUnits;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, primaryUnits.hashCode);
    _$hash = $jc(_$hash, commonUnits.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_setting')
          ..add('G__typename', G__typename)
          ..add('primaryUnits', primaryUnits)
          ..add('commonUnits', commonUnits))
        .toString();
  }
}

class GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_settingBuilder
    implements
        Builder<GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_setting,
            GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_settingBuilder> {
  _$GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_setting? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _primaryUnits;
  String? get primaryUnits => _$this._primaryUnits;
  set primaryUnits(String? primaryUnits) => _$this._primaryUnits = primaryUnits;

  String? _commonUnits;
  String? get commonUnits => _$this._commonUnits;
  set commonUnits(String? commonUnits) => _$this._commonUnits = commonUnits;

  GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_settingBuilder() {
    GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_setting
        ._initializeBuilder(this);
  }

  GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_settingBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _primaryUnits = $v.primaryUnits;
      _commonUnits = $v.commonUnits;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_setting other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_setting;
  }

  @override
  void update(
      void Function(
              GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_settingBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_setting build() =>
      _build();

  _$GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_setting _build() {
    final _$result = _$v ??
        new _$GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_setting._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_setting',
                'G__typename'),
            primaryUnits: primaryUnits,
            commonUnits: commonUnits);
    replace(_$result);
    return _$result;
  }
}

class _$GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus
    extends GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus {
  @override
  final String G__typename;
  @override
  final BuiltList<
          GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_entries>
      entries;

  factory _$GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus(
          [void Function(
                  GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatusBuilder)?
              updates]) =>
      (new GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatusBuilder()
            ..update(updates))
          ._build();

  _$GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus._(
      {required this.G__typename, required this.entries})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        r'GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus',
        'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        entries,
        r'GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus',
        'entries');
  }

  @override
  GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus rebuild(
          void Function(
                  GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatusBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatusBuilder
      toBuilder() =>
          new GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatusBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus &&
        G__typename == other.G__typename &&
        entries == other.entries;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, entries.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus')
          ..add('G__typename', G__typename)
          ..add('entries', entries))
        .toString();
  }
}

class GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatusBuilder
    implements
        Builder<GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus,
            GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatusBuilder> {
  _$GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<
          GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_entries>?
      _entries;
  ListBuilder<
          GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_entries>
      get entries => _$this._entries ??= new ListBuilder<
          GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_entries>();
  set entries(
          ListBuilder<
                  GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_entries>?
              entries) =>
      _$this._entries = entries;

  GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatusBuilder() {
    GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus
        ._initializeBuilder(this);
  }

  GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatusBuilder
      get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _entries = $v.entries.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v =
        other as _$GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus;
  }

  @override
  void update(
      void Function(
              GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatusBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus build() =>
      _build();

  _$GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus _build() {
    _$GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus _$result;
    try {
      _$result = _$v ??
          new _$GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename,
                  r'GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus',
                  'G__typename'),
              entries: entries.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'entries';
        entries.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_entries
    extends GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_entries {
  @override
  final String G__typename;
  @override
  final int maskVal;
  @override
  final int matchVal;
  @override
  final bool invert;
  @override
  final String shortName;
  @override
  final String longName;
  @override
  final String trueStr;
  @override
  final int trueColor;
  @override
  final String trueChar;
  @override
  final String falseStr;
  @override
  final int falseColor;
  @override
  final String falseChar;

  factory _$GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_entries(
          [void Function(
                  GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_entriesBuilder)?
              updates]) =>
      (new GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_entriesBuilder()
            ..update(updates))
          ._build();

  _$GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_entries._(
      {required this.G__typename,
      required this.maskVal,
      required this.matchVal,
      required this.invert,
      required this.shortName,
      required this.longName,
      required this.trueStr,
      required this.trueColor,
      required this.trueChar,
      required this.falseStr,
      required this.falseColor,
      required this.falseChar})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        r'GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_entries',
        'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        maskVal,
        r'GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_entries',
        'maskVal');
    BuiltValueNullFieldError.checkNotNull(
        matchVal,
        r'GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_entries',
        'matchVal');
    BuiltValueNullFieldError.checkNotNull(
        invert,
        r'GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_entries',
        'invert');
    BuiltValueNullFieldError.checkNotNull(
        shortName,
        r'GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_entries',
        'shortName');
    BuiltValueNullFieldError.checkNotNull(
        longName,
        r'GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_entries',
        'longName');
    BuiltValueNullFieldError.checkNotNull(
        trueStr,
        r'GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_entries',
        'trueStr');
    BuiltValueNullFieldError.checkNotNull(
        trueColor,
        r'GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_entries',
        'trueColor');
    BuiltValueNullFieldError.checkNotNull(
        trueChar,
        r'GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_entries',
        'trueChar');
    BuiltValueNullFieldError.checkNotNull(
        falseStr,
        r'GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_entries',
        'falseStr');
    BuiltValueNullFieldError.checkNotNull(
        falseColor,
        r'GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_entries',
        'falseColor');
    BuiltValueNullFieldError.checkNotNull(
        falseChar,
        r'GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_entries',
        'falseChar');
  }

  @override
  GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_entries rebuild(
          void Function(
                  GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_entriesBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_entriesBuilder
      toBuilder() =>
          new GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_entriesBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_entries &&
        G__typename == other.G__typename &&
        maskVal == other.maskVal &&
        matchVal == other.matchVal &&
        invert == other.invert &&
        shortName == other.shortName &&
        longName == other.longName &&
        trueStr == other.trueStr &&
        trueColor == other.trueColor &&
        trueChar == other.trueChar &&
        falseStr == other.falseStr &&
        falseColor == other.falseColor &&
        falseChar == other.falseChar;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, maskVal.hashCode);
    _$hash = $jc(_$hash, matchVal.hashCode);
    _$hash = $jc(_$hash, invert.hashCode);
    _$hash = $jc(_$hash, shortName.hashCode);
    _$hash = $jc(_$hash, longName.hashCode);
    _$hash = $jc(_$hash, trueStr.hashCode);
    _$hash = $jc(_$hash, trueColor.hashCode);
    _$hash = $jc(_$hash, trueChar.hashCode);
    _$hash = $jc(_$hash, falseStr.hashCode);
    _$hash = $jc(_$hash, falseColor.hashCode);
    _$hash = $jc(_$hash, falseChar.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_entries')
          ..add('G__typename', G__typename)
          ..add('maskVal', maskVal)
          ..add('matchVal', matchVal)
          ..add('invert', invert)
          ..add('shortName', shortName)
          ..add('longName', longName)
          ..add('trueStr', trueStr)
          ..add('trueColor', trueColor)
          ..add('trueChar', trueChar)
          ..add('falseStr', falseStr)
          ..add('falseColor', falseColor)
          ..add('falseChar', falseChar))
        .toString();
  }
}

class GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_entriesBuilder
    implements
        Builder<
            GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_entries,
            GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_entriesBuilder> {
  _$GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_entries? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  int? _maskVal;
  int? get maskVal => _$this._maskVal;
  set maskVal(int? maskVal) => _$this._maskVal = maskVal;

  int? _matchVal;
  int? get matchVal => _$this._matchVal;
  set matchVal(int? matchVal) => _$this._matchVal = matchVal;

  bool? _invert;
  bool? get invert => _$this._invert;
  set invert(bool? invert) => _$this._invert = invert;

  String? _shortName;
  String? get shortName => _$this._shortName;
  set shortName(String? shortName) => _$this._shortName = shortName;

  String? _longName;
  String? get longName => _$this._longName;
  set longName(String? longName) => _$this._longName = longName;

  String? _trueStr;
  String? get trueStr => _$this._trueStr;
  set trueStr(String? trueStr) => _$this._trueStr = trueStr;

  int? _trueColor;
  int? get trueColor => _$this._trueColor;
  set trueColor(int? trueColor) => _$this._trueColor = trueColor;

  String? _trueChar;
  String? get trueChar => _$this._trueChar;
  set trueChar(String? trueChar) => _$this._trueChar = trueChar;

  String? _falseStr;
  String? get falseStr => _$this._falseStr;
  set falseStr(String? falseStr) => _$this._falseStr = falseStr;

  int? _falseColor;
  int? get falseColor => _$this._falseColor;
  set falseColor(int? falseColor) => _$this._falseColor = falseColor;

  String? _falseChar;
  String? get falseChar => _$this._falseChar;
  set falseChar(String? falseChar) => _$this._falseChar = falseChar;

  GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_entriesBuilder() {
    GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_entries
        ._initializeBuilder(this);
  }

  GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_entriesBuilder
      get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _maskVal = $v.maskVal;
      _matchVal = $v.matchVal;
      _invert = $v.invert;
      _shortName = $v.shortName;
      _longName = $v.longName;
      _trueStr = $v.trueStr;
      _trueColor = $v.trueColor;
      _trueChar = $v.trueChar;
      _falseStr = $v.falseStr;
      _falseColor = $v.falseColor;
      _falseChar = $v.falseChar;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_entries
          other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other
        as _$GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_entries;
  }

  @override
  void update(
      void Function(
              GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_entriesBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_entries
      build() => _build();

  _$GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_entries
      _build() {
    final _$result = _$v ??
        new _$GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_entries._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_entries',
                'G__typename'),
            maskVal: BuiltValueNullFieldError.checkNotNull(
                maskVal, r'GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_entries', 'maskVal'),
            matchVal: BuiltValueNullFieldError.checkNotNull(
                matchVal,
                r'GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_entries',
                'matchVal'),
            invert: BuiltValueNullFieldError.checkNotNull(
                invert, r'GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_entries', 'invert'),
            shortName: BuiltValueNullFieldError.checkNotNull(
                shortName,
                r'GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_entries',
                'shortName'),
            longName: BuiltValueNullFieldError.checkNotNull(longName, r'GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_entries', 'longName'),
            trueStr: BuiltValueNullFieldError.checkNotNull(trueStr, r'GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_entries', 'trueStr'),
            trueColor: BuiltValueNullFieldError.checkNotNull(trueColor, r'GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_entries', 'trueColor'),
            trueChar: BuiltValueNullFieldError.checkNotNull(trueChar, r'GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_entries', 'trueChar'),
            falseStr: BuiltValueNullFieldError.checkNotNull(falseStr, r'GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_entries', 'falseStr'),
            falseColor: BuiltValueNullFieldError.checkNotNull(falseColor, r'GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_entries', 'falseColor'),
            falseChar: BuiltValueNullFieldError.checkNotNull(falseChar, r'GGetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_entries', 'falseChar'));
    replace(_$result);
    return _$result;
  }
}

class _$GGetDeviceInfoData_deviceInfo_result__asErrorReply
    extends GGetDeviceInfoData_deviceInfo_result__asErrorReply {
  @override
  final String G__typename;
  @override
  final String message;

  factory _$GGetDeviceInfoData_deviceInfo_result__asErrorReply(
          [void Function(
                  GGetDeviceInfoData_deviceInfo_result__asErrorReplyBuilder)?
              updates]) =>
      (new GGetDeviceInfoData_deviceInfo_result__asErrorReplyBuilder()
            ..update(updates))
          ._build();

  _$GGetDeviceInfoData_deviceInfo_result__asErrorReply._(
      {required this.G__typename, required this.message})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GGetDeviceInfoData_deviceInfo_result__asErrorReply', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(message,
        r'GGetDeviceInfoData_deviceInfo_result__asErrorReply', 'message');
  }

  @override
  GGetDeviceInfoData_deviceInfo_result__asErrorReply rebuild(
          void Function(
                  GGetDeviceInfoData_deviceInfo_result__asErrorReplyBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetDeviceInfoData_deviceInfo_result__asErrorReplyBuilder toBuilder() =>
      new GGetDeviceInfoData_deviceInfo_result__asErrorReplyBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetDeviceInfoData_deviceInfo_result__asErrorReply &&
        G__typename == other.G__typename &&
        message == other.message;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GGetDeviceInfoData_deviceInfo_result__asErrorReply')
          ..add('G__typename', G__typename)
          ..add('message', message))
        .toString();
  }
}

class GGetDeviceInfoData_deviceInfo_result__asErrorReplyBuilder
    implements
        Builder<GGetDeviceInfoData_deviceInfo_result__asErrorReply,
            GGetDeviceInfoData_deviceInfo_result__asErrorReplyBuilder> {
  _$GGetDeviceInfoData_deviceInfo_result__asErrorReply? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  GGetDeviceInfoData_deviceInfo_result__asErrorReplyBuilder() {
    GGetDeviceInfoData_deviceInfo_result__asErrorReply._initializeBuilder(this);
  }

  GGetDeviceInfoData_deviceInfo_result__asErrorReplyBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _message = $v.message;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetDeviceInfoData_deviceInfo_result__asErrorReply other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetDeviceInfoData_deviceInfo_result__asErrorReply;
  }

  @override
  void update(
      void Function(GGetDeviceInfoData_deviceInfo_result__asErrorReplyBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetDeviceInfoData_deviceInfo_result__asErrorReply build() => _build();

  _$GGetDeviceInfoData_deviceInfo_result__asErrorReply _build() {
    final _$result = _$v ??
        new _$GGetDeviceInfoData_deviceInfo_result__asErrorReply._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GGetDeviceInfoData_deviceInfo_result__asErrorReply',
                'G__typename'),
            message: BuiltValueNullFieldError.checkNotNull(
                message,
                r'GGetDeviceInfoData_deviceInfo_result__asErrorReply',
                'message'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
