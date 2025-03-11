// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'read_devices.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GStreamDataVars> _$gStreamDataVarsSerializer =
    new _$GStreamDataVarsSerializer();

class _$GStreamDataVarsSerializer
    implements StructuredSerializer<GStreamDataVars> {
  @override
  final Iterable<Type> types = const [GStreamDataVars, _$GStreamDataVars];
  @override
  final String wireName = 'GStreamDataVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GStreamDataVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'devList',
      serializers.serialize(object.devList,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
    ];
    Object? value;
    value = object.when;
    if (value != null) {
      result
        ..add('when')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    return result;
  }

  @override
  GStreamDataVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GStreamDataVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'devList':
          result.devList.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'when':
          result.when = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
      }
    }

    return result.build();
  }
}

class _$GStreamDataVars extends GStreamDataVars {
  @override
  final BuiltList<String> devList;
  @override
  final DateTime? when;

  factory _$GStreamDataVars([void Function(GStreamDataVarsBuilder)? updates]) =>
      (new GStreamDataVarsBuilder()..update(updates))._build();

  _$GStreamDataVars._({required this.devList, this.when}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        devList, r'GStreamDataVars', 'devList');
  }

  @override
  GStreamDataVars rebuild(void Function(GStreamDataVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GStreamDataVarsBuilder toBuilder() =>
      new GStreamDataVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GStreamDataVars &&
        devList == other.devList &&
        when == other.when;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, devList.hashCode);
    _$hash = $jc(_$hash, when.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GStreamDataVars')
          ..add('devList', devList)
          ..add('when', when))
        .toString();
  }
}

class GStreamDataVarsBuilder
    implements Builder<GStreamDataVars, GStreamDataVarsBuilder> {
  _$GStreamDataVars? _$v;

  ListBuilder<String>? _devList;
  ListBuilder<String> get devList =>
      _$this._devList ??= new ListBuilder<String>();
  set devList(ListBuilder<String>? devList) => _$this._devList = devList;

  DateTime? _when;
  DateTime? get when => _$this._when;
  set when(DateTime? when) => _$this._when = when;

  GStreamDataVarsBuilder();

  GStreamDataVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _devList = $v.devList.toBuilder();
      _when = $v.when;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GStreamDataVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GStreamDataVars;
  }

  @override
  void update(void Function(GStreamDataVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GStreamDataVars build() => _build();

  _$GStreamDataVars _build() {
    _$GStreamDataVars _$result;
    try {
      _$result = _$v ??
          new _$GStreamDataVars._(
            devList: devList.build(),
            when: when,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'devList';
        devList.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GStreamDataVars', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
