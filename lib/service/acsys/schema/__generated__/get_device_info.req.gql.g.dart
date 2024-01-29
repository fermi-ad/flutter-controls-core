// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_device_info.req.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GgetDeviceInfoReq> _$ggetDeviceInfoReqSerializer =
    new _$GgetDeviceInfoReqSerializer();
Serializer<GDevicePropertyFieldsReq> _$gDevicePropertyFieldsReqSerializer =
    new _$GDevicePropertyFieldsReqSerializer();

class _$GgetDeviceInfoReqSerializer
    implements StructuredSerializer<GgetDeviceInfoReq> {
  @override
  final Iterable<Type> types = const [GgetDeviceInfoReq, _$GgetDeviceInfoReq];
  @override
  final String wireName = 'GgetDeviceInfoReq';

  @override
  Iterable<Object?> serialize(Serializers serializers, GgetDeviceInfoReq object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'vars',
      serializers.serialize(object.vars,
          specifiedType: const FullType(_i3.GgetDeviceInfoVars)),
      'operation',
      serializers.serialize(object.operation,
          specifiedType: const FullType(_i4.Operation)),
      'executeOnListen',
      serializers.serialize(object.executeOnListen,
          specifiedType: const FullType(bool)),
    ];
    Object? value;
    value = object.requestId;
    if (value != null) {
      result
        ..add('requestId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.optimisticResponse;
    if (value != null) {
      result
        ..add('optimisticResponse')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(_i2.GgetDeviceInfoData)));
    }
    value = object.updateCacheHandlerKey;
    if (value != null) {
      result
        ..add('updateCacheHandlerKey')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.updateCacheHandlerContext;
    if (value != null) {
      result
        ..add('updateCacheHandlerContext')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                Map, const [const FullType(String), const FullType(dynamic)])));
    }
    value = object.fetchPolicy;
    if (value != null) {
      result
        ..add('fetchPolicy')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(_i1.FetchPolicy)));
    }
    return result;
  }

  @override
  GgetDeviceInfoReq deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GgetDeviceInfoReqBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'vars':
          result.vars.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i3.GgetDeviceInfoVars))!
              as _i3.GgetDeviceInfoVars);
          break;
        case 'operation':
          result.operation = serializers.deserialize(value,
              specifiedType: const FullType(_i4.Operation))! as _i4.Operation;
          break;
        case 'requestId':
          result.requestId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'optimisticResponse':
          result.optimisticResponse.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i2.GgetDeviceInfoData))!
              as _i2.GgetDeviceInfoData);
          break;
        case 'updateCacheHandlerKey':
          result.updateCacheHandlerKey = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'updateCacheHandlerContext':
          result.updateCacheHandlerContext = serializers.deserialize(value,
              specifiedType: const FullType(Map, const [
                const FullType(String),
                const FullType(dynamic)
              ])) as Map<String, dynamic>?;
          break;
        case 'fetchPolicy':
          result.fetchPolicy = serializers.deserialize(value,
                  specifiedType: const FullType(_i1.FetchPolicy))
              as _i1.FetchPolicy?;
          break;
        case 'executeOnListen':
          result.executeOnListen = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$GDevicePropertyFieldsReqSerializer
    implements StructuredSerializer<GDevicePropertyFieldsReq> {
  @override
  final Iterable<Type> types = const [
    GDevicePropertyFieldsReq,
    _$GDevicePropertyFieldsReq
  ];
  @override
  final String wireName = 'GDevicePropertyFieldsReq';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GDevicePropertyFieldsReq object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'vars',
      serializers.serialize(object.vars,
          specifiedType: const FullType(_i3.GDevicePropertyFieldsVars)),
      'document',
      serializers.serialize(object.document,
          specifiedType: const FullType(_i7.DocumentNode)),
      'idFields',
      serializers.serialize(object.idFields,
          specifiedType: const FullType(
              Map, const [const FullType(String), const FullType(dynamic)])),
    ];
    Object? value;
    value = object.fragmentName;
    if (value != null) {
      result
        ..add('fragmentName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GDevicePropertyFieldsReq deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GDevicePropertyFieldsReqBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'vars':
          result.vars.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i3.GDevicePropertyFieldsVars))!
              as _i3.GDevicePropertyFieldsVars);
          break;
        case 'document':
          result.document = serializers.deserialize(value,
                  specifiedType: const FullType(_i7.DocumentNode))!
              as _i7.DocumentNode;
          break;
        case 'fragmentName':
          result.fragmentName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'idFields':
          result.idFields = serializers.deserialize(value,
              specifiedType: const FullType(Map, const [
                const FullType(String),
                const FullType(dynamic)
              ]))! as Map<String, dynamic>;
          break;
      }
    }

    return result.build();
  }
}

