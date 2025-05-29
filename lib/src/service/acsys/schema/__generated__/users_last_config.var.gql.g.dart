// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_last_config.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GUsersLastConfigVars> _$gUsersLastConfigVarsSerializer =
    new _$GUsersLastConfigVarsSerializer();

class _$GUsersLastConfigVarsSerializer
    implements StructuredSerializer<GUsersLastConfigVars> {
  @override
  final Iterable<Type> types = const [
    GUsersLastConfigVars,
    _$GUsersLastConfigVars,
  ];
  @override
  final String wireName = 'GUsersLastConfigVars';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    GUsersLastConfigVars object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[];
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
  GUsersLastConfigVars deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = new GUsersLastConfigVarsBuilder();

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
      }
    }

    return result.build();
  }
}

class _$GUsersLastConfigVars extends GUsersLastConfigVars {
  @override
  final String? user;

  factory _$GUsersLastConfigVars([
    void Function(GUsersLastConfigVarsBuilder)? updates,
  ]) => (new GUsersLastConfigVarsBuilder()..update(updates))._build();

  _$GUsersLastConfigVars._({this.user}) : super._();

  @override
  GUsersLastConfigVars rebuild(
    void Function(GUsersLastConfigVarsBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  GUsersLastConfigVarsBuilder toBuilder() =>
      new GUsersLastConfigVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUsersLastConfigVars && user == other.user;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, user.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GUsersLastConfigVars')
      ..add('user', user)).toString();
  }
}

class GUsersLastConfigVarsBuilder
    implements Builder<GUsersLastConfigVars, GUsersLastConfigVarsBuilder> {
  _$GUsersLastConfigVars? _$v;

  String? _user;
  String? get user => _$this._user;
  set user(String? user) => _$this._user = user;

  GUsersLastConfigVarsBuilder();

  GUsersLastConfigVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _user = $v.user;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUsersLastConfigVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUsersLastConfigVars;
  }

  @override
  void update(void Function(GUsersLastConfigVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUsersLastConfigVars build() => _build();

  _$GUsersLastConfigVars _build() {
    final _$result = _$v ?? new _$GUsersLastConfigVars._(user: user);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
