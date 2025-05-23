// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_users_config.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GSetUsersConfigVars> _$gSetUsersConfigVarsSerializer =
    new _$GSetUsersConfigVarsSerializer();

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
      serializers.serialize(
        object.cfg,
        specifiedType: const FullType(_i1.GPlotConfigurationSnapshotIn),
      ),
    ];
    Object? value;
    value = object.user;
    if (value != null) {
      result
        ..add('user')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }
    return result;
  }

  @override
  GSetUsersConfigVars deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = new GSetUsersConfigVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'user':
          result.user =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String?;
          break;
        case 'cfg':
          result.cfg.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(
                    _i1.GPlotConfigurationSnapshotIn,
                  ),
                )!
                as _i1.GPlotConfigurationSnapshotIn,
          );
          break;
      }
    }

    return result.build();
  }
}

class _$GSetUsersConfigVars extends GSetUsersConfigVars {
  @override
  final String? user;
  @override
  final _i1.GPlotConfigurationSnapshotIn cfg;

  factory _$GSetUsersConfigVars([
    void Function(GSetUsersConfigVarsBuilder)? updates,
  ]) => (new GSetUsersConfigVarsBuilder()..update(updates))._build();

  _$GSetUsersConfigVars._({this.user, required this.cfg}) : super._() {
    BuiltValueNullFieldError.checkNotNull(cfg, r'GSetUsersConfigVars', 'cfg');
  }

  @override
  GSetUsersConfigVars rebuild(
    void Function(GSetUsersConfigVarsBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  GSetUsersConfigVarsBuilder toBuilder() =>
      new GSetUsersConfigVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GSetUsersConfigVars &&
        user == other.user &&
        cfg == other.cfg;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, user.hashCode);
    _$hash = $jc(_$hash, cfg.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GSetUsersConfigVars')
          ..add('user', user)
          ..add('cfg', cfg))
        .toString();
  }
}

class GSetUsersConfigVarsBuilder
    implements Builder<GSetUsersConfigVars, GSetUsersConfigVarsBuilder> {
  _$GSetUsersConfigVars? _$v;

  String? _user;
  String? get user => _$this._user;
  set user(String? user) => _$this._user = user;

  _i1.GPlotConfigurationSnapshotInBuilder? _cfg;
  _i1.GPlotConfigurationSnapshotInBuilder get cfg =>
      _$this._cfg ??= new _i1.GPlotConfigurationSnapshotInBuilder();
  set cfg(_i1.GPlotConfigurationSnapshotInBuilder? cfg) => _$this._cfg = cfg;

  GSetUsersConfigVarsBuilder();

  GSetUsersConfigVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _user = $v.user;
      _cfg = $v.cfg.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GSetUsersConfigVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GSetUsersConfigVars;
  }

  @override
  void update(void Function(GSetUsersConfigVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GSetUsersConfigVars build() => _build();

  _$GSetUsersConfigVars _build() {
    _$GSetUsersConfigVars _$result;
    try {
      _$result =
          _$v ?? new _$GSetUsersConfigVars._(user: user, cfg: cfg.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'cfg';
        cfg.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
          r'GSetUsersConfigVars',
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