class _$GgetDeviceInfoReq extends GgetDeviceInfoReq {
  @override
  final _i3.GgetDeviceInfoVars vars;
  @override
  final _i4.Operation operation;
  @override
  final String? requestId;
  @override
  final _i2.GgetDeviceInfoData? Function(
      _i2.GgetDeviceInfoData?, _i2.GgetDeviceInfoData?)? updateResult;
  @override
  final _i2.GgetDeviceInfoData? optimisticResponse;
  @override
  final String? updateCacheHandlerKey;
  @override
  final Map<String, dynamic>? updateCacheHandlerContext;
  @override
  final _i1.FetchPolicy? fetchPolicy;
  @override
  final bool executeOnListen;

  factory _$GgetDeviceInfoReq(
          [void Function(GgetDeviceInfoReqBuilder)? updates]) =>
      (new GgetDeviceInfoReqBuilder()..update(updates))._build();

  _$GgetDeviceInfoReq._(
      {required this.vars,
      required this.operation,
      this.requestId,
      this.updateResult,
      this.optimisticResponse,
      this.updateCacheHandlerKey,
      this.updateCacheHandlerContext,
      this.fetchPolicy,
      required this.executeOnListen})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(vars, r'GgetDeviceInfoReq', 'vars');
    BuiltValueNullFieldError.checkNotNull(
        operation, r'GgetDeviceInfoReq', 'operation');
    BuiltValueNullFieldError.checkNotNull(
        executeOnListen, r'GgetDeviceInfoReq', 'executeOnListen');
  }

  @override
  GgetDeviceInfoReq rebuild(void Function(GgetDeviceInfoReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GgetDeviceInfoReqBuilder toBuilder() =>
      new GgetDeviceInfoReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    final dynamic _$dynamicOther = other;
    return other is GgetDeviceInfoReq &&
        vars == other.vars &&
        operation == other.operation &&
        requestId == other.requestId &&
        updateResult == _$dynamicOther.updateResult &&
        optimisticResponse == other.optimisticResponse &&
        updateCacheHandlerKey == other.updateCacheHandlerKey &&
        updateCacheHandlerContext == other.updateCacheHandlerContext &&
        fetchPolicy == other.fetchPolicy &&
        executeOnListen == other.executeOnListen;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, vars.hashCode);
    _$hash = $jc(_$hash, operation.hashCode);
    _$hash = $jc(_$hash, requestId.hashCode);
    _$hash = $jc(_$hash, updateResult.hashCode);
    _$hash = $jc(_$hash, optimisticResponse.hashCode);
    _$hash = $jc(_$hash, updateCacheHandlerKey.hashCode);
    _$hash = $jc(_$hash, updateCacheHandlerContext.hashCode);
    _$hash = $jc(_$hash, fetchPolicy.hashCode);
    _$hash = $jc(_$hash, executeOnListen.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GgetDeviceInfoReq')
          ..add('vars', vars)
          ..add('operation', operation)
          ..add('requestId', requestId)
          ..add('updateResult', updateResult)
          ..add('optimisticResponse', optimisticResponse)
          ..add('updateCacheHandlerKey', updateCacheHandlerKey)
          ..add('updateCacheHandlerContext', updateCacheHandlerContext)
          ..add('fetchPolicy', fetchPolicy)
          ..add('executeOnListen', executeOnListen))
        .toString();
  }
}

