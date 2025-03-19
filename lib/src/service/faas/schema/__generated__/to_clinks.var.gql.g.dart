// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'to_clinks.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GToClinksVars> _$gToClinksVarsSerializer =
    new _$GToClinksVarsSerializer();

class _$GToClinksVarsSerializer implements StructuredSerializer<GToClinksVars> {
  @override
  final Iterable<Type> types = const [GToClinksVars, _$GToClinksVars];
  @override
  final String wireName = 'GToClinksVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GToClinksVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'time',
      serializers.serialize(object.time, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  GToClinksVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GToClinksVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'time':
          result.time = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
      }
    }

    return result.build();
  }
}

class _$GToClinksVars extends GToClinksVars {
  @override
  final int time;

  factory _$GToClinksVars([void Function(GToClinksVarsBuilder)? updates]) =>
      (new GToClinksVarsBuilder()..update(updates))._build();

  _$GToClinksVars._({required this.time}) : super._() {
    BuiltValueNullFieldError.checkNotNull(time, r'GToClinksVars', 'time');
  }

  @override
  GToClinksVars rebuild(void Function(GToClinksVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GToClinksVarsBuilder toBuilder() => new GToClinksVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GToClinksVars && time == other.time;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, time.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GToClinksVars')..add('time', time))
        .toString();
  }
}

class GToClinksVarsBuilder
    implements Builder<GToClinksVars, GToClinksVarsBuilder> {
  _$GToClinksVars? _$v;

  int? _time;
  int? get time => _$this._time;
  set time(int? time) => _$this._time = time;

  GToClinksVarsBuilder();

  GToClinksVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _time = $v.time;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GToClinksVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GToClinksVars;
  }

  @override
  void update(void Function(GToClinksVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GToClinksVars build() => _build();

  _$GToClinksVars _build() {
    final _$result = _$v ??
        new _$GToClinksVars._(
          time: BuiltValueNullFieldError.checkNotNull(
              time, r'GToClinksVars', 'time'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
