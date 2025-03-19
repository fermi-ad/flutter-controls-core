// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'to_unix.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GToUnixData> _$gToUnixDataSerializer = new _$GToUnixDataSerializer();

class _$GToUnixDataSerializer implements StructuredSerializer<GToUnixData> {
  @override
  final Iterable<Type> types = const [GToUnixData, _$GToUnixData];
  @override
  final String wireName = 'GToUnixData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GToUnixData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'clinksToUnix',
      serializers.serialize(object.clinksToUnix,
          specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  GToUnixData deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GToUnixDataBuilder();

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
        case 'clinksToUnix':
          result.clinksToUnix = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
      }
    }

    return result.build();
  }
}

class _$GToUnixData extends GToUnixData {
  @override
  final String G__typename;
  @override
  final int clinksToUnix;

  factory _$GToUnixData([void Function(GToUnixDataBuilder)? updates]) =>
      (new GToUnixDataBuilder()..update(updates))._build();

  _$GToUnixData._({required this.G__typename, required this.clinksToUnix})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GToUnixData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        clinksToUnix, r'GToUnixData', 'clinksToUnix');
  }

  @override
  GToUnixData rebuild(void Function(GToUnixDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GToUnixDataBuilder toBuilder() => new GToUnixDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GToUnixData &&
        G__typename == other.G__typename &&
        clinksToUnix == other.clinksToUnix;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, clinksToUnix.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GToUnixData')
          ..add('G__typename', G__typename)
          ..add('clinksToUnix', clinksToUnix))
        .toString();
  }
}

class GToUnixDataBuilder implements Builder<GToUnixData, GToUnixDataBuilder> {
  _$GToUnixData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  int? _clinksToUnix;
  int? get clinksToUnix => _$this._clinksToUnix;
  set clinksToUnix(int? clinksToUnix) => _$this._clinksToUnix = clinksToUnix;

  GToUnixDataBuilder() {
    GToUnixData._initializeBuilder(this);
  }

  GToUnixDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _clinksToUnix = $v.clinksToUnix;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GToUnixData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GToUnixData;
  }

  @override
  void update(void Function(GToUnixDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GToUnixData build() => _build();

  _$GToUnixData _build() {
    final _$result = _$v ??
        new _$GToUnixData._(
          G__typename: BuiltValueNullFieldError.checkNotNull(
              G__typename, r'GToUnixData', 'G__typename'),
          clinksToUnix: BuiltValueNullFieldError.checkNotNull(
              clinksToUnix, r'GToUnixData', 'clinksToUnix'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
