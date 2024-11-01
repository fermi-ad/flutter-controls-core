// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DPM.schema.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GDevValue> _$gDevValueSerializer = new _$GDevValueSerializer();
Serializer<GXformAvgExpr> _$gXformAvgExprSerializer =
    new _$GXformAvgExprSerializer();
Serializer<GXformDeviceExpr> _$gXformDeviceExprSerializer =
    new _$GXformDeviceExprSerializer();
Serializer<GXformExpr> _$gXformExprSerializer = new _$GXformExprSerializer();
Serializer<GXformRequest> _$gXformRequestSerializer =
    new _$GXformRequestSerializer();

class _$GDevValueSerializer implements StructuredSerializer<GDevValue> {
  @override
  final Iterable<Type> types = const [GDevValue, _$GDevValue];
  @override
  final String wireName = 'GDevValue';

  @override
  Iterable<Object?> serialize(Serializers serializers, GDevValue object,
      {FullType specifiedType = FullType.unspecified}) {
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
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.scalarArrayVal;
    if (value != null) {
      result
        ..add('scalarArrayVal')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(double)])));
    }
    value = object.rawVal;
    if (value != null) {
      result
        ..add('rawVal')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
    }
    value = object.textVal;
    if (value != null) {
      result
        ..add('textVal')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.textArrayVal;
    if (value != null) {
      result
        ..add('textArrayVal')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    return result;
  }

  @override
  GDevValue deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GDevValueBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'intVal':
          result.intVal = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'scalarVal':
          result.scalarVal = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'scalarArrayVal':
          result.scalarArrayVal.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(double)]))!
              as BuiltList<Object?>);
          break;
        case 'rawVal':
          result.rawVal.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))!
              as BuiltList<Object?>);
          break;
        case 'textVal':
          result.textVal = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'textArrayVal':
          result.textArrayVal.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GXformAvgExprSerializer implements StructuredSerializer<GXformAvgExpr> {
  @override
  final Iterable<Type> types = const [GXformAvgExpr, _$GXformAvgExpr];
  @override
  final String wireName = 'GXformAvgExpr';

  @override
  Iterable<Object?> serialize(Serializers serializers, GXformAvgExpr object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'expr',
      serializers.serialize(object.expr,
          specifiedType: const FullType(GXformExpr)),
      'n',
      serializers.serialize(object.n, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  GXformAvgExpr deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GXformAvgExprBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'expr':
          result.expr.replace(serializers.deserialize(value,
              specifiedType: const FullType(GXformExpr))! as GXformExpr);
          break;
        case 'n':
          result.n = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
      }
    }

    return result.build();
  }
}

class _$GXformDeviceExprSerializer
    implements StructuredSerializer<GXformDeviceExpr> {
  @override
  final Iterable<Type> types = const [GXformDeviceExpr, _$GXformDeviceExpr];
  @override
  final String wireName = 'GXformDeviceExpr';

  @override
  Iterable<Object?> serialize(Serializers serializers, GXformDeviceExpr object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'device',
      serializers.serialize(object.device,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GXformDeviceExpr deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GXformDeviceExprBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'device':
          result.device = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GXformExprSerializer implements StructuredSerializer<GXformExpr> {
  @override
  final Iterable<Type> types = const [GXformExpr, _$GXformExpr];
  @override
  final String wireName = 'GXformExpr';

  @override
  Iterable<Object?> serialize(Serializers serializers, GXformExpr object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.devEx;
    if (value != null) {
      result
        ..add('devEx')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GXformDeviceExpr)));
    }
    value = object.avgEx;
    if (value != null) {
      result
        ..add('avgEx')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GXformAvgExpr)));
    }
    return result;
  }

  @override
  GXformExpr deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GXformExprBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'devEx':
          result.devEx.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GXformDeviceExpr))!
              as GXformDeviceExpr);
          break;
        case 'avgEx':
          result.avgEx.replace(serializers.deserialize(value,
              specifiedType: const FullType(GXformAvgExpr))! as GXformAvgExpr);
          break;
      }
    }

    return result.build();
  }
}

class _$GXformRequestSerializer implements StructuredSerializer<GXformRequest> {
  @override
  final Iterable<Type> types = const [GXformRequest, _$GXformRequest];
  @override
  final String wireName = 'GXformRequest';

  @override
  Iterable<Object?> serialize(Serializers serializers, GXformRequest object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'event',
      serializers.serialize(object.event,
          specifiedType: const FullType(String)),
      'expr',
      serializers.serialize(object.expr,
          specifiedType: const FullType(GXformExpr)),
    ];

