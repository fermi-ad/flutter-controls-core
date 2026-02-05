// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'read_alarms.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GAlarmsSnapshotData> _$gAlarmsSnapshotDataSerializer =
    _$GAlarmsSnapshotDataSerializer();
Serializer<GAlarmsSnapshotData_alarmsSnapshot>
_$gAlarmsSnapshotDataAlarmsSnapshotSerializer =
    _$GAlarmsSnapshotData_alarmsSnapshotSerializer();

class _$GAlarmsSnapshotDataSerializer
    implements StructuredSerializer<GAlarmsSnapshotData> {
  @override
  final Iterable<Type> types = const [
    GAlarmsSnapshotData,
    _$GAlarmsSnapshotData,
  ];
  @override
  final String wireName = 'GAlarmsSnapshotData';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    GAlarmsSnapshotData object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(
        object.G__typename,
        specifiedType: const FullType(String),
      ),
      'alarmsSnapshot',
      serializers.serialize(
        object.alarmsSnapshot,
        specifiedType: const FullType(BuiltList, const [
          const FullType(GAlarmsSnapshotData_alarmsSnapshot),
        ]),
      ),
    ];

    return result;
  }

  @override
  GAlarmsSnapshotData deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GAlarmsSnapshotDataBuilder();

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
        case 'alarmsSnapshot':
          result.alarmsSnapshot.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(BuiltList, const [
                    const FullType(GAlarmsSnapshotData_alarmsSnapshot),
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

class _$GAlarmsSnapshotData_alarmsSnapshotSerializer
    implements StructuredSerializer<GAlarmsSnapshotData_alarmsSnapshot> {
  @override
  final Iterable<Type> types = const [
    GAlarmsSnapshotData_alarmsSnapshot,
    _$GAlarmsSnapshotData_alarmsSnapshot,
  ];
  @override
  final String wireName = 'GAlarmsSnapshotData_alarmsSnapshot';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    GAlarmsSnapshotData_alarmsSnapshot object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(
        object.G__typename,
        specifiedType: const FullType(String),
      ),
      'value',
      serializers.serialize(
        object.value,
        specifiedType: const FullType(String),
      ),
    ];
    Object? value;
    value = object.key;
    if (value != null) {
      result
        ..add('key')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }
    return result;
  }

  @override
  GAlarmsSnapshotData_alarmsSnapshot deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GAlarmsSnapshotData_alarmsSnapshotBuilder();

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
        case 'key':
          result.key =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String?;
          break;
        case 'value':
          result.value =
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

class _$GAlarmsSnapshotData extends GAlarmsSnapshotData {
  @override
  final String G__typename;
  @override
  final BuiltList<GAlarmsSnapshotData_alarmsSnapshot> alarmsSnapshot;

  factory _$GAlarmsSnapshotData([
    void Function(GAlarmsSnapshotDataBuilder)? updates,
  ]) => (GAlarmsSnapshotDataBuilder()..update(updates))._build();

  _$GAlarmsSnapshotData._({
    required this.G__typename,
    required this.alarmsSnapshot,
  }) : super._();
  @override
  GAlarmsSnapshotData rebuild(
    void Function(GAlarmsSnapshotDataBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  GAlarmsSnapshotDataBuilder toBuilder() =>
      GAlarmsSnapshotDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GAlarmsSnapshotData &&
        G__typename == other.G__typename &&
        alarmsSnapshot == other.alarmsSnapshot;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, alarmsSnapshot.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GAlarmsSnapshotData')
          ..add('G__typename', G__typename)
          ..add('alarmsSnapshot', alarmsSnapshot))
        .toString();
  }
}

class GAlarmsSnapshotDataBuilder
    implements Builder<GAlarmsSnapshotData, GAlarmsSnapshotDataBuilder> {
  _$GAlarmsSnapshotData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GAlarmsSnapshotData_alarmsSnapshot>? _alarmsSnapshot;
  ListBuilder<GAlarmsSnapshotData_alarmsSnapshot> get alarmsSnapshot =>
      _$this._alarmsSnapshot ??=
          ListBuilder<GAlarmsSnapshotData_alarmsSnapshot>();
  set alarmsSnapshot(
    ListBuilder<GAlarmsSnapshotData_alarmsSnapshot>? alarmsSnapshot,
  ) => _$this._alarmsSnapshot = alarmsSnapshot;

  GAlarmsSnapshotDataBuilder() {
    GAlarmsSnapshotData._initializeBuilder(this);
  }

  GAlarmsSnapshotDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _alarmsSnapshot = $v.alarmsSnapshot.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GAlarmsSnapshotData other) {
    _$v = other as _$GAlarmsSnapshotData;
  }

  @override
  void update(void Function(GAlarmsSnapshotDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GAlarmsSnapshotData build() => _build();

  _$GAlarmsSnapshotData _build() {
    _$GAlarmsSnapshotData _$result;
    try {
      _$result =
          _$v ??
          _$GAlarmsSnapshotData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
              G__typename,
              r'GAlarmsSnapshotData',
              'G__typename',
            ),
            alarmsSnapshot: alarmsSnapshot.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'alarmsSnapshot';
        alarmsSnapshot.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
          r'GAlarmsSnapshotData',
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

class _$GAlarmsSnapshotData_alarmsSnapshot
    extends GAlarmsSnapshotData_alarmsSnapshot {
  @override
  final String G__typename;
  @override
  final String? key;
  @override
  final String value;

  factory _$GAlarmsSnapshotData_alarmsSnapshot([
    void Function(GAlarmsSnapshotData_alarmsSnapshotBuilder)? updates,
  ]) => (GAlarmsSnapshotData_alarmsSnapshotBuilder()..update(updates))._build();

  _$GAlarmsSnapshotData_alarmsSnapshot._({
    required this.G__typename,
    this.key,
    required this.value,
  }) : super._();
  @override
  GAlarmsSnapshotData_alarmsSnapshot rebuild(
    void Function(GAlarmsSnapshotData_alarmsSnapshotBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  GAlarmsSnapshotData_alarmsSnapshotBuilder toBuilder() =>
      GAlarmsSnapshotData_alarmsSnapshotBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GAlarmsSnapshotData_alarmsSnapshot &&
        G__typename == other.G__typename &&
        key == other.key &&
        value == other.value;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, key.hashCode);
    _$hash = $jc(_$hash, value.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GAlarmsSnapshotData_alarmsSnapshot')
          ..add('G__typename', G__typename)
          ..add('key', key)
          ..add('value', value))
        .toString();
  }
}

class GAlarmsSnapshotData_alarmsSnapshotBuilder
    implements
        Builder<
          GAlarmsSnapshotData_alarmsSnapshot,
          GAlarmsSnapshotData_alarmsSnapshotBuilder
        > {
  _$GAlarmsSnapshotData_alarmsSnapshot? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _key;
  String? get key => _$this._key;
  set key(String? key) => _$this._key = key;

  String? _value;
  String? get value => _$this._value;
  set value(String? value) => _$this._value = value;

  GAlarmsSnapshotData_alarmsSnapshotBuilder() {
    GAlarmsSnapshotData_alarmsSnapshot._initializeBuilder(this);
  }

  GAlarmsSnapshotData_alarmsSnapshotBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _key = $v.key;
      _value = $v.value;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GAlarmsSnapshotData_alarmsSnapshot other) {
    _$v = other as _$GAlarmsSnapshotData_alarmsSnapshot;
  }

  @override
  void update(
    void Function(GAlarmsSnapshotData_alarmsSnapshotBuilder)? updates,
  ) {
    if (updates != null) updates(this);
  }

  @override
  GAlarmsSnapshotData_alarmsSnapshot build() => _build();

  _$GAlarmsSnapshotData_alarmsSnapshot _build() {
    final _$result =
        _$v ??
        _$GAlarmsSnapshotData_alarmsSnapshot._(
          G__typename: BuiltValueNullFieldError.checkNotNull(
            G__typename,
            r'GAlarmsSnapshotData_alarmsSnapshot',
            'G__typename',
          ),
          key: key,
          value: BuiltValueNullFieldError.checkNotNull(
            value,
            r'GAlarmsSnapshotData_alarmsSnapshot',
            'value',
          ),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
