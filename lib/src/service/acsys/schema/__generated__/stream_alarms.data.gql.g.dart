// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stream_alarms.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GStreamAlarmsData> _$gStreamAlarmsDataSerializer =
    _$GStreamAlarmsDataSerializer();
Serializer<GStreamAlarmsData_alarms> _$gStreamAlarmsDataAlarmsSerializer =
    _$GStreamAlarmsData_alarmsSerializer();

class _$GStreamAlarmsDataSerializer
    implements StructuredSerializer<GStreamAlarmsData> {
  @override
  final Iterable<Type> types = const [GStreamAlarmsData, _$GStreamAlarmsData];
  @override
  final String wireName = 'GStreamAlarmsData';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    GStreamAlarmsData object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(
        object.G__typename,
        specifiedType: const FullType(String),
      ),
      'alarms',
      serializers.serialize(
        object.alarms,
        specifiedType: const FullType(GStreamAlarmsData_alarms),
      ),
    ];

    return result;
  }

  @override
  GStreamAlarmsData deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GStreamAlarmsDataBuilder();

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
        case 'alarms':
          result.alarms.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(GStreamAlarmsData_alarms),
                )!
                as GStreamAlarmsData_alarms,
          );
          break;
      }
    }

    return result.build();
  }
}

class _$GStreamAlarmsData_alarmsSerializer
    implements StructuredSerializer<GStreamAlarmsData_alarms> {
  @override
  final Iterable<Type> types = const [
    GStreamAlarmsData_alarms,
    _$GStreamAlarmsData_alarms,
  ];
  @override
  final String wireName = 'GStreamAlarmsData_alarms';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    GStreamAlarmsData_alarms object, {
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
  GStreamAlarmsData_alarms deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GStreamAlarmsData_alarmsBuilder();

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

class _$GStreamAlarmsData extends GStreamAlarmsData {
  @override
  final String G__typename;
  @override
  final GStreamAlarmsData_alarms alarms;

  factory _$GStreamAlarmsData([
    void Function(GStreamAlarmsDataBuilder)? updates,
  ]) => (GStreamAlarmsDataBuilder()..update(updates))._build();

  _$GStreamAlarmsData._({required this.G__typename, required this.alarms})
    : super._();
  @override
  GStreamAlarmsData rebuild(void Function(GStreamAlarmsDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GStreamAlarmsDataBuilder toBuilder() =>
      GStreamAlarmsDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GStreamAlarmsData &&
        G__typename == other.G__typename &&
        alarms == other.alarms;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, alarms.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GStreamAlarmsData')
          ..add('G__typename', G__typename)
          ..add('alarms', alarms))
        .toString();
  }
}

class GStreamAlarmsDataBuilder
    implements Builder<GStreamAlarmsData, GStreamAlarmsDataBuilder> {
  _$GStreamAlarmsData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GStreamAlarmsData_alarmsBuilder? _alarms;
  GStreamAlarmsData_alarmsBuilder get alarms =>
      _$this._alarms ??= GStreamAlarmsData_alarmsBuilder();
  set alarms(GStreamAlarmsData_alarmsBuilder? alarms) =>
      _$this._alarms = alarms;

  GStreamAlarmsDataBuilder() {
    GStreamAlarmsData._initializeBuilder(this);
  }

  GStreamAlarmsDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _alarms = $v.alarms.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GStreamAlarmsData other) {
    _$v = other as _$GStreamAlarmsData;
  }

  @override
  void update(void Function(GStreamAlarmsDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GStreamAlarmsData build() => _build();

  _$GStreamAlarmsData _build() {
    _$GStreamAlarmsData _$result;
    try {
      _$result =
          _$v ??
          _$GStreamAlarmsData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
              G__typename,
              r'GStreamAlarmsData',
              'G__typename',
            ),
            alarms: alarms.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'alarms';
        alarms.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
          r'GStreamAlarmsData',
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

class _$GStreamAlarmsData_alarms extends GStreamAlarmsData_alarms {
  @override
  final String G__typename;
  @override
  final String? key;
  @override
  final String value;

  factory _$GStreamAlarmsData_alarms([
    void Function(GStreamAlarmsData_alarmsBuilder)? updates,
  ]) => (GStreamAlarmsData_alarmsBuilder()..update(updates))._build();

  _$GStreamAlarmsData_alarms._({
    required this.G__typename,
    this.key,
    required this.value,
  }) : super._();
  @override
  GStreamAlarmsData_alarms rebuild(
    void Function(GStreamAlarmsData_alarmsBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  GStreamAlarmsData_alarmsBuilder toBuilder() =>
      GStreamAlarmsData_alarmsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GStreamAlarmsData_alarms &&
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
    return (newBuiltValueToStringHelper(r'GStreamAlarmsData_alarms')
          ..add('G__typename', G__typename)
          ..add('key', key)
          ..add('value', value))
        .toString();
  }
}

class GStreamAlarmsData_alarmsBuilder
    implements
        Builder<GStreamAlarmsData_alarms, GStreamAlarmsData_alarmsBuilder> {
  _$GStreamAlarmsData_alarms? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _key;
  String? get key => _$this._key;
  set key(String? key) => _$this._key = key;

  String? _value;
  String? get value => _$this._value;
  set value(String? value) => _$this._value = value;

  GStreamAlarmsData_alarmsBuilder() {
    GStreamAlarmsData_alarms._initializeBuilder(this);
  }

  GStreamAlarmsData_alarmsBuilder get _$this {
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
  void replace(GStreamAlarmsData_alarms other) {
    _$v = other as _$GStreamAlarmsData_alarms;
  }

  @override
  void update(void Function(GStreamAlarmsData_alarmsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GStreamAlarmsData_alarms build() => _build();

  _$GStreamAlarmsData_alarms _build() {
    final _$result =
        _$v ??
        _$GStreamAlarmsData_alarms._(
          G__typename: BuiltValueNullFieldError.checkNotNull(
            G__typename,
            r'GStreamAlarmsData_alarms',
            'G__typename',
          ),
          key: key,
          value: BuiltValueNullFieldError.checkNotNull(
            value,
            r'GStreamAlarmsData_alarms',
            'value',
          ),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
