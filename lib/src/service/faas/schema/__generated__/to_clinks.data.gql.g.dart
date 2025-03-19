// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'to_clinks.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GToClinksData> _$gToClinksDataSerializer =
    new _$GToClinksDataSerializer();

class _$GToClinksDataSerializer implements StructuredSerializer<GToClinksData> {
  @override
  final Iterable<Type> types = const [GToClinksData, _$GToClinksData];
  @override
  final String wireName = 'GToClinksData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GToClinksData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.unixToClinks;
    if (value != null) {
      result
        ..add('unixToClinks')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  GToClinksData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GToClinksDataBuilder();

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
        case 'unixToClinks':
          result.unixToClinks = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
      }
    }

    return result.build();
  }
}

class _$GToClinksData extends GToClinksData {
  @override
  final String G__typename;
  @override
  final int? unixToClinks;

  factory _$GToClinksData([void Function(GToClinksDataBuilder)? updates]) =>
      (new GToClinksDataBuilder()..update(updates))._build();

  _$GToClinksData._({required this.G__typename, this.unixToClinks})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GToClinksData', 'G__typename');
  }

  @override
  GToClinksData rebuild(void Function(GToClinksDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GToClinksDataBuilder toBuilder() => new GToClinksDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GToClinksData &&
        G__typename == other.G__typename &&
        unixToClinks == other.unixToClinks;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, unixToClinks.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GToClinksData')
          ..add('G__typename', G__typename)
          ..add('unixToClinks', unixToClinks))
        .toString();
  }
}

class GToClinksDataBuilder
    implements Builder<GToClinksData, GToClinksDataBuilder> {
  _$GToClinksData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  int? _unixToClinks;
  int? get unixToClinks => _$this._unixToClinks;
  set unixToClinks(int? unixToClinks) => _$this._unixToClinks = unixToClinks;

  GToClinksDataBuilder() {
    GToClinksData._initializeBuilder(this);
  }

  GToClinksDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _unixToClinks = $v.unixToClinks;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GToClinksData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GToClinksData;
  }

  @override
  void update(void Function(GToClinksDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GToClinksData build() => _build();

  _$GToClinksData _build() {
    final _$result = _$v ??
        new _$GToClinksData._(
          G__typename: BuiltValueNullFieldError.checkNotNull(
              G__typename, r'GToClinksData', 'G__typename'),
          unixToClinks: unixToClinks,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
