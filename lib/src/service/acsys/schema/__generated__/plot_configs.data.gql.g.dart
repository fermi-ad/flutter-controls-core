// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plot_configs.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GPlotConfigsData> _$gPlotConfigsDataSerializer =
    new _$GPlotConfigsDataSerializer();
Serializer<GPlotConfigsData_plotConfiguration>
    _$gPlotConfigsDataPlotConfigurationSerializer =
    new _$GPlotConfigsData_plotConfigurationSerializer();
Serializer<GPlotConfigsData_plotConfiguration_channels>
    _$gPlotConfigsDataPlotConfigurationChannelsSerializer =
    new _$GPlotConfigsData_plotConfiguration_channelsSerializer();

class _$GPlotConfigsDataSerializer
    implements StructuredSerializer<GPlotConfigsData> {
  @override
  final Iterable<Type> types = const [GPlotConfigsData, _$GPlotConfigsData];
  @override
  final String wireName = 'GPlotConfigsData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GPlotConfigsData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'plotConfiguration',
      serializers.serialize(object.plotConfiguration,
          specifiedType: const FullType(BuiltList,
              const [const FullType(GPlotConfigsData_plotConfiguration)])),
    ];

    return result;
  }

  @override
  GPlotConfigsData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPlotConfigsDataBuilder();

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
        case 'plotConfiguration':
          result.plotConfiguration.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GPlotConfigsData_plotConfiguration)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GPlotConfigsData_plotConfigurationSerializer
    implements StructuredSerializer<GPlotConfigsData_plotConfiguration> {
  @override
  final Iterable<Type> types = const [
    GPlotConfigsData_plotConfiguration,
    _$GPlotConfigsData_plotConfiguration
  ];
  @override
  final String wireName = 'GPlotConfigsData_plotConfiguration';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GPlotConfigsData_plotConfiguration object,
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
            const FullType(GPlotConfigsData_plotConfiguration_channels)
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
  GPlotConfigsData_plotConfiguration deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPlotConfigsData_plotConfigurationBuilder();

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
                const FullType(GPlotConfigsData_plotConfiguration_channels)
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

class _$GPlotConfigsData_plotConfiguration_channelsSerializer
    implements
        StructuredSerializer<GPlotConfigsData_plotConfiguration_channels> {
  @override
  final Iterable<Type> types = const [
    GPlotConfigsData_plotConfiguration_channels,
    _$GPlotConfigsData_plotConfiguration_channels
  ];
  @override
  final String wireName = 'GPlotConfigsData_plotConfiguration_channels';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GPlotConfigsData_plotConfiguration_channels object,
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
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GPlotConfigsData_plotConfiguration_channels deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPlotConfigsData_plotConfiguration_channelsBuilder();

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
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GPlotConfigsData extends GPlotConfigsData {
  @override
  final String G__typename;
  @override
  final BuiltList<GPlotConfigsData_plotConfiguration> plotConfiguration;

  factory _$GPlotConfigsData(
          [void Function(GPlotConfigsDataBuilder)? updates]) =>
      (new GPlotConfigsDataBuilder()..update(updates))._build();

  _$GPlotConfigsData._(
      {required this.G__typename, required this.plotConfiguration})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GPlotConfigsData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        plotConfiguration, r'GPlotConfigsData', 'plotConfiguration');
  }

  @override
  GPlotConfigsData rebuild(void Function(GPlotConfigsDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPlotConfigsDataBuilder toBuilder() =>
      new GPlotConfigsDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPlotConfigsData &&
        G__typename == other.G__typename &&
        plotConfiguration == other.plotConfiguration;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, plotConfiguration.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GPlotConfigsData')
          ..add('G__typename', G__typename)
          ..add('plotConfiguration', plotConfiguration))
        .toString();
  }
}

