// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DPM.schema.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const GSeverity _$gSeverityUNKNOWN = const GSeverity._('UNKNOWN');
const GSeverity _$gSeverityLOW = const GSeverity._('LOW');
const GSeverity _$gSeverityHIGH = const GSeverity._('HIGH');

GSeverity _$gSeverityValueOf(String name) {
  switch (name) {
    case 'UNKNOWN':
      return _$gSeverityUNKNOWN;
    case 'LOW':
      return _$gSeverityLOW;
    case 'HIGH':
      return _$gSeverityHIGH;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<GSeverity> _$gSeverityValues = BuiltSet<GSeverity>(
  const <GSeverity>[_$gSeverityUNKNOWN, _$gSeverityLOW, _$gSeverityHIGH],
);

const GSource _$gSourceUNKNOWN = const GSource._('UNKNOWN');
const GSource _$gSourceANALOG = const GSource._('ANALOG');
const GSource _$gSourceDIGITAL = const GSource._('DIGITAL');
const GSource _$gSourceEPICS = const GSource._('EPICS');

GSource _$gSourceValueOf(String name) {
  switch (name) {
    case 'UNKNOWN':
      return _$gSourceUNKNOWN;
    case 'ANALOG':
      return _$gSourceANALOG;
    case 'DIGITAL':
      return _$gSourceDIGITAL;
    case 'EPICS':
      return _$gSourceEPICS;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<GSource> _$gSourceValues = BuiltSet<GSource>(const <GSource>[
  _$gSourceUNKNOWN,
  _$gSourceANALOG,
  _$gSourceDIGITAL,
  _$gSourceEPICS,
]);

const GState _$gStateUNKNOWN = const GState._('UNKNOWN');
const GState _$gStateOK = const GState._('OK');
const GState _$gStateBYPASSED = const GState._('BYPASSED');
const GState _$gStateLATCHED = const GState._('LATCHED');
const GState _$gStateACKNOWLEDGED = const GState._('ACKNOWLEDGED');
const GState _$gStateUNBYPASSED = const GState._('UNBYPASSED');

GState _$gStateValueOf(String name) {
  switch (name) {
    case 'UNKNOWN':
      return _$gStateUNKNOWN;
    case 'OK':
      return _$gStateOK;
    case 'BYPASSED':
      return _$gStateBYPASSED;
    case 'LATCHED':
      return _$gStateLATCHED;
    case 'ACKNOWLEDGED':
      return _$gStateACKNOWLEDGED;
    case 'UNBYPASSED':
      return _$gStateUNBYPASSED;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<GState> _$gStateValues = BuiltSet<GState>(const <GState>[
  _$gStateUNKNOWN,
  _$gStateOK,
  _$gStateBYPASSED,
  _$gStateLATCHED,
  _$gStateACKNOWLEDGED,
  _$gStateUNBYPASSED,
]);

Serializer<GDevValue> _$gDevValueSerializer = _$GDevValueSerializer();
Serializer<GTimeSeriesEntryIn> _$gTimeSeriesEntryInSerializer =
    _$GTimeSeriesEntryInSerializer();
Serializer<GSeverity> _$gSeveritySerializer = _$GSeveritySerializer();
Serializer<GSource> _$gSourceSerializer = _$GSourceSerializer();
Serializer<GState> _$gStateSerializer = _$GStateSerializer();

class _$GDevValueSerializer implements StructuredSerializer<GDevValue> {
  @override
  final Iterable<Type> types = const [GDevValue, _$GDevValue];
  @override
  final String wireName = 'GDevValue';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    GDevValue object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[];
    Object? value;
    value = object.intVal;
    if (value != null) {
      result
        ..add('intVal')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.scalarVal;
    if (value != null) {
      result
        ..add('scalarVal')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(double)),
        );
    }
    value = object.scalarArrayVal;
    if (value != null) {
      result
        ..add('scalarArrayVal')
        ..add(
          serializers.serialize(
            value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(double),
            ]),
          ),
        );
    }
    value = object.rawVal;
    if (value != null) {
      result
        ..add('rawVal')
        ..add(
          serializers.serialize(
            value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(int),
            ]),
          ),
        );
    }
    value = object.textVal;
    if (value != null) {
      result
        ..add('textVal')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }
    value = object.textArrayVal;
    if (value != null) {
      result
        ..add('textArrayVal')
        ..add(
          serializers.serialize(
            value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(String),
            ]),
          ),
        );
    }
    value = object.timeSeriesVal;
    if (value != null) {
      result
        ..add('timeSeriesVal')
        ..add(
          serializers.serialize(
            value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(GTimeSeriesEntryIn),
            ]),
          ),
        );
    }
    return result;
  }

  @override
  GDevValue deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GDevValueBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'intVal':
          result.intVal =
              serializers.deserialize(value, specifiedType: const FullType(int))
                  as int?;
          break;
        case 'scalarVal':
          result.scalarVal =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(double),
                  )
                  as double?;
          break;
        case 'scalarArrayVal':
          result.scalarArrayVal.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(BuiltList, const [
                    const FullType(double),
                  ]),
                )!
                as BuiltList<Object?>,
          );
          break;
        case 'rawVal':
          result.rawVal.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(BuiltList, const [
                    const FullType(int),
                  ]),
                )!
                as BuiltList<Object?>,
          );
          break;
        case 'textVal':
          result.textVal =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String?;
          break;
        case 'textArrayVal':
          result.textArrayVal.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(BuiltList, const [
                    const FullType(String),
                  ]),
                )!
                as BuiltList<Object?>,
          );
          break;
        case 'timeSeriesVal':
          result.timeSeriesVal.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(BuiltList, const [
                    const FullType(GTimeSeriesEntryIn),
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

class _$GTimeSeriesEntryInSerializer
    implements StructuredSerializer<GTimeSeriesEntryIn> {
  @override
  final Iterable<Type> types = const [GTimeSeriesEntryIn, _$GTimeSeriesEntryIn];
  @override
  final String wireName = 'GTimeSeriesEntryIn';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    GTimeSeriesEntryIn object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'stamp',
      serializers.serialize(
        object.stamp,
        specifiedType: const FullType(double),
      ),
      'value',
      serializers.serialize(
        object.value,
        specifiedType: const FullType(double),
      ),
    ];

    return result;
  }

  @override
  GTimeSeriesEntryIn deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GTimeSeriesEntryInBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'stamp':
          result.stamp =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(double),
                  )!
                  as double;
          break;
        case 'value':
          result.value =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(double),
                  )!
                  as double;
          break;
      }
    }

    return result.build();
  }
}