class GgetDeviceInfoReqBuilder
    implements Builder<GgetDeviceInfoReq, GgetDeviceInfoReqBuilder> {
  _$GgetDeviceInfoReq? _$v;

  _i3.GgetDeviceInfoVarsBuilder? _vars;
  _i3.GgetDeviceInfoVarsBuilder get vars =>
      _$this._vars ??= new _i3.GgetDeviceInfoVarsBuilder();
  set vars(_i3.GgetDeviceInfoVarsBuilder? vars) => _$this._vars = vars;

  _i4.Operation? _operation;
  _i4.Operation? get operation => _$this._operation;
  set operation(_i4.Operation? operation) => _$this._operation = operation;

  String? _requestId;
  String? get requestId => _$this._requestId;
  set requestId(String? requestId) => _$this._requestId = requestId;

  _i2.GgetDeviceInfoData? Function(
      _i2.GgetDeviceInfoData?, _i2.GgetDeviceInfoData?)? _updateResult;
  _i2.GgetDeviceInfoData? Function(
          _i2.GgetDeviceInfoData?, _i2.GgetDeviceInfoData?)?
      get updateResult => _$this._updateResult;
  set updateResult(
          _i2.GgetDeviceInfoData? Function(
                  _i2.GgetDeviceInfoData?, _i2.GgetDeviceInfoData?)?
              updateResult) =>
      _$this._updateResult = updateResult;

  _i2.GgetDeviceInfoDataBuilder? _optimisticResponse;
  _i2.GgetDeviceInfoDataBuilder get optimisticResponse =>
      _$this._optimisticResponse ??= new _i2.GgetDeviceInfoDataBuilder();
  set optimisticResponse(_i2.GgetDeviceInfoDataBuilder? optimisticResponse) =>
      _$this._optimisticResponse = optimisticResponse;

  String? _updateCacheHandlerKey;
  String? get updateCacheHandlerKey => _$this._updateCacheHandlerKey;
  set updateCacheHandlerKey(String? updateCacheHandlerKey) =>
      _$this._updateCacheHandlerKey = updateCacheHandlerKey;

  Map<String, dynamic>? _updateCacheHandlerContext;
  Map<String, dynamic>? get updateCacheHandlerContext =>
      _$this._updateCacheHandlerContext;
  set updateCacheHandlerContext(
          Map<String, dynamic>? updateCacheHandlerContext) =>
      _$this._updateCacheHandlerContext = updateCacheHandlerContext;

  _i1.FetchPolicy? _fetchPolicy;
  _i1.FetchPolicy? get fetchPolicy => _$this._fetchPolicy;
  set fetchPolicy(_i1.FetchPolicy? fetchPolicy) =>
      _$this._fetchPolicy = fetchPolicy;

  bool? _executeOnListen;
  bool? get executeOnListen => _$this._executeOnListen;
  set executeOnListen(bool? executeOnListen) =>
      _$this._executeOnListen = executeOnListen;

  GgetDeviceInfoReqBuilder() {
    GgetDeviceInfoReq._initializeBuilder(this);
  }

  GgetDeviceInfoReqBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _vars = $v.vars.toBuilder();
      _operation = $v.operation;
      _requestId = $v.requestId;
      _updateResult = $v.updateResult;
      _optimisticResponse = $v.optimisticResponse?.toBuilder();
      _updateCacheHandlerKey = $v.updateCacheHandlerKey;
      _updateCacheHandlerContext = $v.updateCacheHandlerContext;
      _fetchPolicy = $v.fetchPolicy;
      _executeOnListen = $v.executeOnListen;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GgetDeviceInfoReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GgetDeviceInfoReq;
  }

  @override
  void update(void Function(GgetDeviceInfoReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GgetDeviceInfoReq build() => _build();

  _$GgetDeviceInfoReq _build() {
    _$GgetDeviceInfoReq _$result;
    try {
      _$result = _$v ??
          new _$GgetDeviceInfoReq._(
              vars: vars.build(),
              operation: BuiltValueNullFieldError.checkNotNull(
                  operation, r'GgetDeviceInfoReq', 'operation'),
              requestId: requestId,
              updateResult: updateResult,
              optimisticResponse: _optimisticResponse?.build(),
              updateCacheHandlerKey: updateCacheHandlerKey,
              updateCacheHandlerContext: updateCacheHandlerContext,
              fetchPolicy: fetchPolicy,
              executeOnListen: BuiltValueNullFieldError.checkNotNull(
                  executeOnListen, r'GgetDeviceInfoReq', 'executeOnListen'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'vars';
        vars.build();

        _$failedField = 'optimisticResponse';
        _optimisticResponse?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GgetDeviceInfoReq', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GDevicePropertyFieldsReq extends GDevicePropertyFieldsReq {
  @override
  final _i3.GDevicePropertyFieldsVars vars;
  @override
  final _i7.DocumentNode document;
  @override
  final String? fragmentName;
  @override
  final Map<String, dynamic> idFields;

  factory _$GDevicePropertyFieldsReq(
          [void Function(GDevicePropertyFieldsReqBuilder)? updates]) =>
      (new GDevicePropertyFieldsReqBuilder()..update(updates))._build();

  _$GDevicePropertyFieldsReq._(
      {required this.vars,
      required this.document,
      this.fragmentName,
      required this.idFields})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        vars, r'GDevicePropertyFieldsReq', 'vars');
    BuiltValueNullFieldError.checkNotNull(
        document, r'GDevicePropertyFieldsReq', 'document');
    BuiltValueNullFieldError.checkNotNull(
        idFields, r'GDevicePropertyFieldsReq', 'idFields');
  }

  @override
  GDevicePropertyFieldsReq rebuild(
          void Function(GDevicePropertyFieldsReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GDevicePropertyFieldsReqBuilder toBuilder() =>
      new GDevicePropertyFieldsReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GDevicePropertyFieldsReq &&
        vars == other.vars &&
        document == other.document &&
        fragmentName == other.fragmentName &&
        idFields == other.idFields;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, vars.hashCode);
    _$hash = $jc(_$hash, document.hashCode);
    _$hash = $jc(_$hash, fragmentName.hashCode);
    _$hash = $jc(_$hash, idFields.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GDevicePropertyFieldsReq')
          ..add('vars', vars)
          ..add('document', document)
          ..add('fragmentName', fragmentName)
          ..add('idFields', idFields))
        .toString();
  }
}

class GDevicePropertyFieldsReqBuilder
    implements
        Builder<GDevicePropertyFieldsReq, GDevicePropertyFieldsReqBuilder> {
  _$GDevicePropertyFieldsReq? _$v;

  _i3.GDevicePropertyFieldsVarsBuilder? _vars;
  _i3.GDevicePropertyFieldsVarsBuilder get vars =>
      _$this._vars ??= new _i3.GDevicePropertyFieldsVarsBuilder();
  set vars(_i3.GDevicePropertyFieldsVarsBuilder? vars) => _$this._vars = vars;

  _i7.DocumentNode? _document;
  _i7.DocumentNode? get document => _$this._document;
  set document(_i7.DocumentNode? document) => _$this._document = document;

  String? _fragmentName;
  String? get fragmentName => _$this._fragmentName;
  set fragmentName(String? fragmentName) => _$this._fragmentName = fragmentName;

  Map<String, dynamic>? _idFields;
  Map<String, dynamic>? get idFields => _$this._idFields;
  set idFields(Map<String, dynamic>? idFields) => _$this._idFields = idFields;

  GDevicePropertyFieldsReqBuilder() {
    GDevicePropertyFieldsReq._initializeBuilder(this);
  }

  GDevicePropertyFieldsReqBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _vars = $v.vars.toBuilder();
      _document = $v.document;
      _fragmentName = $v.fragmentName;
      _idFields = $v.idFields;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GDevicePropertyFieldsReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GDevicePropertyFieldsReq;
  }

  @override
  void update(void Function(GDevicePropertyFieldsReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GDevicePropertyFieldsReq build() => _build();

  _$GDevicePropertyFieldsReq _build() {
    _$GDevicePropertyFieldsReq _$result;
    try {
      _$result = _$v ??
          new _$GDevicePropertyFieldsReq._(
              vars: vars.build(),
              document: BuiltValueNullFieldError.checkNotNull(
                  document, r'GDevicePropertyFieldsReq', 'document'),
              fragmentName: fragmentName,
              idFields: BuiltValueNullFieldError.checkNotNull(
                  idFields, r'GDevicePropertyFieldsReq', 'idFields'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'vars';
        vars.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GDevicePropertyFieldsReq', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
