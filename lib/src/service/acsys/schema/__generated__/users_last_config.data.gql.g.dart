// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_last_config.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GUsersLastConfigData> _$gUsersLastConfigDataSerializer =
    new _$GUsersLastConfigDataSerializer();
Serializer<GUsersLastConfigData_usersLastConfiguration>
    _$gUsersLastConfigDataUsersLastConfigurationSerializer =
    new _$GUsersLastConfigData_usersLastConfigurationSerializer();
Serializer<GUsersLastConfigData_usersLastConfiguration_channels>
    _$gUsersLastConfigDataUsersLastConfigurationChannelsSerializer =
    new _$GUsersLastConfigData_usersLastConfiguration_channelsSerializer();

class _$GUsersLastConfigDataSerializer
    implements StructuredSerializer<GUsersLastConfigData> {
  @override
  final Iterable<Type> types = const [
    GUsersLastConfigData,
    _$GUsersLastConfigData
  ];
  @override
  final String wireName = 'GUsersLastConfigData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GUsersLastConfigData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.usersLastConfiguration;
    if (value != null) {
      result
        ..add('usersLastConfiguration')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(GUsersLastConfigData_usersLastConfiguration)));
    }
    return result;
  }

  @override
  GUsersLastConfigData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUsersLastConfigDataBuilder();

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
        case 'usersLastConfiguration':
          result.usersLastConfiguration.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GUsersLastConfigData_usersLastConfiguration))!
              as GUsersLastConfigData_usersLastConfiguration);
          break;
      }
    }

    return result.build();
  }
}

class _$GUsersLastConfigData_usersLastConfigurationSerializer
    implements
        StructuredSerializer<GUsersLastConfigData_usersLastConfiguration> {
  @override
  final Iterable<Type> types = const [
    GUsersLastConfigData_usersLastConfiguration,
    _$GUsersLastConfigData_usersLastConfiguration
  ];
  @override
  final String wireName = 'GUsersLastConfigData_usersLastConfiguration';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GUsersLastConfigData_usersLastConfiguration object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'configurationId',
      serializers.serialize(object.configurationId,
          specifiedType: const FullType(int)),
      'configurationName',
      serializers.serialize(object.configurationName,
          specifiedType: const FullType(String)),
      'channels',
      serializers.serialize(object.channels,
          specifiedType: const FullType(BuiltList, const [
            const FullType(GUsersLastConfigData_usersLastConfiguration_channels)
          ])),
      'isShowLabels',
      serializers.serialize(object.isShowLabels,
          specifiedType: const FullType(bool)),
    ];
    Object? value;
    value = object.xMin;
    if (value != null) {
      result
        ..add('xMin')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.xMax;
    if (value != null) {
      result
        ..add('xMax')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.yMin;
    if (value != null) {
      result
        ..add('yMin')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.yMax;
    if (value != null) {
      result
        ..add('yMax')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.updateDelay;
    if (value != null) {
      result
        ..add('updateDelay')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.nAcquisitions;
    if (value != null) {
      result
        ..add('nAcquisitions')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.tclkEvent;
    if (value != null) {
      result
        ..add('tclkEvent')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  GUsersLastConfigData_usersLastConfiguration deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUsersLastConfigData_usersLastConfigurationBuilder();

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
        case 'configurationId':
          result.configurationId = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'configurationName':
          result.configurationName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'channels':
          result.channels.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    GUsersLastConfigData_usersLastConfiguration_channels)
              ]))! as BuiltList<Object?>);
          break;
        case 'xMin':
          result.xMin = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'xMax':
          result.xMax = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'yMin':
          result.yMin = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'yMax':
          result.yMax = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'isShowLabels':
          result.isShowLabels = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
        case 'updateDelay':
          result.updateDelay = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'nAcquisitions':
          result.nAcquisitions = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'tclkEvent':
          result.tclkEvent = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
      }
    }

    return result.build();
  }
}

