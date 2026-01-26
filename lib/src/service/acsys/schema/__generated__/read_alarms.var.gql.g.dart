// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'read_alarms.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GAlarmsSnapshotVars> _$gAlarmsSnapshotVarsSerializer =
    new _$GAlarmsSnapshotVarsSerializer();

class _$GAlarmsSnapshotVarsSerializer
    implements StructuredSerializer<GAlarmsSnapshotVars> {
  @override
  final Iterable<Type> types = const [
    GAlarmsSnapshotVars,
    _$GAlarmsSnapshotVars,
  ];
  @override
  final String wireName = 'GAlarmsSnapshotVars';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    GAlarmsSnapshotVars object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return <Object?>[];
  }

  @override
  GAlarmsSnapshotVars deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return new GAlarmsSnapshotVarsBuilder().build();
  }
}

class _$GAlarmsSnapshotVars extends GAlarmsSnapshotVars {
  factory _$GAlarmsSnapshotVars([
    void Function(GAlarmsSnapshotVarsBuilder)? updates,
  ]) => (new GAlarmsSnapshotVarsBuilder()..update(updates))._build();

  _$GAlarmsSnapshotVars._() : super._();

  @override
  GAlarmsSnapshotVars rebuild(
    void Function(GAlarmsSnapshotVarsBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  GAlarmsSnapshotVarsBuilder toBuilder() =>
      new GAlarmsSnapshotVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GAlarmsSnapshotVars;
  }

  @override
  int get hashCode {
    return 948072800;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GAlarmsSnapshotVars').toString();
  }
}

class GAlarmsSnapshotVarsBuilder
    implements Builder<GAlarmsSnapshotVars, GAlarmsSnapshotVarsBuilder> {
  _$GAlarmsSnapshotVars? _$v;

  GAlarmsSnapshotVarsBuilder();

  @override
  void replace(GAlarmsSnapshotVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GAlarmsSnapshotVars;
  }

  @override
  void update(void Function(GAlarmsSnapshotVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GAlarmsSnapshotVars build() => _build();

  _$GAlarmsSnapshotVars _build() {
    final _$result = _$v ?? new _$GAlarmsSnapshotVars._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
