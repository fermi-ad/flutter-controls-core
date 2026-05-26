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

  factory _$GStreamAlarmsData_alarms([
    void Function(GStreamAlarmsData_alarmsBuilder)? updates,
  ]) => (GStreamAlarmsData_alarmsBuilder()..update(updates))._build();

  _$GStreamAlarmsData_alarms._({
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
    return (newBuiltValueToStringHelper(r'GStreamAlarmsData_alarms')
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

class GStreamAlarmsData_alarmsBuilder
    implements
        Builder<GStreamAlarmsData_alarms, GStreamAlarmsData_alarmsBuilder> {
  _$GStreamAlarmsData_alarms? _$v;

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

  GStreamAlarmsData_alarmsBuilder() {
    GStreamAlarmsData_alarms._initializeBuilder(this);
  }

  GStreamAlarmsData_alarmsBuilder get _$this {
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
    _$GStreamAlarmsData_alarms _$result;
    try {
      _$result =
          _$v ??
          _$GStreamAlarmsData_alarms._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
              G__typename,
              r'GStreamAlarmsData_alarms',
              'G__typename',
            ),
            device: BuiltValueNullFieldError.checkNotNull(
              device,
              r'GStreamAlarmsData_alarms',
              'device',
            ),
            source: BuiltValueNullFieldError.checkNotNull(
              source,
              r'GStreamAlarmsData_alarms',
              'source',
            ),
            state: BuiltValueNullFieldError.checkNotNull(
              state,
              r'GStreamAlarmsData_alarms',
              'state',
            ),
            severity: BuiltValueNullFieldError.checkNotNull(
              severity,
              r'GStreamAlarmsData_alarms',
              'severity',
            ),
            acknowledgeable: BuiltValueNullFieldError.checkNotNull(
              acknowledgeable,
              r'GStreamAlarmsData_alarms',
              'acknowledgeable',
            ),
            time: _time?.build(),
            epicsType: BuiltValueNullFieldError.checkNotNull(
              epicsType,
              r'GStreamAlarmsData_alarms',
              'epicsType',
            ),
            user: BuiltValueNullFieldError.checkNotNull(
              user,
              r'GStreamAlarmsData_alarms',
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
          r'GStreamAlarmsData_alarms',
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