class _$GSeveritySerializer implements PrimitiveSerializer<GSeverity> {
  @override
  final Iterable<Type> types = const <Type>[GSeverity];
  @override
  final String wireName = 'GSeverity';

  @override
  Object serialize(
    Serializers serializers,
    GSeverity object, {
    FullType specifiedType = FullType.unspecified,
  }) => object.name;

  @override
  GSeverity deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => GSeverity.valueOf(serialized as String);
}

class _$GSourceSerializer implements PrimitiveSerializer<GSource> {
  @override
  final Iterable<Type> types = const <Type>[GSource];
  @override
  final String wireName = 'GSource';

  @override
  Object serialize(
    Serializers serializers,
    GSource object, {
    FullType specifiedType = FullType.unspecified,
  }) => object.name;

  @override
  GSource deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => GSource.valueOf(serialized as String);
}

class _$GStateSerializer implements PrimitiveSerializer<GState> {
  @override
  final Iterable<Type> types = const <Type>[GState];
  @override
  final String wireName = 'GState';

  @override
  Object serialize(
    Serializers serializers,
    GState object, {
    FullType specifiedType = FullType.unspecified,
  }) => object.name;

  @override
  GState deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => GState.valueOf(serialized as String);
}

class _$GDevValue extends GDevValue {
  @override
  final int? intVal;
  @override
  final double? scalarVal;
  @override
  final BuiltList<double>? scalarArrayVal;
  @override
  final BuiltList<int>? rawVal;
  @override
  final String? textVal;
  @override
  final BuiltList<String>? textArrayVal;
  @override
  final BuiltList<GTimeSeriesEntryIn>? timeSeriesVal;