    return result;
  }

  @override
  GXformRequest deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GXformRequestBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'event':
          result.event = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'expr':
          result.expr.replace(serializers.deserialize(value,
              specifiedType: const FullType(GXformExpr))! as GXformExpr);
          break;
      }
    }

    return result.build();
  }
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

  factory _$GDevValue([void Function(GDevValueBuilder)? updates]) =>
      (new GDevValueBuilder()..update(updates))._build();

  _$GDevValue._(
      {this.intVal,
      this.scalarVal,
      this.scalarArrayVal,
      this.rawVal,
      this.textVal,
      this.textArrayVal})
      : super._();

  @override
  GDevValue rebuild(void Function(GDevValueBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GDevValueBuilder toBuilder() => new GDevValueBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GDevValue &&
        intVal == other.intVal &&
        scalarVal == other.scalarVal &&
        scalarArrayVal == other.scalarArrayVal &&
        rawVal == other.rawVal &&
        textVal == other.textVal &&
        textArrayVal == other.textArrayVal;
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
          ..add('textArrayVal', textArrayVal))
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
      _$this._scalarArrayVal ??= new ListBuilder<double>();
  set scalarArrayVal(ListBuilder<double>? scalarArrayVal) =>
      _$this._scalarArrayVal = scalarArrayVal;

  ListBuilder<int>? _rawVal;
  ListBuilder<int> get rawVal => _$this._rawVal ??= new ListBuilder<int>();
  set rawVal(ListBuilder<int>? rawVal) => _$this._rawVal = rawVal;

  String? _textVal;
  String? get textVal => _$this._textVal;
  set textVal(String? textVal) => _$this._textVal = textVal;

  ListBuilder<String>? _textArrayVal;
  ListBuilder<String> get textArrayVal =>
      _$this._textArrayVal ??= new ListBuilder<String>();
  set textArrayVal(ListBuilder<String>? textArrayVal) =>
      _$this._textArrayVal = textArrayVal;

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
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GDevValue other) {
    ArgumentError.checkNotNull(other, 'other');
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
      _$result = _$v ??
          new _$GDevValue._(
              intVal: intVal,
              scalarVal: scalarVal,
              scalarArrayVal: _scalarArrayVal?.build(),
              rawVal: _rawVal?.build(),
              textVal: textVal,
              textArrayVal: _textArrayVal?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'scalarArrayVal';
        _scalarArrayVal?.build();
        _$failedField = 'rawVal';
        _rawVal?.build();

        _$failedField = 'textArrayVal';
        _textArrayVal?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GDevValue', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GXformAvgExpr extends GXformAvgExpr {
  @override
  final GXformExpr expr;
  @override
  final int n;

  factory _$GXformAvgExpr([void Function(GXformAvgExprBuilder)? updates]) =>
      (new GXformAvgExprBuilder()..update(updates))._build();

  _$GXformAvgExpr._({required this.expr, required this.n}) : super._() {
    BuiltValueNullFieldError.checkNotNull(expr, r'GXformAvgExpr', 'expr');
    BuiltValueNullFieldError.checkNotNull(n, r'GXformAvgExpr', 'n');
  }

  @override
  GXformAvgExpr rebuild(void Function(GXformAvgExprBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GXformAvgExprBuilder toBuilder() => new GXformAvgExprBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GXformAvgExpr && expr == other.expr && n == other.n;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, expr.hashCode);
    _$hash = $jc(_$hash, n.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GXformAvgExpr')
          ..add('expr', expr)
          ..add('n', n))
        .toString();
  }
}

class GXformAvgExprBuilder
    implements Builder<GXformAvgExpr, GXformAvgExprBuilder> {
  _$GXformAvgExpr? _$v;

  GXformExprBuilder? _expr;
  GXformExprBuilder get expr => _$this._expr ??= new GXformExprBuilder();
  set expr(GXformExprBuilder? expr) => _$this._expr = expr;

  int? _n;
  int? get n => _$this._n;
  set n(int? n) => _$this._n = n;

  GXformAvgExprBuilder();

  GXformAvgExprBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _expr = $v.expr.toBuilder();
      _n = $v.n;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GXformAvgExpr other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GXformAvgExpr;
  }

  @override
  void update(void Function(GXformAvgExprBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GXformAvgExpr build() => _build();

  _$GXformAvgExpr _build() {
    _$GXformAvgExpr _$result;
    try {
      _$result = _$v ??
          new _$GXformAvgExpr._(
              expr: expr.build(),
              n: BuiltValueNullFieldError.checkNotNull(
                  n, r'GXformAvgExpr', 'n'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'expr';
        expr.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GXformAvgExpr', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GXformDeviceExpr extends GXformDeviceExpr {
  @override
  final String device;

  factory _$GXformDeviceExpr(
          [void Function(GXformDeviceExprBuilder)? updates]) =>
      (new GXformDeviceExprBuilder()..update(updates))._build();

  _$GXformDeviceExpr._({required this.device}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        device, r'GXformDeviceExpr', 'device');
  }

  @override
  GXformDeviceExpr rebuild(void Function(GXformDeviceExprBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GXformDeviceExprBuilder toBuilder() =>
      new GXformDeviceExprBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GXformDeviceExpr && device == other.device;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, device.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GXformDeviceExpr')
          ..add('device', device))
        .toString();
  }
}

class GXformDeviceExprBuilder
    implements Builder<GXformDeviceExpr, GXformDeviceExprBuilder> {
  _$GXformDeviceExpr? _$v;

  String? _device;
  String? get device => _$this._device;
  set device(String? device) => _$this._device = device;

  GXformDeviceExprBuilder();

  GXformDeviceExprBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _device = $v.device;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GXformDeviceExpr other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GXformDeviceExpr;
  }

  @override
  void update(void Function(GXformDeviceExprBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GXformDeviceExpr build() => _build();

  _$GXformDeviceExpr _build() {
    final _$result = _$v ??
        new _$GXformDeviceExpr._(
            device: BuiltValueNullFieldError.checkNotNull(
                device, r'GXformDeviceExpr', 'device'));
    replace(_$result);
    return _$result;
  }
}

class _$GXformExpr extends GXformExpr {
  @override
  final GXformDeviceExpr? devEx;
  @override
  final GXformAvgExpr? avgEx;

  factory _$GXformExpr([void Function(GXformExprBuilder)? updates]) =>
      (new GXformExprBuilder()..update(updates))._build();

  _$GXformExpr._({this.devEx, this.avgEx}) : super._();

  @override
  GXformExpr rebuild(void Function(GXformExprBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GXformExprBuilder toBuilder() => new GXformExprBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GXformExpr && devEx == other.devEx && avgEx == other.avgEx;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, devEx.hashCode);
    _$hash = $jc(_$hash, avgEx.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GXformExpr')
          ..add('devEx', devEx)
          ..add('avgEx', avgEx))
        .toString();
  }
}

class GXformExprBuilder implements Builder<GXformExpr, GXformExprBuilder> {
  _$GXformExpr? _$v;

  GXformDeviceExprBuilder? _devEx;
  GXformDeviceExprBuilder get devEx =>
      _$this._devEx ??= new GXformDeviceExprBuilder();
  set devEx(GXformDeviceExprBuilder? devEx) => _$this._devEx = devEx;

  GXformAvgExprBuilder? _avgEx;
  GXformAvgExprBuilder get avgEx =>
      _$this._avgEx ??= new GXformAvgExprBuilder();
  set avgEx(GXformAvgExprBuilder? avgEx) => _$this._avgEx = avgEx;

  GXformExprBuilder();

  GXformExprBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _devEx = $v.devEx?.toBuilder();
      _avgEx = $v.avgEx?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GXformExpr other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GXformExpr;
  }

  @override
  void update(void Function(GXformExprBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GXformExpr build() => _build();

  _$GXformExpr _build() {
    _$GXformExpr _$result;
    try {
      _$result = _$v ??
          new _$GXformExpr._(devEx: _devEx?.build(), avgEx: _avgEx?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'devEx';
        _devEx?.build();
        _$failedField = 'avgEx';
        _avgEx?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GXformExpr', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GXformRequest extends GXformRequest {
  @override
  final String event;
  @override
  final GXformExpr expr;

  factory _$GXformRequest([void Function(GXformRequestBuilder)? updates]) =>
      (new GXformRequestBuilder()..update(updates))._build();

  _$GXformRequest._({required this.event, required this.expr}) : super._() {
    BuiltValueNullFieldError.checkNotNull(event, r'GXformRequest', 'event');
    BuiltValueNullFieldError.checkNotNull(expr, r'GXformRequest', 'expr');
  }

  @override
  GXformRequest rebuild(void Function(GXformRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GXformRequestBuilder toBuilder() => new GXformRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GXformRequest && event == other.event && expr == other.expr;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, event.hashCode);
    _$hash = $jc(_$hash, expr.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GXformRequest')
          ..add('event', event)
          ..add('expr', expr))
        .toString();
  }
}

class GXformRequestBuilder
    implements Builder<GXformRequest, GXformRequestBuilder> {
  _$GXformRequest? _$v;

  String? _event;
  String? get event => _$this._event;
  set event(String? event) => _$this._event = event;

  GXformExprBuilder? _expr;
  GXformExprBuilder get expr => _$this._expr ??= new GXformExprBuilder();
  set expr(GXformExprBuilder? expr) => _$this._expr = expr;

  GXformRequestBuilder();

  GXformRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _event = $v.event;
      _expr = $v.expr.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GXformRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GXformRequest;
  }

  @override
  void update(void Function(GXformRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GXformRequest build() => _build();

  _$GXformRequest _build() {
    _$GXformRequest _$result;
    try {
      _$result = _$v ??
          new _$GXformRequest._(
              event: BuiltValueNullFieldError.checkNotNull(
                  event, r'GXformRequest', 'event'),
              expr: expr.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'expr';
        expr.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GXformRequest', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
