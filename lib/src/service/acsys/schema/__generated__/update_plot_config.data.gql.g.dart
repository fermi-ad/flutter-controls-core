// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_plot_config.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GUpdatePlotConfigData> _$gUpdatePlotConfigDataSerializer =
    new _$GUpdatePlotConfigDataSerializer();
Serializer<GUpdatePlotConfigData_updatePlotConfiguration>
    _$gUpdatePlotConfigDataUpdatePlotConfigurationSerializer =
    new _$GUpdatePlotConfigData_updatePlotConfigurationSerializer();

class _$GUpdatePlotConfigDataSerializer
    implements StructuredSerializer<GUpdatePlotConfigData> {
  @override
  final Iterable<Type> types = const [
    GUpdatePlotConfigData,
    _$GUpdatePlotConfigData
  ];
  @override
  final String wireName = 'GUpdatePlotConfigData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GUpdatePlotConfigData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'updatePlotConfiguration',
      serializers.serialize(object.updatePlotConfiguration,
          specifiedType:
              const FullType(GUpdatePlotConfigData_updatePlotConfiguration)),
    ];

    return result;
  }

  @override
  GUpdatePlotConfigData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUpdatePlotConfigDataBuilder();

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
        case 'updatePlotConfiguration':
          result.updatePlotConfiguration.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GUpdatePlotConfigData_updatePlotConfiguration))!
              as GUpdatePlotConfigData_updatePlotConfiguration);
          break;
      }
    }

    return result.build();
  }
}

class _$GUpdatePlotConfigData_updatePlotConfigurationSerializer
    implements
        StructuredSerializer<GUpdatePlotConfigData_updatePlotConfiguration> {
  @override
  final Iterable<Type> types = const [
    GUpdatePlotConfigData_updatePlotConfiguration,
    _$GUpdatePlotConfigData_updatePlotConfiguration
  ];
  @override
  final String wireName = 'GUpdatePlotConfigData_updatePlotConfiguration';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GUpdatePlotConfigData_updatePlotConfiguration object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'status',
      serializers.serialize(object.status, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  GUpdatePlotConfigData_updatePlotConfiguration deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUpdatePlotConfigData_updatePlotConfigurationBuilder();

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
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
      }
    }

    return result.build();
  }
}

class _$GUpdatePlotConfigData extends GUpdatePlotConfigData {
  @override
  final String G__typename;
  @override
  final GUpdatePlotConfigData_updatePlotConfiguration updatePlotConfiguration;

  factory _$GUpdatePlotConfigData(
          [void Function(GUpdatePlotConfigDataBuilder)? updates]) =>
      (new GUpdatePlotConfigDataBuilder()..update(updates))._build();

  _$GUpdatePlotConfigData._(
      {required this.G__typename, required this.updatePlotConfiguration})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GUpdatePlotConfigData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(updatePlotConfiguration,
        r'GUpdatePlotConfigData', 'updatePlotConfiguration');
  }

  @override
  GUpdatePlotConfigData rebuild(
          void Function(GUpdatePlotConfigDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUpdatePlotConfigDataBuilder toBuilder() =>
      new GUpdatePlotConfigDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUpdatePlotConfigData &&
        G__typename == other.G__typename &&
        updatePlotConfiguration == other.updatePlotConfiguration;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, updatePlotConfiguration.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GUpdatePlotConfigData')
          ..add('G__typename', G__typename)
          ..add('updatePlotConfiguration', updatePlotConfiguration))
        .toString();
  }
}

