// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_plot_config.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GUpdatePlotConfigVars> _$gUpdatePlotConfigVarsSerializer =
    _$GUpdatePlotConfigVarsSerializer();

class _$GUpdatePlotConfigVarsSerializer
    implements StructuredSerializer<GUpdatePlotConfigVars> {
  @override
  final Iterable<Type> types = const [
    GUpdatePlotConfigVars,
    _$GUpdatePlotConfigVars,
  ];
  @override
  final String wireName = 'GUpdatePlotConfigVars';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    GUpdatePlotConfigVars object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'cfg',
      serializers.serialize(object.cfg, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  GUpdatePlotConfigVars deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GUpdatePlotConfigVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id =
              serializers.deserialize(value, specifiedType: const FullType(int))
                  as int?;
          break;
        case 'name':
          result.name =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
        case 'cfg':
          result.cfg =
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

class _$GUpdatePlotConfigVars extends GUpdatePlotConfigVars {
  @override
  final int? id;
  @override
  final String name;
  @override
  final String cfg;

  factory _$GUpdatePlotConfigVars([
    void Function(GUpdatePlotConfigVarsBuilder)? updates,
  ]) => (GUpdatePlotConfigVarsBuilder()..update(updates))._build();

  _$GUpdatePlotConfigVars._({this.id, required this.name, required this.cfg})
    : super._();
  @override
  GUpdatePlotConfigVars rebuild(
    void Function(GUpdatePlotConfigVarsBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  GUpdatePlotConfigVarsBuilder toBuilder() =>
      GUpdatePlotConfigVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUpdatePlotConfigVars &&
        id == other.id &&
        name == other.name &&
        cfg == other.cfg;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, cfg.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GUpdatePlotConfigVars')
          ..add('id', id)
          ..add('name', name)
          ..add('cfg', cfg))
        .toString();
  }
}

class GUpdatePlotConfigVarsBuilder
    implements Builder<GUpdatePlotConfigVars, GUpdatePlotConfigVarsBuilder> {
  _$GUpdatePlotConfigVars? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _cfg;
  String? get cfg => _$this._cfg;
  set cfg(String? cfg) => _$this._cfg = cfg;

  GUpdatePlotConfigVarsBuilder();

  GUpdatePlotConfigVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _cfg = $v.cfg;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUpdatePlotConfigVars other) {
    _$v = other as _$GUpdatePlotConfigVars;
  }

  @override
  void update(void Function(GUpdatePlotConfigVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUpdatePlotConfigVars build() => _build();

  _$GUpdatePlotConfigVars _build() {
    final _$result =
        _$v ??
        _$GUpdatePlotConfigVars._(
          id: id,
          name: BuiltValueNullFieldError.checkNotNull(
            name,
            r'GUpdatePlotConfigVars',
            'name',
          ),
          cfg: BuiltValueNullFieldError.checkNotNull(
            cfg,
            r'GUpdatePlotConfigVars',
            'cfg',
          ),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