class _$GUsersLastConfigData_usersLastConfiguration_channelsSerializer
    implements
        StructuredSerializer<
            GUsersLastConfigData_usersLastConfiguration_channels> {
  @override
  final Iterable<Type> types = const [
    GUsersLastConfigData_usersLastConfiguration_channels,
    _$GUsersLastConfigData_usersLastConfiguration_channels
  ];
  @override
  final String wireName =
      'GUsersLastConfigData_usersLastConfiguration_channels';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GUsersLastConfigData_usersLastConfiguration_channels object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'device',
      serializers.serialize(object.device,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.lineColor;
    if (value != null) {
      result
        ..add('lineColor')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.markerIndex;
    if (value != null) {
      result
        ..add('markerIndex')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  GUsersLastConfigData_usersLastConfiguration_channels deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GUsersLastConfigData_usersLastConfiguration_channelsBuilder();

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
        case 'device':
          result.device = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'lineColor':
          result.lineColor = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'markerIndex':
          result.markerIndex = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
      }
    }

    return result.build();
  }
}

class _$GUsersLastConfigData extends GUsersLastConfigData {
  @override
  final String G__typename;
  @override
  final GUsersLastConfigData_usersLastConfiguration? usersLastConfiguration;

  factory _$GUsersLastConfigData(
          [void Function(GUsersLastConfigDataBuilder)? updates]) =>
      (new GUsersLastConfigDataBuilder()..update(updates))._build();

  _$GUsersLastConfigData._(
      {required this.G__typename, this.usersLastConfiguration})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GUsersLastConfigData', 'G__typename');
  }

  @override
  GUsersLastConfigData rebuild(
          void Function(GUsersLastConfigDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUsersLastConfigDataBuilder toBuilder() =>
      new GUsersLastConfigDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUsersLastConfigData &&
        G__typename == other.G__typename &&
        usersLastConfiguration == other.usersLastConfiguration;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, usersLastConfiguration.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GUsersLastConfigData')
          ..add('G__typename', G__typename)
          ..add('usersLastConfiguration', usersLastConfiguration))
        .toString();
  }
}