class GUpdatePlotConfigDataBuilder
    implements Builder<GUpdatePlotConfigData, GUpdatePlotConfigDataBuilder> {
  _$GUpdatePlotConfigData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GUpdatePlotConfigData_updatePlotConfigurationBuilder?
      _updatePlotConfiguration;
  GUpdatePlotConfigData_updatePlotConfigurationBuilder
      get updatePlotConfiguration => _$this._updatePlotConfiguration ??=
          new GUpdatePlotConfigData_updatePlotConfigurationBuilder();
  set updatePlotConfiguration(
          GUpdatePlotConfigData_updatePlotConfigurationBuilder?
              updatePlotConfiguration) =>
      _$this._updatePlotConfiguration = updatePlotConfiguration;

  GUpdatePlotConfigDataBuilder() {
    GUpdatePlotConfigData._initializeBuilder(this);
  }

  GUpdatePlotConfigDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _updatePlotConfiguration = $v.updatePlotConfiguration.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUpdatePlotConfigData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUpdatePlotConfigData;
  }

  @override
  void update(void Function(GUpdatePlotConfigDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUpdatePlotConfigData build() => _build();

  _$GUpdatePlotConfigData _build() {
    _$GUpdatePlotConfigData _$result;
    try {
      _$result = _$v ??
          new _$GUpdatePlotConfigData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GUpdatePlotConfigData', 'G__typename'),
              updatePlotConfiguration: updatePlotConfiguration.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'updatePlotConfiguration';
        updatePlotConfiguration.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GUpdatePlotConfigData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GUpdatePlotConfigData_updatePlotConfiguration
    extends GUpdatePlotConfigData_updatePlotConfiguration {
  @override
  final String G__typename;
  @override
  final int status;

  factory _$GUpdatePlotConfigData_updatePlotConfiguration(
          [void Function(GUpdatePlotConfigData_updatePlotConfigurationBuilder)?
              updates]) =>
      (new GUpdatePlotConfigData_updatePlotConfigurationBuilder()
            ..update(updates))
          ._build();

  _$GUpdatePlotConfigData_updatePlotConfiguration._(
      {required this.G__typename, required this.status})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GUpdatePlotConfigData_updatePlotConfiguration', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        status, r'GUpdatePlotConfigData_updatePlotConfiguration', 'status');
  }

  @override
  GUpdatePlotConfigData_updatePlotConfiguration rebuild(
          void Function(GUpdatePlotConfigData_updatePlotConfigurationBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUpdatePlotConfigData_updatePlotConfigurationBuilder toBuilder() =>
      new GUpdatePlotConfigData_updatePlotConfigurationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUpdatePlotConfigData_updatePlotConfiguration &&
        G__typename == other.G__typename &&
        status == other.status;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GUpdatePlotConfigData_updatePlotConfiguration')
          ..add('G__typename', G__typename)
          ..add('status', status))
        .toString();
  }
}

class GUpdatePlotConfigData_updatePlotConfigurationBuilder
    implements
        Builder<GUpdatePlotConfigData_updatePlotConfiguration,
            GUpdatePlotConfigData_updatePlotConfigurationBuilder> {
  _$GUpdatePlotConfigData_updatePlotConfiguration? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  int? _status;
  int? get status => _$this._status;
  set status(int? status) => _$this._status = status;

  GUpdatePlotConfigData_updatePlotConfigurationBuilder() {
    GUpdatePlotConfigData_updatePlotConfiguration._initializeBuilder(this);
  }

  GUpdatePlotConfigData_updatePlotConfigurationBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _status = $v.status;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUpdatePlotConfigData_updatePlotConfiguration other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUpdatePlotConfigData_updatePlotConfiguration;
  }

  @override
  void update(
      void Function(GUpdatePlotConfigData_updatePlotConfigurationBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GUpdatePlotConfigData_updatePlotConfiguration build() => _build();

  _$GUpdatePlotConfigData_updatePlotConfiguration _build() {
    final _$result = _$v ??
        new _$GUpdatePlotConfigData_updatePlotConfiguration._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GUpdatePlotConfigData_updatePlotConfiguration',
                'G__typename'),
            status: BuiltValueNullFieldError.checkNotNull(status,
                r'GUpdatePlotConfigData_updatePlotConfiguration', 'status'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