class GPlotConfigsDataBuilder
    implements Builder<GPlotConfigsData, GPlotConfigsDataBuilder> {
  _$GPlotConfigsData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GPlotConfigsData_plotConfiguration>? _plotConfiguration;
  ListBuilder<GPlotConfigsData_plotConfiguration> get plotConfiguration =>
      _$this._plotConfiguration ??=
          new ListBuilder<GPlotConfigsData_plotConfiguration>();
  set plotConfiguration(
          ListBuilder<GPlotConfigsData_plotConfiguration>? plotConfiguration) =>
      _$this._plotConfiguration = plotConfiguration;

  GPlotConfigsDataBuilder() {
    GPlotConfigsData._initializeBuilder(this);
  }

  GPlotConfigsDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _plotConfiguration = $v.plotConfiguration.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPlotConfigsData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPlotConfigsData;
  }

  @override
  void update(void Function(GPlotConfigsDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPlotConfigsData build() => _build();

  _$GPlotConfigsData _build() {
    _$GPlotConfigsData _$result;
    try {
      _$result = _$v ??
          new _$GPlotConfigsData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GPlotConfigsData', 'G__typename'),
              plotConfiguration: plotConfiguration.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'plotConfiguration';
        plotConfiguration.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GPlotConfigsData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GPlotConfigsData_plotConfiguration
    extends GPlotConfigsData_plotConfiguration {
  @override
  final String G__typename;
  @override
  final int configurationId;
  @override
  final String configurationName;
  @override
  final BuiltList<GPlotConfigsData_plotConfiguration_channels> channels;
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

  factory _$GPlotConfigsData_plotConfiguration(
          [void Function(GPlotConfigsData_plotConfigurationBuilder)?
              updates]) =>
      (new GPlotConfigsData_plotConfigurationBuilder()..update(updates))
          ._build();

  _$GPlotConfigsData_plotConfiguration._(
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
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GPlotConfigsData_plotConfiguration', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(configurationId,
        r'GPlotConfigsData_plotConfiguration', 'configurationId');
    BuiltValueNullFieldError.checkNotNull(configurationName,
        r'GPlotConfigsData_plotConfiguration', 'configurationName');
    BuiltValueNullFieldError.checkNotNull(
        channels, r'GPlotConfigsData_plotConfiguration', 'channels');
    BuiltValueNullFieldError.checkNotNull(
        isShowLabels, r'GPlotConfigsData_plotConfiguration', 'isShowLabels');
  }

  @override
  GPlotConfigsData_plotConfiguration rebuild(
          void Function(GPlotConfigsData_plotConfigurationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPlotConfigsData_plotConfigurationBuilder toBuilder() =>
      new GPlotConfigsData_plotConfigurationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPlotConfigsData_plotConfiguration &&
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
    return (newBuiltValueToStringHelper(r'GPlotConfigsData_plotConfiguration')
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

class GPlotConfigsData_plotConfigurationBuilder
    implements
        Builder<GPlotConfigsData_plotConfiguration,
            GPlotConfigsData_plotConfigurationBuilder> {
  _$GPlotConfigsData_plotConfiguration? _$v;

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

  ListBuilder<GPlotConfigsData_plotConfiguration_channels>? _channels;
  ListBuilder<GPlotConfigsData_plotConfiguration_channels> get channels =>
      _$this._channels ??=
          new ListBuilder<GPlotConfigsData_plotConfiguration_channels>();
  set channels(
          ListBuilder<GPlotConfigsData_plotConfiguration_channels>? channels) =>
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

  GPlotConfigsData_plotConfigurationBuilder() {
    GPlotConfigsData_plotConfiguration._initializeBuilder(this);
  }

  GPlotConfigsData_plotConfigurationBuilder get _$this {
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
  void replace(GPlotConfigsData_plotConfiguration other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPlotConfigsData_plotConfiguration;
  }

  @override
  void update(
      void Function(GPlotConfigsData_plotConfigurationBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPlotConfigsData_plotConfiguration build() => _build();

  _$GPlotConfigsData_plotConfiguration _build() {
    _$GPlotConfigsData_plotConfiguration _$result;
    try {
      _$result = _$v ??
          new _$GPlotConfigsData_plotConfiguration._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GPlotConfigsData_plotConfiguration', 'G__typename'),
              configurationId: BuiltValueNullFieldError.checkNotNull(
                  configurationId,
                  r'GPlotConfigsData_plotConfiguration',
                  'configurationId'),
              configurationName: BuiltValueNullFieldError.checkNotNull(
                  configurationName,
                  r'GPlotConfigsData_plotConfiguration',
                  'configurationName'),
              channels: channels.build(),
              xMin: xMin,
              xMax: xMax,
              yMin: yMin,
              yMax: yMax,
              isShowLabels: BuiltValueNullFieldError.checkNotNull(isShowLabels,
                  r'GPlotConfigsData_plotConfiguration', 'isShowLabels'),
              updateDelay: updateDelay,
              nAcquisitions: nAcquisitions,
              tclkEvent: tclkEvent);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'channels';
        channels.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GPlotConfigsData_plotConfiguration', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GPlotConfigsData_plotConfiguration_channels
    extends GPlotConfigsData_plotConfiguration_channels {
  @override
  final String G__typename;
  @override
  final String device;
  @override
  final int? lineColor;
  @override
  final String? markerIndex;

  factory _$GPlotConfigsData_plotConfiguration_channels(
          [void Function(GPlotConfigsData_plotConfiguration_channelsBuilder)?
              updates]) =>
      (new GPlotConfigsData_plotConfiguration_channelsBuilder()
            ..update(updates))
          ._build();

  _$GPlotConfigsData_plotConfiguration_channels._(
      {required this.G__typename,
      required this.device,
      this.lineColor,
      this.markerIndex})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GPlotConfigsData_plotConfiguration_channels', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        device, r'GPlotConfigsData_plotConfiguration_channels', 'device');
  }

  @override
  GPlotConfigsData_plotConfiguration_channels rebuild(
          void Function(GPlotConfigsData_plotConfiguration_channelsBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPlotConfigsData_plotConfiguration_channelsBuilder toBuilder() =>
      new GPlotConfigsData_plotConfiguration_channelsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPlotConfigsData_plotConfiguration_channels &&
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
            r'GPlotConfigsData_plotConfiguration_channels')
          ..add('G__typename', G__typename)
          ..add('device', device)
          ..add('lineColor', lineColor)
          ..add('markerIndex', markerIndex))
        .toString();
  }
}

class GPlotConfigsData_plotConfiguration_channelsBuilder
    implements
        Builder<GPlotConfigsData_plotConfiguration_channels,
            GPlotConfigsData_plotConfiguration_channelsBuilder> {
  _$GPlotConfigsData_plotConfiguration_channels? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _device;
  String? get device => _$this._device;
  set device(String? device) => _$this._device = device;

  int? _lineColor;
  int? get lineColor => _$this._lineColor;
  set lineColor(int? lineColor) => _$this._lineColor = lineColor;

  String? _markerIndex;
  String? get markerIndex => _$this._markerIndex;
  set markerIndex(String? markerIndex) => _$this._markerIndex = markerIndex;

  GPlotConfigsData_plotConfiguration_channelsBuilder() {
    GPlotConfigsData_plotConfiguration_channels._initializeBuilder(this);
  }

  GPlotConfigsData_plotConfiguration_channelsBuilder get _$this {
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
  void replace(GPlotConfigsData_plotConfiguration_channels other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPlotConfigsData_plotConfiguration_channels;
  }

  @override
  void update(
      void Function(GPlotConfigsData_plotConfiguration_channelsBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GPlotConfigsData_plotConfiguration_channels build() => _build();

  _$GPlotConfigsData_plotConfiguration_channels _build() {
    final _$result = _$v ??
        new _$GPlotConfigsData_plotConfiguration_channels._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GPlotConfigsData_plotConfiguration_channels', 'G__typename'),
            device: BuiltValueNullFieldError.checkNotNull(device,
                r'GPlotConfigsData_plotConfiguration_channels', 'device'),
            lineColor: lineColor,
            markerIndex: markerIndex);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