  factory _$GDevValue([void Function(GDevValueBuilder)? updates]) =>
      (GDevValueBuilder()..update(updates))._build();

  _$GDevValue._({
    this.intVal,
    this.scalarVal,
    this.scalarArrayVal,
    this.rawVal,
    this.textVal,
    this.textArrayVal,
    this.timeSeriesVal,
  }) : super._();
  @override
  GDevValue rebuild(void Function(GDevValueBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GDevValueBuilder toBuilder() => GDevValueBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GDevValue &&
        intVal == other.intVal &&
        scalarVal == other.scalarVal &&
        scalarArrayVal == other.scalarArrayVal &&
        rawVal == other.rawVal &&
        textVal == other.textVal &&
        textArrayVal == other.textArrayVal &&
        timeSeriesVal == other.timeSeriesVal;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, intVal.hashCode);
    _$hash = $jc(_$hash, scalarVal.hashCode);
    _$hash = $jc(_$hash, scalarArrayVal.hashCode);
    _$hash = $jc(_$hash, rawVal.hashCode);
    _$hash = $jc(_$hash, textVal.hashCode);
    _$hash = $jc(_$hash, textArrayVal.hashCode);
    _$hash = $jc(_$hash, timeSeriesVal.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GDevValue')
          ..add('intVal', intVal)
          ..add('scalarVal', scalarVal)
          ..add('scalarArrayVal', scalarArrayVal)
          ..add('rawVal', rawVal)
          ..add('textVal', textVal)
          ..add('textArrayVal', textArrayVal)
          ..add('timeSeriesVal', timeSeriesVal))
        .toString();
  }
}

class GDevValueBuilder implements Builder<GDevValue, GDevValueBuilder> {
  _$GDevValue? _$v;

  int? _intVal;
  int? get intVal => _$this._intVal;
  set intVal(int? intVal) => _$this._intVal = intVal;

  double? _scalarVal;
  double? get scalarVal => _$this._scalarVal;
  set scalarVal(double? scalarVal) => _$this._scalarVal = scalarVal;

  ListBuilder<double>? _scalarArrayVal;
  ListBuilder<double> get scalarArrayVal =>
      _$this._scalarArrayVal ??= ListBuilder<double>();
  set scalarArrayVal(ListBuilder<double>? scalarArrayVal) =>
      _$this._scalarArrayVal = scalarArrayVal;

  ListBuilder<int>? _rawVal;
  ListBuilder<int> get rawVal => _$this._rawVal ??= ListBuilder<int>();
  set rawVal(ListBuilder<int>? rawVal) => _$this._rawVal = rawVal;

  String? _textVal;
  String? get textVal => _$this._textVal;
  set textVal(String? textVal) => _$this._textVal = textVal;

  ListBuilder<String>? _textArrayVal;
  ListBuilder<String> get textArrayVal =>
      _$this._textArrayVal ??= ListBuilder<String>();
  set textArrayVal(ListBuilder<String>? textArrayVal) =>
      _$this._textArrayVal = textArrayVal;

  ListBuilder<GTimeSeriesEntryIn>? _timeSeriesVal;
  ListBuilder<GTimeSeriesEntryIn> get timeSeriesVal =>
      _$this._timeSeriesVal ??= ListBuilder<GTimeSeriesEntryIn>();
  set timeSeriesVal(ListBuilder<GTimeSeriesEntryIn>? timeSeriesVal) =>
      _$this._timeSeriesVal = timeSeriesVal;

  GDevValueBuilder();

  GDevValueBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _intVal = $v.intVal;
      _scalarVal = $v.scalarVal;
      _scalarArrayVal = $v.scalarArrayVal?.toBuilder();
      _rawVal = $v.rawVal?.toBuilder();
      _textVal = $v.textVal;
      _textArrayVal = $v.textArrayVal?.toBuilder();
      _timeSeriesVal = $v.timeSeriesVal?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GDevValue other) {
    _$v = other as _$GDevValue;
  }

  @override
  void update(void Function(GDevValueBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GDevValue build() => _build();

  _$GDevValue _build() {
    _$GDevValue _$result;
    try {
      _$result =
          _$v ??
          _$GDevValue._(
            intVal: intVal,
            scalarVal: scalarVal,
            scalarArrayVal: _scalarArrayVal?.build(),
            rawVal: _rawVal?.build(),
            textVal: textVal,
            textArrayVal: _textArrayVal?.build(),
            timeSeriesVal: _timeSeriesVal?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'scalarArrayVal';
        _scalarArrayVal?.build();
        _$failedField = 'rawVal';
        _rawVal?.build();

        _$failedField = 'textArrayVal';
        _textArrayVal?.build();
        _$failedField = 'timeSeriesVal';
        _timeSeriesVal?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
          r'GDevValue',
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

class _$GTimeSeriesEntryIn extends GTimeSeriesEntryIn {
  @override
  final double stamp;
  @override
  final double value;

  factory _$GTimeSeriesEntryIn([
    void Function(GTimeSeriesEntryInBuilder)? updates,
  ]) => (GTimeSeriesEntryInBuilder()..update(updates))._build();

  _$GTimeSeriesEntryIn._({required this.stamp, required this.value})
    : super._();
  @override
  GTimeSeriesEntryIn rebuild(
    void Function(GTimeSeriesEntryInBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  GTimeSeriesEntryInBuilder toBuilder() =>
      GTimeSeriesEntryInBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GTimeSeriesEntryIn &&
        stamp == other.stamp &&
        value == other.value;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, stamp.hashCode);
    _$hash = $jc(_$hash, value.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GTimeSeriesEntryIn')
          ..add('stamp', stamp)
          ..add('value', value))
        .toString();
  }
}

class GTimeSeriesEntryInBuilder
    implements Builder<GTimeSeriesEntryIn, GTimeSeriesEntryInBuilder> {
  _$GTimeSeriesEntryIn? _$v;

  double? _stamp;
  double? get stamp => _$this._stamp;
  set stamp(double? stamp) => _$this._stamp = stamp;

  double? _value;
  double? get value => _$this._value;
  set value(double? value) => _$this._value = value;

  GTimeSeriesEntryInBuilder();

  GTimeSeriesEntryInBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _stamp = $v.stamp;
      _value = $v.value;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GTimeSeriesEntryIn other) {
    _$v = other as _$GTimeSeriesEntryIn;
  }

  @override
  void update(void Function(GTimeSeriesEntryInBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GTimeSeriesEntryIn build() => _build();

  _$GTimeSeriesEntryIn _build() {
    final _$result =
        _$v ??
        _$GTimeSeriesEntryIn._(
          stamp: BuiltValueNullFieldError.checkNotNull(
            stamp,
            r'GTimeSeriesEntryIn',
            'stamp',
          ),
          value: BuiltValueNullFieldError.checkNotNull(
            value,
            r'GTimeSeriesEntryIn',
            'value',
          ),
        );
    replace(_$result);
    return _$result;
  }
}

class _$GDateTime extends GDateTime {
  @override
  final String value;

  factory _$GDateTime([void Function(GDateTimeBuilder)? updates]) =>
      (GDateTimeBuilder()..update(updates))._build();

  _$GDateTime._({required this.value}) : super._();
  @override
  GDateTime rebuild(void Function(GDateTimeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GDateTimeBuilder toBuilder() => GDateTimeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GDateTime && value == other.value;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, value.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GDateTime')
      ..add('value', value)).toString();
  }
}

class GDateTimeBuilder implements Builder<GDateTime, GDateTimeBuilder> {
  _$GDateTime? _$v;

  String? _value;
  String? get value => _$this._value;
  set value(String? value) => _$this._value = value;

  GDateTimeBuilder();

  GDateTimeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _value = $v.value;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GDateTime other) {
    _$v = other as _$GDateTime;
  }

  @override
  void update(void Function(GDateTimeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GDateTime build() => _build();

  _$GDateTime _build() {
    final _$result =
        _$v ??
        _$GDateTime._(
          value: BuiltValueNullFieldError.checkNotNull(
            value,
            r'GDateTime',
            'value',
          ),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
