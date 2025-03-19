// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'to_unix.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GToUnixVars> _$gToUnixVarsSerializer = new _$GToUnixVarsSerializer();

class _$GToUnixVarsSerializer implements StructuredSerializer<GToUnixVars> {
  @override
  final Iterable<Type> types = const [GToUnixVars, _$GToUnixVars];
  @override
  final String wireName = 'GToUnixVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GToUnixVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'clinks',
      serializers.serialize(object.clinks, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  GToUnixVars deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GToUnixVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'clinks':
          result.clinks = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
      }
    }

    return result.build();
  }
}

class _$GToUnixVars extends GToUnixVars {
  @override
  final int clinks;

  factory _$GToUnixVars([void Function(GToUnixVarsBuilder)? updates]) =>
      (new GToUnixVarsBuilder()..update(updates))._build();

  _$GToUnixVars._({required this.clinks}) : super._() {
    BuiltValueNullFieldError.checkNotNull(clinks, r'GToUnixVars', 'clinks');
  }

  @override
  GToUnixVars rebuild(void Function(GToUnixVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GToUnixVarsBuilder toBuilder() => new GToUnixVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GToUnixVars && clinks == other.clinks;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, clinks.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GToUnixVars')..add('clinks', clinks))
        .toString();
  }
}

class GToUnixVarsBuilder implements Builder<GToUnixVars, GToUnixVarsBuilder> {
  _$GToUnixVars? _$v;

  int? _clinks;
  int? get clinks => _$this._clinks;
  set clinks(int? clinks) => _$this._clinks = clinks;

  GToUnixVarsBuilder();

  GToUnixVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _clinks = $v.clinks;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GToUnixVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GToUnixVars;
  }

  @override
  void update(void Function(GToUnixVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GToUnixVars build() => _build();

  _$GToUnixVars _build() {
    final _$result = _$v ??
        new _$GToUnixVars._(
          clinks: BuiltValueNullFieldError.checkNotNull(
              clinks, r'GToUnixVars', 'clinks'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
