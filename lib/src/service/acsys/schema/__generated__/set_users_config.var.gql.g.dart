// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_users_config.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GSetUsersConfigVars> _$gSetUsersConfigVarsSerializer =
    _$GSetUsersConfigVarsSerializer();

class _$GSetUsersConfigVarsSerializer
    implements StructuredSerializer<GSetUsersConfigVars> {
  @override
  final Iterable<Type> types = const [
    GSetUsersConfigVars,
    _$GSetUsersConfigVars,
  ];
  @override
  final String wireName = 'GSetUsersConfigVars';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    GSetUsersConfigVars object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'cfg',
      serializers.serialize(object.cfg, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GSetUsersConfigVars deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GSetUsersConfigVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
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

class _$GSetUsersConfigVars extends GSetUsersConfigVars {
  @override
  final String cfg;

  factory _$GSetUsersConfigVars([
    void Function(GSetUsersConfigVarsBuilder)? updates,
  ]) => (GSetUsersConfigVarsBuilder()..update(updates))._build();

  _$GSetUsersConfigVars._({required this.cfg}) : super._();
  @override
  GSetUsersConfigVars rebuild(
    void Function(GSetUsersConfigVarsBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  GSetUsersConfigVarsBuilder toBuilder() =>
      GSetUsersConfigVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GSetUsersConfigVars && cfg == other.cfg;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, cfg.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GSetUsersConfigVars')
      ..add('cfg', cfg)).toString();
  }
}

class GSetUsersConfigVarsBuilder
    implements Builder<GSetUsersConfigVars, GSetUsersConfigVarsBuilder> {
  _$GSetUsersConfigVars? _$v;

  String? _cfg;
  String? get cfg => _$this._cfg;
  set cfg(String? cfg) => _$this._cfg = cfg;

  GSetUsersConfigVarsBuilder();

  GSetUsersConfigVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _cfg = $v.cfg;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GSetUsersConfigVars other) {
    _$v = other as _$GSetUsersConfigVars;
  }

  @override
  void update(void Function(GSetUsersConfigVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GSetUsersConfigVars build() => _build();

  _$GSetUsersConfigVars _build() {
    final _$result =
        _$v ??
        _$GSetUsersConfigVars._(
          cfg: BuiltValueNullFieldError.checkNotNull(
            cfg,
            r'GSetUsersConfigVars',
            'cfg',
          ),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
