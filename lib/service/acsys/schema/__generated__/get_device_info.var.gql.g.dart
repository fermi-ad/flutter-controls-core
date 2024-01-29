// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_device_info.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GgetDeviceInfoVars> _$ggetDeviceInfoVarsSerializer =
    new _$GgetDeviceInfoVarsSerializer();
Serializer<GDevicePropertyFieldsVars> _$gDevicePropertyFieldsVarsSerializer =
    new _$GDevicePropertyFieldsVarsSerializer();

class _$GgetDeviceInfoVarsSerializer
    implements StructuredSerializer<GgetDeviceInfoVars> {
  @override
  final Iterable<Type> types = const [GgetDeviceInfoVars, _$GgetDeviceInfoVars];
  @override
  final String wireName = 'GgetDeviceInfoVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GgetDeviceInfoVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'devices',
      serializers.serialize(object.devices,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
    ];

    return result;
  }

  @override
  GgetDeviceInfoVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GgetDeviceInfoVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'devices':
          result.devices.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GDevicePropertyFieldsVarsSerializer
    implements StructuredSerializer<GDevicePropertyFieldsVars> {
  @override
  final Iterable<Type> types = const [
    GDevicePropertyFieldsVars,
    _$GDevicePropertyFieldsVars
  ];
  @override
  final String wireName = 'GDevicePropertyFieldsVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GDevicePropertyFieldsVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GDevicePropertyFieldsVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GDevicePropertyFieldsVarsBuilder().build();
  }
}

class _$GgetDeviceInfoVars extends GgetDeviceInfoVars {
  @override
  final BuiltList<String> devices;

  factory _$GgetDeviceInfoVars(
          [void Function(GgetDeviceInfoVarsBuilder)? updates]) =>
      (new GgetDeviceInfoVarsBuilder()..update(updates))._build();

  _$GgetDeviceInfoVars._({required this.devices}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        devices, r'GgetDeviceInfoVars', 'devices');
  }

  @override
  GgetDeviceInfoVars rebuild(
          void Function(GgetDeviceInfoVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GgetDeviceInfoVarsBuilder toBuilder() =>
      new GgetDeviceInfoVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GgetDeviceInfoVars && devices == other.devices;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, devices.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GgetDeviceInfoVars')
          ..add('devices', devices))
        .toString();
  }
}

class GgetDeviceInfoVarsBuilder
    implements Builder<GgetDeviceInfoVars, GgetDeviceInfoVarsBuilder> {
  _$GgetDeviceInfoVars? _$v;

  ListBuilder<String>? _devices;
  ListBuilder<String> get devices =>
      _$this._devices ??= new ListBuilder<String>();
  set devices(ListBuilder<String>? devices) => _$this._devices = devices;

  GgetDeviceInfoVarsBuilder();

  GgetDeviceInfoVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _devices = $v.devices.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GgetDeviceInfoVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GgetDeviceInfoVars;
  }

  @override
  void update(void Function(GgetDeviceInfoVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GgetDeviceInfoVars build() => _build();

  _$GgetDeviceInfoVars _build() {
    _$GgetDeviceInfoVars _$result;
    try {
      _$result = _$v ?? new _$GgetDeviceInfoVars._(devices: devices.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'devices';
        devices.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GgetDeviceInfoVars', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GDevicePropertyFieldsVars extends GDevicePropertyFieldsVars {
  factory _$GDevicePropertyFieldsVars(
          [void Function(GDevicePropertyFieldsVarsBuilder)? updates]) =>
      (new GDevicePropertyFieldsVarsBuilder()..update(updates))._build();

  _$GDevicePropertyFieldsVars._() : super._();

  @override
  GDevicePropertyFieldsVars rebuild(
          void Function(GDevicePropertyFieldsVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GDevicePropertyFieldsVarsBuilder toBuilder() =>
      new GDevicePropertyFieldsVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GDevicePropertyFieldsVars;
  }

  @override
  int get hashCode {
    return 811644969;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GDevicePropertyFieldsVars').toString();
  }
}

class GDevicePropertyFieldsVarsBuilder
    implements
        Builder<GDevicePropertyFieldsVars, GDevicePropertyFieldsVarsBuilder> {
  _$GDevicePropertyFieldsVars? _$v;

  GDevicePropertyFieldsVarsBuilder();

  @override
  void replace(GDevicePropertyFieldsVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GDevicePropertyFieldsVars;
  }

  @override
  void update(void Function(GDevicePropertyFieldsVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GDevicePropertyFieldsVars build() => _build();

  _$GDevicePropertyFieldsVars _build() {
    final _$result = _$v ?? new _$GDevicePropertyFieldsVars._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
