// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plot_configs.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GPlotConfigsData> _$gPlotConfigsDataSerializer =
    _$GPlotConfigsDataSerializer();
Serializer<GPlotConfigsData_plotConfiguration>
_$gPlotConfigsDataPlotConfigurationSerializer =
    _$GPlotConfigsData_plotConfigurationSerializer();

class _$GPlotConfigsDataSerializer
    implements StructuredSerializer<GPlotConfigsData> {
  @override
  final Iterable<Type> types = const [GPlotConfigsData, _$GPlotConfigsData];
  @override
  final String wireName = 'GPlotConfigsData';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    GPlotConfigsData object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(
        object.G__typename,
        specifiedType: const FullType(String),
      ),
      'plotConfiguration',
      serializers.serialize(
        object.plotConfiguration,
        specifiedType: const FullType(BuiltList, const [
          const FullType(GPlotConfigsData_plotConfiguration),
        ]),
      ),
    ];

    return result;
  }

  @override
  GPlotConfigsData deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GPlotConfigsDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
        case 'plotConfiguration':
          result.plotConfiguration.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(BuiltList, const [
                    const FullType(GPlotConfigsData_plotConfiguration),
                  ]),
                )!
                as BuiltList<Object?>,
          );
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
    _$GPlotConfigsData_plotConfiguration,
  ];
  @override
  final String wireName = 'GPlotConfigsData_plotConfiguration';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    GPlotConfigsData_plotConfiguration object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(
        object.G__typename,
        specifiedType: const FullType(String),
      ),
      'configId',
      serializers.serialize(
        object.configId,
        specifiedType: const FullType(int),
      ),
      'configName',
      serializers.serialize(
        object.configName,
        specifiedType: const FullType(String),
      ),
      'config',
      serializers.serialize(
        object.config,
        specifiedType: const FullType(String),
      ),
    ];

    return result;
  }

  @override
  GPlotConfigsData_plotConfiguration deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GPlotConfigsData_plotConfigurationBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
        case 'configId':
          result.configId =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(int),
                  )!
                  as int;
          break;
        case 'configName':
          result.configName =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
        case 'config':
          result.config =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
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

  factory _$GPlotConfigsData([
    void Function(GPlotConfigsDataBuilder)? updates,
  ]) => (GPlotConfigsDataBuilder()..update(updates))._build();

  _$GPlotConfigsData._({
    required this.G__typename,
    required this.plotConfiguration,
  }) : super._();
  @override
  GPlotConfigsData rebuild(void Function(GPlotConfigsDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPlotConfigsDataBuilder toBuilder() =>
      GPlotConfigsDataBuilder()..replace(this);

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
          ListBuilder<GPlotConfigsData_plotConfiguration>();
  set plotConfiguration(
    ListBuilder<GPlotConfigsData_plotConfiguration>? plotConfiguration,
  ) => _$this._plotConfiguration = plotConfiguration;

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
      _$result =
          _$v ??
          _$GPlotConfigsData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
              G__typename,
              r'GPlotConfigsData',
              'G__typename',
            ),
            plotConfiguration: plotConfiguration.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'plotConfiguration';
        plotConfiguration.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
          r'GPlotConfigsData',
          _$failedField,
          e.toString(),
        );
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
  final int configId;
  @override
  final String configName;
  @override
  final String config;

  factory _$GPlotConfigsData_plotConfiguration([
    void Function(GPlotConfigsData_plotConfigurationBuilder)? updates,
  ]) => (GPlotConfigsData_plotConfigurationBuilder()..update(updates))._build();

  _$GPlotConfigsData_plotConfiguration._({
    required this.G__typename,
    required this.configId,
    required this.configName,
    required this.config,
  }) : super._();
  @override
  GPlotConfigsData_plotConfiguration rebuild(
    void Function(GPlotConfigsData_plotConfigurationBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  GPlotConfigsData_plotConfigurationBuilder toBuilder() =>
      GPlotConfigsData_plotConfigurationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPlotConfigsData_plotConfiguration &&
        G__typename == other.G__typename &&
        configId == other.configId &&
        configName == other.configName &&
        config == other.config;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, configId.hashCode);
    _$hash = $jc(_$hash, configName.hashCode);
    _$hash = $jc(_$hash, config.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GPlotConfigsData_plotConfiguration')
          ..add('G__typename', G__typename)
          ..add('configId', configId)
          ..add('configName', configName)
          ..add('config', config))
        .toString();
  }
}

class GPlotConfigsData_plotConfigurationBuilder
    implements
        Builder<
          GPlotConfigsData_plotConfiguration,
          GPlotConfigsData_plotConfigurationBuilder
        > {
  _$GPlotConfigsData_plotConfiguration? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  int? _configId;
  int? get configId => _$this._configId;
  set configId(int? configId) => _$this._configId = configId;

  String? _configName;
  String? get configName => _$this._configName;
  set configName(String? configName) => _$this._configName = configName;

  String? _config;
  String? get config => _$this._config;
  set config(String? config) => _$this._config = config;

  GPlotConfigsData_plotConfigurationBuilder() {
    GPlotConfigsData_plotConfiguration._initializeBuilder(this);
  }

  GPlotConfigsData_plotConfigurationBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _configId = $v.configId;
      _configName = $v.configName;
      _config = $v.config;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPlotConfigsData_plotConfiguration other) {
    _$v = other as _$GPlotConfigsData_plotConfiguration;
  }

  @override
  void update(
    void Function(GPlotConfigsData_plotConfigurationBuilder)? updates,
  ) {
    if (updates != null) updates(this);
  }

  @override
  GPlotConfigsData_plotConfiguration build() => _build();

  _$GPlotConfigsData_plotConfiguration _build() {
    final _$result =
        _$v ??
        _$GPlotConfigsData_plotConfiguration._(
          G__typename: BuiltValueNullFieldError.checkNotNull(
            G__typename,
            r'GPlotConfigsData_plotConfiguration',
            'G__typename',
          ),
          configId: BuiltValueNullFieldError.checkNotNull(
            configId,
            r'GPlotConfigsData_plotConfiguration',
            'configId',
          ),
          configName: BuiltValueNullFieldError.checkNotNull(
            configName,
            r'GPlotConfigsData_plotConfiguration',
            'configName',
          ),
          config: BuiltValueNullFieldError.checkNotNull(
            config,
            r'GPlotConfigsData_plotConfiguration',
            'config',
          ),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
