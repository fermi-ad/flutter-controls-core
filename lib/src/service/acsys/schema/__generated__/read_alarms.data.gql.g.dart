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
      'device',
      serializers.serialize(
        object.device,
        specifiedType: const FullType(String),
      ),
      'source',
      serializers.serialize(
        object.source,
        specifiedType: const FullType(_i2.GSource),
      ),
      'state',
      serializers.serialize(
        object.state,
        specifiedType: const FullType(_i2.GState),
      ),
      'severity',
      serializers.serialize(
        object.severity,
        specifiedType: const FullType(_i2.GSeverity),
      ),
      'acknowledgeable',
      serializers.serialize(
        object.acknowledgeable,
        specifiedType: const FullType(bool),
      ),
      'epicsType',
      serializers.serialize(
        object.epicsType,
        specifiedType: const FullType(String),
      ),
      'user',
      serializers.serialize(object.user, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.time;
    if (value != null) {
      result
        ..add('time')
        ..add(
          serializers.serialize(
            value,
            specifiedType: const FullType(_i2.GDateTime),
          ),
        );
    }
    value = object.wake;
    if (value != null) {
      result
        ..add('wake')
        ..add(
          serializers.serialize(
            value,
            specifiedType: const FullType(_i2.GDateTime),
          ),
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
        case 'device':
          result.device =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
        case 'source':
          result.source =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(_i2.GSource),
                  )!
                  as _i2.GSource;
          break;
        case 'state':
          result.state =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(_i2.GState),
                  )!
                  as _i2.GState;
          break;
        case 'severity':
          result.severity =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(_i2.GSeverity),
                  )!
                  as _i2.GSeverity;
          break;
        case 'acknowledgeable':
          result.acknowledgeable =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(bool),
                  )!
                  as bool;
          break;
        case 'time':
          result.time.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(_i2.GDateTime),
                )!
                as _i2.GDateTime,
          );
          break;
        case 'epicsType':
          result.epicsType =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
        case 'user':
          result.user =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
        case 'wake':
          result.wake.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(_i2.GDateTime),
                )!
                as _i2.GDateTime,
          );
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
  final String device;
  @override
  final _i2.GSource source;
  @override
  final _i2.GState state;
  @override
  final _i2.GSeverity severity;
  @override
  final bool acknowledgeable;
  @override
  final _i2.GDateTime? time;
  @override
  final String epicsType;
  @override
  final String user;
  @override
  final _i2.GDateTime? wake;

  factory _$GAlarmsSnapshotData_alarmsSnapshot([
    void Function(GAlarmsSnapshotData_alarmsSnapshotBuilder)? updates,
  ]) => (GAlarmsSnapshotData_alarmsSnapshotBuilder()..update(updates))._build();

  _$GAlarmsSnapshotData_alarmsSnapshot._({
    required this.G__typename,
    required this.device,
    required this.source,
    required this.state,
    required this.severity,
    required this.acknowledgeable,
    this.time,
    required this.epicsType,
    required this.user,
    this.wake,
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
        device == other.device &&
        source == other.source &&
        state == other.state &&
        severity == other.severity &&
        acknowledgeable == other.acknowledgeable &&
        time == other.time &&
        epicsType == other.epicsType &&
        user == other.user &&
        wake == other.wake;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, device.hashCode);
    _$hash = $jc(_$hash, source.hashCode);
    _$hash = $jc(_$hash, state.hashCode);
    _$hash = $jc(_$hash, severity.hashCode);
    _$hash = $jc(_$hash, acknowledgeable.hashCode);
    _$hash = $jc(_$hash, time.hashCode);
    _$hash = $jc(_$hash, epicsType.hashCode);
    _$hash = $jc(_$hash, user.hashCode);
    _$hash = $jc(_$hash, wake.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GAlarmsSnapshotData_alarmsSnapshot')
          ..add('G__typename', G__typename)
          ..add('device', device)
          ..add('source', source)
          ..add('state', state)
          ..add('severity', severity)
          ..add('acknowledgeable', acknowledgeable)
          ..add('time', time)
          ..add('epicsType', epicsType)
          ..add('user', user)
          ..add('wake', wake))
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

  String? _device;
  String? get device => _$this._device;
  set device(String? device) => _$this._device = device;

  _i2.GSource? _source;
  _i2.GSource? get source => _$this._source;
  set source(_i2.GSource? source) => _$this._source = source;

  _i2.GState? _state;
  _i2.GState? get state => _$this._state;
  set state(_i2.GState? state) => _$this._state = state;

  _i2.GSeverity? _severity;
  _i2.GSeverity? get severity => _$this._severity;
  set severity(_i2.GSeverity? severity) => _$this._severity = severity;

  bool? _acknowledgeable;
  bool? get acknowledgeable => _$this._acknowledgeable;
  set acknowledgeable(bool? acknowledgeable) =>
      _$this._acknowledgeable = acknowledgeable;

  _i2.GDateTimeBuilder? _time;
  _i2.GDateTimeBuilder get time => _$this._time ??= _i2.GDateTimeBuilder();
  set time(_i2.GDateTimeBuilder? time) => _$this._time = time;

  String? _epicsType;
  String? get epicsType => _$this._epicsType;
  set epicsType(String? epicsType) => _$this._epicsType = epicsType;

  String? _user;
  String? get user => _$this._user;
  set user(String? user) => _$this._user = user;

  _i2.GDateTimeBuilder? _wake;
  _i2.GDateTimeBuilder get wake => _$this._wake ??= _i2.GDateTimeBuilder();
  set wake(_i2.GDateTimeBuilder? wake) => _$this._wake = wake;

  GAlarmsSnapshotData_alarmsSnapshotBuilder() {
    GAlarmsSnapshotData_alarmsSnapshot._initializeBuilder(this);
  }

  GAlarmsSnapshotData_alarmsSnapshotBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _device = $v.device;
      _source = $v.source;
      _state = $v.state;
      _severity = $v.severity;
      _acknowledgeable = $v.acknowledgeable;
      _time = $v.time?.toBuilder();
      _epicsType = $v.epicsType;
      _user = $v.user;
      _wake = $v.wake?.toBuilder();
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
    _$GAlarmsSnapshotData_alarmsSnapshot _$result;
    try {
      _$result =
          _$v ??
          _$GAlarmsSnapshotData_alarmsSnapshot._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
              G__typename,
              r'GAlarmsSnapshotData_alarmsSnapshot',
              'G__typename',
            ),
            device: BuiltValueNullFieldError.checkNotNull(
              device,
              r'GAlarmsSnapshotData_alarmsSnapshot',
              'device',
            ),
            source: BuiltValueNullFieldError.checkNotNull(
              source,
              r'GAlarmsSnapshotData_alarmsSnapshot',
              'source',
            ),
            state: BuiltValueNullFieldError.checkNotNull(
              state,
              r'GAlarmsSnapshotData_alarmsSnapshot',
              'state',
            ),
            severity: BuiltValueNullFieldError.checkNotNull(
              severity,
              r'GAlarmsSnapshotData_alarmsSnapshot',
              'severity',
            ),
            acknowledgeable: BuiltValueNullFieldError.checkNotNull(
              acknowledgeable,
              r'GAlarmsSnapshotData_alarmsSnapshot',
              'acknowledgeable',
            ),
            time: _time?.build(),
            epicsType: BuiltValueNullFieldError.checkNotNull(
              epicsType,
              r'GAlarmsSnapshotData_alarmsSnapshot',
              'epicsType',
            ),
            user: BuiltValueNullFieldError.checkNotNull(
              user,
              r'GAlarmsSnapshotData_alarmsSnapshot',
              'user',
            ),
            wake: _wake?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'time';
        _time?.build();

        _$failedField = 'wake';
        _wake?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
          r'GAlarmsSnapshotData_alarmsSnapshot',
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

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
