// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_last_config.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GUsersLastConfigData> _$gUsersLastConfigDataSerializer =
    _$GUsersLastConfigDataSerializer();

class _$GUsersLastConfigDataSerializer
    implements StructuredSerializer<GUsersLastConfigData> {
  @override
  final Iterable<Type> types = const [
    GUsersLastConfigData,
    _$GUsersLastConfigData,
  ];
  @override
  final String wireName = 'GUsersLastConfigData';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    GUsersLastConfigData object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(
        object.G__typename,
        specifiedType: const FullType(String),
      ),
    ];
    Object? value;
    value = object.usersLastConfiguration;
    if (value != null) {
      result
        ..add('usersLastConfiguration')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }
    return result;
  }

  @override
  GUsersLastConfigData deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GUsersLastConfigDataBuilder();

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
        case 'usersLastConfiguration':
          result.usersLastConfiguration =
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

class _$GUsersLastConfigData extends GUsersLastConfigData {
  @override
  final String G__typename;
  @override
  final String? usersLastConfiguration;

  factory _$GUsersLastConfigData([
    void Function(GUsersLastConfigDataBuilder)? updates,
  ]) => (GUsersLastConfigDataBuilder()..update(updates))._build();

  _$GUsersLastConfigData._({
    required this.G__typename,
    this.usersLastConfiguration,
  }) : super._();
  @override
  GUsersLastConfigData rebuild(
    void Function(GUsersLastConfigDataBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  GUsersLastConfigDataBuilder toBuilder() =>
      GUsersLastConfigDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUsersLastConfigData &&
        G__typename == other.G__typename &&
        usersLastConfiguration == other.usersLastConfiguration;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, usersLastConfiguration.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GUsersLastConfigData')
          ..add('G__typename', G__typename)
          ..add('usersLastConfiguration', usersLastConfiguration))
        .toString();
  }
}

class GUsersLastConfigDataBuilder
    implements Builder<GUsersLastConfigData, GUsersLastConfigDataBuilder> {
  _$GUsersLastConfigData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _usersLastConfiguration;
  String? get usersLastConfiguration => _$this._usersLastConfiguration;
  set usersLastConfiguration(String? usersLastConfiguration) =>
      _$this._usersLastConfiguration = usersLastConfiguration;

  GUsersLastConfigDataBuilder() {
    GUsersLastConfigData._initializeBuilder(this);
  }

  GUsersLastConfigDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _usersLastConfiguration = $v.usersLastConfiguration;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUsersLastConfigData other) {
    _$v = other as _$GUsersLastConfigData;
  }

  @override
  void update(void Function(GUsersLastConfigDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUsersLastConfigData build() => _build();

  _$GUsersLastConfigData _build() {
    final _$result =
        _$v ??
        _$GUsersLastConfigData._(
          G__typename: BuiltValueNullFieldError.checkNotNull(
            G__typename,
            r'GUsersLastConfigData',
            'G__typename',
          ),
          usersLastConfiguration: usersLastConfiguration,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
