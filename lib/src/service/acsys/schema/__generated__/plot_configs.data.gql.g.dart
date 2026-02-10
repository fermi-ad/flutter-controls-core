// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plot_configs.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GPlotConfigsData> _$gPlotConfigsDataSerializer =
    _$GPlotConfigsDataSerializer();

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
          const FullType(String),
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
                    const FullType(String),
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

class _$GPlotConfigsData extends GPlotConfigsData {
  @override
  final String G__typename;
  @override
  final BuiltList<String> plotConfiguration;

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

  ListBuilder<String>? _plotConfiguration;
  ListBuilder<String> get plotConfiguration =>
      _$this._plotConfiguration ??= ListBuilder<String>();
  set plotConfiguration(ListBuilder<String>? plotConfiguration) =>
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

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
