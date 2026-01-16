// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stream_alarms.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GStreamAlarmsData> _$gStreamAlarmsDataSerializer =
    new _$GStreamAlarmsDataSerializer();

class _$GStreamAlarmsDataSerializer
    implements StructuredSerializer<GStreamAlarmsData> {
  @override
  final Iterable<Type> types = const [GStreamAlarmsData, _$GStreamAlarmsData];
  @override
  final String wireName = 'GStreamAlarmsData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GStreamAlarmsData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'alarms',
      serializers.serialize(object.alarms,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GStreamAlarmsData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GStreamAlarmsDataBuilder();

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
        case 'alarms':
          result.alarms = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
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
  final String alarms;

  factory _$GStreamAlarmsData(
          [void Function(GStreamAlarmsDataBuilder)? updates]) =>
      (new GStreamAlarmsDataBuilder()..update(updates))._build();

  _$GStreamAlarmsData._({required this.G__typename, required this.alarms})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GStreamAlarmsData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        alarms, r'GStreamAlarmsData', 'alarms');
  }

  @override
  GStreamAlarmsData rebuild(void Function(GStreamAlarmsDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GStreamAlarmsDataBuilder toBuilder() =>
      new GStreamAlarmsDataBuilder()..replace(this);

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

  String? _alarms;
  String? get alarms => _$this._alarms;
  set alarms(String? alarms) => _$this._alarms = alarms;

  GStreamAlarmsDataBuilder() {
    GStreamAlarmsData._initializeBuilder(this);
  }

  GStreamAlarmsDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _alarms = $v.alarms;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GStreamAlarmsData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GStreamAlarmsData;
  }

  @override
  void update(void Function(GStreamAlarmsDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GStreamAlarmsData build() => _build();

  _$GStreamAlarmsData _build() {
    final _$result = _$v ??
        new _$GStreamAlarmsData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GStreamAlarmsData', 'G__typename'),
            alarms: BuiltValueNullFieldError.checkNotNull(
                alarms, r'GStreamAlarmsData', 'alarms'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