class GUsersLastConfigDataBuilder
    implements Builder<GUsersLastConfigData, GUsersLastConfigDataBuilder> {
  _$GUsersLastConfigData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GUsersLastConfigData_usersLastConfigurationBuilder? _usersLastConfiguration;
  GUsersLastConfigData_usersLastConfigurationBuilder
      get usersLastConfiguration => _$this._usersLastConfiguration ??=
          new GUsersLastConfigData_usersLastConfigurationBuilder();
  set usersLastConfiguration(
          GUsersLastConfigData_usersLastConfigurationBuilder?
              usersLastConfiguration) =>
      _$this._usersLastConfiguration = usersLastConfiguration;

  GUsersLastConfigDataBuilder() {
    GUsersLastConfigData._initializeBuilder(this);
  }

  GUsersLastConfigDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _usersLastConfiguration = $v.usersLastConfiguration?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUsersLastConfigData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUsersLastConfigData;
  }

  @override
  void update(void Function(GUsersLastConfigDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUsersLastConfigData build() => _build();

  _$GUsersLastConfigData _build() {
    _$GUsersLastConfigData _$result;
    try {
      _$result = _$v ??
          new _$GUsersLastConfigData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GUsersLastConfigData', 'G__typename'),
            usersLastConfiguration: _usersLastConfiguration?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'usersLastConfiguration';
        _usersLastConfiguration?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GUsersLastConfigData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GUsersLastConfigData_usersLastConfiguration
    extends GUsersLastConfigData_usersLastConfiguration {
  @override
  final String G__typename;
  @override
  final int configurationId;
  @override
  final String configurationName;
  @override
  final BuiltList<GUsersLastConfigData_usersLastConfiguration_channels>
      channels;
  @override
  final double? xMin;
  @override
  final double? xMax;
  @override
  final double? yMin;
  @override
  final double? yMax;
  @override
  final bool isShowLabels;
  @override
  final int? updateDelay;
  @override
  final int? nAcquisitions;
  @override
  final int? tclkEvent;

  factory _$GUsersLastConfigData_usersLastConfiguration(
          [void Function(GUsersLastConfigData_usersLastConfigurationBuilder)?
              updates]) =>
      (new GUsersLastConfigData_usersLastConfigurationBuilder()
            ..update(updates))
          ._build();

  _$GUsersLastConfigData_usersLastConfiguration._(
      {required this.G__typename,
      required this.configurationId,
      required this.configurationName,
      required this.channels,
      this.xMin,
      this.xMax,
      this.yMin,
      this.yMax,
      required this.isShowLabels,
      this.updateDelay,
      this.nAcquisitions,
      this.tclkEvent})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GUsersLastConfigData_usersLastConfiguration', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(configurationId,
        r'GUsersLastConfigData_usersLastConfiguration', 'configurationId');
    BuiltValueNullFieldError.checkNotNull(configurationName,
        r'GUsersLastConfigData_usersLastConfiguration', 'configurationName');
    BuiltValueNullFieldError.checkNotNull(
        channels, r'GUsersLastConfigData_usersLastConfiguration', 'channels');
    BuiltValueNullFieldError.checkNotNull(isShowLabels,
        r'GUsersLastConfigData_usersLastConfiguration', 'isShowLabels');
  }

  @override
  GUsersLastConfigData_usersLastConfiguration rebuild(
          void Function(GUsersLastConfigData_usersLastConfigurationBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUsersLastConfigData_usersLastConfigurationBuilder toBuilder() =>
      new GUsersLastConfigData_usersLastConfigurationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUsersLastConfigData_usersLastConfiguration &&
        G__typename == other.G__typename &&
        configurationId == other.configurationId &&
        configurationName == other.configurationName &&
        channels == other.channels &&
        xMin == other.xMin &&
        xMax == other.xMax &&
        yMin == other.yMin &&
        yMax == other.yMax &&
        isShowLabels == other.isShowLabels &&
        updateDelay == other.updateDelay &&
        nAcquisitions == other.nAcquisitions &&
        tclkEvent == other.tclkEvent;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, configurationId.hashCode);
    _$hash = $jc(_$hash, configurationName.hashCode);
    _$hash = $jc(_$hash, channels.hashCode);
    _$hash = $jc(_$hash, xMin.hashCode);
    _$hash = $jc(_$hash, xMax.hashCode);
    _$hash = $jc(_$hash, yMin.hashCode);
    _$hash = $jc(_$hash, yMax.hashCode);
    _$hash = $jc(_$hash, isShowLabels.hashCode);
    _$hash = $jc(_$hash, updateDelay.hashCode);
    _$hash = $jc(_$hash, nAcquisitions.hashCode);
    _$hash = $jc(_$hash, tclkEvent.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GUsersLastConfigData_usersLastConfiguration')
          ..add('G__typename', G__typename)
          ..add('configurationId', configurationId)
          ..add('configurationName', configurationName)
          ..add('channels', channels)
          ..add('xMin', xMin)
          ..add('xMax', xMax)
          ..add('yMin', yMin)
          ..add('yMax', yMax)
          ..add('isShowLabels', isShowLabels)
          ..add('updateDelay', updateDelay)
          ..add('nAcquisitions', nAcquisitions)
          ..add('tclkEvent', tclkEvent))
        .toString();
  }
}

class GUsersLastConfigData_usersLastConfigurationBuilder
    implements
        Builder<GUsersLastConfigData_usersLastConfiguration,
            GUsersLastConfigData_usersLastConfigurationBuilder> {
  _$GUsersLastConfigData_usersLastConfiguration? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  int? _configurationId;
  int? get configurationId => _$this._configurationId;
  set configurationId(int? configurationId) =>
      _$this._configurationId = configurationId;

  String? _configurationName;
  String? get configurationName => _$this._configurationName;
  set configurationName(String? configurationName) =>
      _$this._configurationName = configurationName;

  ListBuilder<GUsersLastConfigData_usersLastConfiguration_channels>? _channels;
  ListBuilder<GUsersLastConfigData_usersLastConfiguration_channels>
      get channels => _$this._channels ??= new ListBuilder<
          GUsersLastConfigData_usersLastConfiguration_channels>();
  set channels(
          ListBuilder<GUsersLastConfigData_usersLastConfiguration_channels>?
              channels) =>
      _$this._channels = channels;

  double? _xMin;
  double? get xMin => _$this._xMin;
  set xMin(double? xMin) => _$this._xMin = xMin;

  double? _xMax;
  double? get xMax => _$this._xMax;
  set xMax(double? xMax) => _$this._xMax = xMax;

  double? _yMin;
  double? get yMin => _$this._yMin;
  set yMin(double? yMin) => _$this._yMin = yMin;

  double? _yMax;
  double? get yMax => _$this._yMax;
  set yMax(double? yMax) => _$this._yMax = yMax;

  bool? _isShowLabels;
  bool? get isShowLabels => _$this._isShowLabels;
  set isShowLabels(bool? isShowLabels) => _$this._isShowLabels = isShowLabels;

  int? _updateDelay;
  int? get updateDelay => _$this._updateDelay;
  set updateDelay(int? updateDelay) => _$this._updateDelay = updateDelay;

  int? _nAcquisitions;
  int? get nAcquisitions => _$this._nAcquisitions;
  set nAcquisitions(int? nAcquisitions) =>
      _$this._nAcquisitions = nAcquisitions;

  int? _tclkEvent;
  int? get tclkEvent => _$this._tclkEvent;
  set tclkEvent(int? tclkEvent) => _$this._tclkEvent = tclkEvent;

  GUsersLastConfigData_usersLastConfigurationBuilder() {
    GUsersLastConfigData_usersLastConfiguration._initializeBuilder(this);
  }

  GUsersLastConfigData_usersLastConfigurationBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _configurationId = $v.configurationId;
      _configurationName = $v.configurationName;
      _channels = $v.channels.toBuilder();
      _xMin = $v.xMin;
      _xMax = $v.xMax;
      _yMin = $v.yMin;
      _yMax = $v.yMax;
      _isShowLabels = $v.isShowLabels;
      _updateDelay = $v.updateDelay;
      _nAcquisitions = $v.nAcquisitions;
      _tclkEvent = $v.tclkEvent;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUsersLastConfigData_usersLastConfiguration other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUsersLastConfigData_usersLastConfiguration;
  }

  @override
  void update(
      void Function(GUsersLastConfigData_usersLastConfigurationBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GUsersLastConfigData_usersLastConfiguration build() => _build();

  _$GUsersLastConfigData_usersLastConfiguration _build() {
    _$GUsersLastConfigData_usersLastConfiguration _$result;
    try {
      _$result = _$v ??
          new _$GUsersLastConfigData_usersLastConfiguration._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GUsersLastConfigData_usersLastConfiguration', 'G__typename'),
            configurationId: BuiltValueNullFieldError.checkNotNull(
                configurationId,
                r'GUsersLastConfigData_usersLastConfiguration',
                'configurationId'),
            configurationName: BuiltValueNullFieldError.checkNotNull(
                configurationName,
                r'GUsersLastConfigData_usersLastConfiguration',
                'configurationName'),
            channels: channels.build(),
            xMin: xMin,
            xMax: xMax,
            yMin: yMin,
            yMax: yMax,
            isShowLabels: BuiltValueNullFieldError.checkNotNull(isShowLabels,
                r'GUsersLastConfigData_usersLastConfiguration', 'isShowLabels'),
            updateDelay: updateDelay,
            nAcquisitions: nAcquisitions,
            tclkEvent: tclkEvent,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'channels';
        channels.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GUsersLastConfigData_usersLastConfiguration',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GUsersLastConfigData_usersLastConfiguration_channels
    extends GUsersLastConfigData_usersLastConfiguration_channels {
  @override
  final String G__typename;
  @override
  final String device;
  @override
  final int? lineColor;
  @override
  final int? markerIndex;

  factory _$GUsersLastConfigData_usersLastConfiguration_channels(
          [void Function(
                  GUsersLastConfigData_usersLastConfiguration_channelsBuilder)?
              updates]) =>
      (new GUsersLastConfigData_usersLastConfiguration_channelsBuilder()
            ..update(updates))
          ._build();

  _$GUsersLastConfigData_usersLastConfiguration_channels._(
      {required this.G__typename,
      required this.device,
      this.lineColor,
      this.markerIndex})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GUsersLastConfigData_usersLastConfiguration_channels', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(device,
        r'GUsersLastConfigData_usersLastConfiguration_channels', 'device');
  }

  @override
  GUsersLastConfigData_usersLastConfiguration_channels rebuild(
          void Function(
                  GUsersLastConfigData_usersLastConfiguration_channelsBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUsersLastConfigData_usersLastConfiguration_channelsBuilder toBuilder() =>
      new GUsersLastConfigData_usersLastConfiguration_channelsBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUsersLastConfigData_usersLastConfiguration_channels &&
        G__typename == other.G__typename &&
        device == other.device &&
        lineColor == other.lineColor &&
        markerIndex == other.markerIndex;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, device.hashCode);
    _$hash = $jc(_$hash, lineColor.hashCode);
    _$hash = $jc(_$hash, markerIndex.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GUsersLastConfigData_usersLastConfiguration_channels')
          ..add('G__typename', G__typename)
          ..add('device', device)
          ..add('lineColor', lineColor)
          ..add('markerIndex', markerIndex))
        .toString();
  }
}

class GUsersLastConfigData_usersLastConfiguration_channelsBuilder
    implements
        Builder<GUsersLastConfigData_usersLastConfiguration_channels,
            GUsersLastConfigData_usersLastConfiguration_channelsBuilder> {
  _$GUsersLastConfigData_usersLastConfiguration_channels? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _device;
  String? get device => _$this._device;
  set device(String? device) => _$this._device = device;

  int? _lineColor;
  int? get lineColor => _$this._lineColor;
  set lineColor(int? lineColor) => _$this._lineColor = lineColor;

  int? _markerIndex;
  int? get markerIndex => _$this._markerIndex;
  set markerIndex(int? markerIndex) => _$this._markerIndex = markerIndex;

  GUsersLastConfigData_usersLastConfiguration_channelsBuilder() {
    GUsersLastConfigData_usersLastConfiguration_channels._initializeBuilder(
        this);
  }

  GUsersLastConfigData_usersLastConfiguration_channelsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _device = $v.device;
      _lineColor = $v.lineColor;
      _markerIndex = $v.markerIndex;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUsersLastConfigData_usersLastConfiguration_channels other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUsersLastConfigData_usersLastConfiguration_channels;
  }

  @override
  void update(
      void Function(
              GUsersLastConfigData_usersLastConfiguration_channelsBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GUsersLastConfigData_usersLastConfiguration_channels build() => _build();

  _$GUsersLastConfigData_usersLastConfiguration_channels _build() {
    final _$result = _$v ??
        new _$GUsersLastConfigData_usersLastConfiguration_channels._(
          G__typename: BuiltValueNullFieldError.checkNotNull(
              G__typename,
              r'GUsersLastConfigData_usersLastConfiguration_channels',
              'G__typename'),
          device: BuiltValueNullFieldError.checkNotNull(
              device,
              r'GUsersLastConfigData_usersLastConfiguration_channels',
              'device'),
          lineColor: lineColor,
          markerIndex: markerIndex,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
