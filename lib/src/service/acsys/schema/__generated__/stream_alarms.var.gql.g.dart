// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stream_alarms.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GStreamAlarmsVars> _$gStreamAlarmsVarsSerializer =
    new _$GStreamAlarmsVarsSerializer();

class _$GStreamAlarmsVarsSerializer
    implements StructuredSerializer<GStreamAlarmsVars> {
  @override
  final Iterable<Type> types = const [GStreamAlarmsVars, _$GStreamAlarmsVars];
  @override
  final String wireName = 'GStreamAlarmsVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GStreamAlarmsVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GStreamAlarmsVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GStreamAlarmsVarsBuilder().build();
  }
}

class _$GStreamAlarmsVars extends GStreamAlarmsVars {
  factory _$GStreamAlarmsVars(
          [void Function(GStreamAlarmsVarsBuilder)? updates]) =>
      (new GStreamAlarmsVarsBuilder()..update(updates))._build();

  _$GStreamAlarmsVars._() : super._();

  @override
  GStreamAlarmsVars rebuild(void Function(GStreamAlarmsVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GStreamAlarmsVarsBuilder toBuilder() =>
      new GStreamAlarmsVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GStreamAlarmsVars;
  }

  @override
  int get hashCode {
    return 273419522;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GStreamAlarmsVars').toString();
  }
}

class GStreamAlarmsVarsBuilder
    implements Builder<GStreamAlarmsVars, GStreamAlarmsVarsBuilder> {
  _$GStreamAlarmsVars? _$v;

  GStreamAlarmsVarsBuilder();

  @override
  void replace(GStreamAlarmsVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GStreamAlarmsVars;
  }

  @override
  void update(void Function(GStreamAlarmsVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GStreamAlarmsVars build() => _build();

  _$GStreamAlarmsVars _build() {
    final _$result = _$v ?? new _$GStreamAlarmsVars._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
