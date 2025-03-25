// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'start_plot.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GStartPlotData> _$gStartPlotDataSerializer =
    new _$GStartPlotDataSerializer();
Serializer<GStartPlotData_startPlot> _$gStartPlotDataStartPlotSerializer =
    new _$GStartPlotData_startPlotSerializer();
Serializer<GStartPlotData_startPlot_data>
_$gStartPlotDataStartPlotDataSerializer =
    new _$GStartPlotData_startPlot_dataSerializer();
Serializer<GStartPlotData_startPlot_data_channelData>
_$gStartPlotDataStartPlotDataChannelDataSerializer =
    new _$GStartPlotData_startPlot_data_channelDataSerializer();

class _$GStartPlotDataSerializer
    implements StructuredSerializer<GStartPlotData> {
  @override
  final Iterable<Type> types = const [GStartPlotData, _$GStartPlotData];
  @override
  final String wireName = 'GStartPlotData';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    GStartPlotData object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(
        object.G__typename,
        specifiedType: const FullType(String),
      ),
      'startPlot',
      serializers.serialize(
        object.startPlot,
        specifiedType: const FullType(GStartPlotData_startPlot),
      ),
    ];

    return result;
  }

  @override
  GStartPlotData deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = new GStartPlotDataBuilder();

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
        case 'startPlot':
          result.startPlot.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(GStartPlotData_startPlot),
                )!
                as GStartPlotData_startPlot,
          );
          break;
      }
    }

    return result.build();
  }
}

class _$GStartPlotData_startPlotSerializer
    implements StructuredSerializer<GStartPlotData_startPlot> {
  @override
  final Iterable<Type> types = const [
    GStartPlotData_startPlot,
    _$GStartPlotData_startPlot,
  ];
  @override
  final String wireName = 'GStartPlotData_startPlot';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    GStartPlotData_startPlot object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(
        object.G__typename,
        specifiedType: const FullType(String),
      ),
      'plotId',
      serializers.serialize(
        object.plotId,
        specifiedType: const FullType(String),
      ),
      'data',
      serializers.serialize(
        object.data,
        specifiedType: const FullType(BuiltList, const [
          const FullType(GStartPlotData_startPlot_data),
        ]),
      ),
    ];
    Object? value;
    value = object.tstamp;
    if (value != null) {
      result
        ..add('tstamp')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(double)),
        );
    }
    return result;
  }

  @override
  GStartPlotData_startPlot deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = new GStartPlotData_startPlotBuilder();

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
        case 'tstamp':
          result.tstamp =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(double),
                  )
                  as double?;
          break;
        case 'plotId':
          result.plotId =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
        case 'data':
          result.data.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(BuiltList, const [
                    const FullType(GStartPlotData_startPlot_data),
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

class _$GStartPlotData_startPlot_dataSerializer
    implements StructuredSerializer<GStartPlotData_startPlot_data> {
  @override
  final Iterable<Type> types = const [
    GStartPlotData_startPlot_data,
    _$GStartPlotData_startPlot_data,
  ];
  @override
  final String wireName = 'GStartPlotData_startPlot_data';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    GStartPlotData_startPlot_data object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(
        object.G__typename,
        specifiedType: const FullType(String),
      ),
      'channelUnits',
      serializers.serialize(
        object.channelUnits,
        specifiedType: const FullType(String),
      ),
      'channelStatus',
      serializers.serialize(
        object.channelStatus,
        specifiedType: const FullType(int),
      ),
      'channelData',
      serializers.serialize(
        object.channelData,
        specifiedType: const FullType(BuiltList, const [
          const FullType(GStartPlotData_startPlot_data_channelData),
        ]),
      ),
    ];

    return result;
  }

  @override
  GStartPlotData_startPlot_data deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = new GStartPlotData_startPlot_dataBuilder();

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
        case 'channelUnits':
          result.channelUnits =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
        case 'channelStatus':
          result.channelStatus =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(int),
                  )!
                  as int;
          break;
        case 'channelData':
          result.channelData.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(BuiltList, const [
                    const FullType(GStartPlotData_startPlot_data_channelData),
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

class _$GStartPlotData_startPlot_data_channelDataSerializer
    implements StructuredSerializer<GStartPlotData_startPlot_data_channelData> {
  @override
  final Iterable<Type> types = const [
    GStartPlotData_startPlot_data_channelData,
    _$GStartPlotData_startPlot_data_channelData,
  ];
  @override
  final String wireName = 'GStartPlotData_startPlot_data_channelData';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    GStartPlotData_startPlot_data_channelData object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(
        object.G__typename,
        specifiedType: const FullType(String),
      ),
      'x',
      serializers.serialize(object.x, specifiedType: const FullType(double)),
      'y',
      serializers.serialize(object.y, specifiedType: const FullType(double)),
    ];

    return result;
  }

  @override
  GStartPlotData_startPlot_data_channelData deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = new GStartPlotData_startPlot_data_channelDataBuilder();

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
        case 'x':
          result.x =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(double),
                  )!
                  as double;
          break;
        case 'y':
          result.y =
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

class _$GStartPlotData extends GStartPlotData {
  @override
  final String G__typename;
  @override
  final GStartPlotData_startPlot startPlot;

  factory _$GStartPlotData([void Function(GStartPlotDataBuilder)? updates]) =>
      (new GStartPlotDataBuilder()..update(updates))._build();

  _$GStartPlotData._({required this.G__typename, required this.startPlot})
    : super._() {
    BuiltValueNullFieldError.checkNotNull(
      G__typename,
      r'GStartPlotData',
      'G__typename',
    );
    BuiltValueNullFieldError.checkNotNull(
      startPlot,
      r'GStartPlotData',
      'startPlot',
    );
  }

  @override
  GStartPlotData rebuild(void Function(GStartPlotDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GStartPlotDataBuilder toBuilder() =>
      new GStartPlotDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GStartPlotData &&
        G__typename == other.G__typename &&
        startPlot == other.startPlot;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, startPlot.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GStartPlotData')
          ..add('G__typename', G__typename)
          ..add('startPlot', startPlot))
        .toString();
  }
}

class GStartPlotDataBuilder
    implements Builder<GStartPlotData, GStartPlotDataBuilder> {
  _$GStartPlotData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GStartPlotData_startPlotBuilder? _startPlot;
  GStartPlotData_startPlotBuilder get startPlot =>
      _$this._startPlot ??= new GStartPlotData_startPlotBuilder();
  set startPlot(GStartPlotData_startPlotBuilder? startPlot) =>
      _$this._startPlot = startPlot;

  GStartPlotDataBuilder() {
    GStartPlotData._initializeBuilder(this);
  }

  GStartPlotDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _startPlot = $v.startPlot.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GStartPlotData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GStartPlotData;
  }

  @override
  void update(void Function(GStartPlotDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GStartPlotData build() => _build();

  _$GStartPlotData _build() {
    _$GStartPlotData _$result;
    try {
      _$result =
          _$v ??
          new _$GStartPlotData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
              G__typename,
              r'GStartPlotData',
              'G__typename',
            ),
            startPlot: startPlot.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'startPlot';
        startPlot.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
          r'GStartPlotData',
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

class _$GStartPlotData_startPlot extends GStartPlotData_startPlot {
  @override
  final String G__typename;
  @override
  final double? tstamp;
  @override
  final String plotId;
  @override
  final BuiltList<GStartPlotData_startPlot_data> data;

  factory _$GStartPlotData_startPlot([
    void Function(GStartPlotData_startPlotBuilder)? updates,
  ]) => (new GStartPlotData_startPlotBuilder()..update(updates))._build();

  _$GStartPlotData_startPlot._({
    required this.G__typename,
    this.tstamp,
    required this.plotId,
    required this.data,
  }) : super._() {
    BuiltValueNullFieldError.checkNotNull(
      G__typename,
      r'GStartPlotData_startPlot',
      'G__typename',
    );
    BuiltValueNullFieldError.checkNotNull(
      plotId,
      r'GStartPlotData_startPlot',
      'plotId',
    );
    BuiltValueNullFieldError.checkNotNull(
      data,
      r'GStartPlotData_startPlot',
      'data',
    );
  }

  @override
  GStartPlotData_startPlot rebuild(
    void Function(GStartPlotData_startPlotBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  GStartPlotData_startPlotBuilder toBuilder() =>
      new GStartPlotData_startPlotBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GStartPlotData_startPlot &&
        G__typename == other.G__typename &&
        tstamp == other.tstamp &&
        plotId == other.plotId &&
        data == other.data;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, tstamp.hashCode);
    _$hash = $jc(_$hash, plotId.hashCode);
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GStartPlotData_startPlot')
          ..add('G__typename', G__typename)
          ..add('tstamp', tstamp)
          ..add('plotId', plotId)
          ..add('data', data))
        .toString();
  }
}

class GStartPlotData_startPlotBuilder
    implements
        Builder<GStartPlotData_startPlot, GStartPlotData_startPlotBuilder> {
  _$GStartPlotData_startPlot? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  double? _tstamp;
  double? get tstamp => _$this._tstamp;
  set tstamp(double? tstamp) => _$this._tstamp = tstamp;

  String? _plotId;
  String? get plotId => _$this._plotId;
  set plotId(String? plotId) => _$this._plotId = plotId;

  ListBuilder<GStartPlotData_startPlot_data>? _data;
  ListBuilder<GStartPlotData_startPlot_data> get data =>
      _$this._data ??= new ListBuilder<GStartPlotData_startPlot_data>();
  set data(ListBuilder<GStartPlotData_startPlot_data>? data) =>
      _$this._data = data;

  GStartPlotData_startPlotBuilder() {
    GStartPlotData_startPlot._initializeBuilder(this);
  }

  GStartPlotData_startPlotBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _tstamp = $v.tstamp;
      _plotId = $v.plotId;
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GStartPlotData_startPlot other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GStartPlotData_startPlot;
  }

  @override
  void update(void Function(GStartPlotData_startPlotBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GStartPlotData_startPlot build() => _build();

  _$GStartPlotData_startPlot _build() {
    _$GStartPlotData_startPlot _$result;
    try {
      _$result =
          _$v ??
          new _$GStartPlotData_startPlot._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
              G__typename,
              r'GStartPlotData_startPlot',
              'G__typename',
            ),
            tstamp: tstamp,
            plotId: BuiltValueNullFieldError.checkNotNull(
              plotId,
              r'GStartPlotData_startPlot',
              'plotId',
            ),
            data: data.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
          r'GStartPlotData_startPlot',
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

class _$GStartPlotData_startPlot_data extends GStartPlotData_startPlot_data {
  @override
  final String G__typename;
  @override
  final String channelUnits;
  @override
  final int channelStatus;
  @override
  final BuiltList<GStartPlotData_startPlot_data_channelData> channelData;

  factory _$GStartPlotData_startPlot_data([
    void Function(GStartPlotData_startPlot_dataBuilder)? updates,
  ]) => (new GStartPlotData_startPlot_dataBuilder()..update(updates))._build();

  _$GStartPlotData_startPlot_data._({
    required this.G__typename,
    required this.channelUnits,
    required this.channelStatus,
    required this.channelData,
  }) : super._() {
    BuiltValueNullFieldError.checkNotNull(
      G__typename,
      r'GStartPlotData_startPlot_data',
      'G__typename',
    );
    BuiltValueNullFieldError.checkNotNull(
      channelUnits,
      r'GStartPlotData_startPlot_data',
      'channelUnits',
    );
    BuiltValueNullFieldError.checkNotNull(
      channelStatus,
      r'GStartPlotData_startPlot_data',
      'channelStatus',
    );
    BuiltValueNullFieldError.checkNotNull(
      channelData,
      r'GStartPlotData_startPlot_data',
      'channelData',
    );
  }

  @override
  GStartPlotData_startPlot_data rebuild(
    void Function(GStartPlotData_startPlot_dataBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  GStartPlotData_startPlot_dataBuilder toBuilder() =>
      new GStartPlotData_startPlot_dataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GStartPlotData_startPlot_data &&
        G__typename == other.G__typename &&
        channelUnits == other.channelUnits &&
        channelStatus == other.channelStatus &&
        channelData == other.channelData;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, channelUnits.hashCode);
    _$hash = $jc(_$hash, channelStatus.hashCode);
    _$hash = $jc(_$hash, channelData.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GStartPlotData_startPlot_data')
          ..add('G__typename', G__typename)
          ..add('channelUnits', channelUnits)
          ..add('channelStatus', channelStatus)
          ..add('channelData', channelData))
        .toString();
  }
}

class GStartPlotData_startPlot_dataBuilder
    implements
        Builder<
          GStartPlotData_startPlot_data,
          GStartPlotData_startPlot_dataBuilder
        > {
  _$GStartPlotData_startPlot_data? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _channelUnits;
  String? get channelUnits => _$this._channelUnits;
  set channelUnits(String? channelUnits) => _$this._channelUnits = channelUnits;

  int? _channelStatus;
  int? get channelStatus => _$this._channelStatus;
  set channelStatus(int? channelStatus) =>
      _$this._channelStatus = channelStatus;

  ListBuilder<GStartPlotData_startPlot_data_channelData>? _channelData;
  ListBuilder<GStartPlotData_startPlot_data_channelData> get channelData =>
      _$this._channelData ??=
          new ListBuilder<GStartPlotData_startPlot_data_channelData>();
  set channelData(
    ListBuilder<GStartPlotData_startPlot_data_channelData>? channelData,
  ) => _$this._channelData = channelData;

  GStartPlotData_startPlot_dataBuilder() {
    GStartPlotData_startPlot_data._initializeBuilder(this);
  }

  GStartPlotData_startPlot_dataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _channelUnits = $v.channelUnits;
      _channelStatus = $v.channelStatus;
      _channelData = $v.channelData.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GStartPlotData_startPlot_data other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GStartPlotData_startPlot_data;
  }

  @override
  void update(void Function(GStartPlotData_startPlot_dataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GStartPlotData_startPlot_data build() => _build();

  _$GStartPlotData_startPlot_data _build() {
    _$GStartPlotData_startPlot_data _$result;
    try {
      _$result =
          _$v ??
          new _$GStartPlotData_startPlot_data._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
              G__typename,
              r'GStartPlotData_startPlot_data',
              'G__typename',
            ),
            channelUnits: BuiltValueNullFieldError.checkNotNull(
              channelUnits,
              r'GStartPlotData_startPlot_data',
              'channelUnits',
            ),
            channelStatus: BuiltValueNullFieldError.checkNotNull(
              channelStatus,
              r'GStartPlotData_startPlot_data',
              'channelStatus',
            ),
            channelData: channelData.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'channelData';
        channelData.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
          r'GStartPlotData_startPlot_data',
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

class _$GStartPlotData_startPlot_data_channelData
    extends GStartPlotData_startPlot_data_channelData {
  @override
  final String G__typename;
  @override
  final double x;
  @override
  final double y;

  factory _$GStartPlotData_startPlot_data_channelData([
    void Function(GStartPlotData_startPlot_data_channelDataBuilder)? updates,
  ]) =>
      (new GStartPlotData_startPlot_data_channelDataBuilder()..update(updates))
          ._build();

  _$GStartPlotData_startPlot_data_channelData._({
    required this.G__typename,
    required this.x,
    required this.y,
  }) : super._() {
    BuiltValueNullFieldError.checkNotNull(
      G__typename,
      r'GStartPlotData_startPlot_data_channelData',
      'G__typename',
    );
    BuiltValueNullFieldError.checkNotNull(
      x,
      r'GStartPlotData_startPlot_data_channelData',
      'x',
    );
    BuiltValueNullFieldError.checkNotNull(
      y,
      r'GStartPlotData_startPlot_data_channelData',
      'y',
    );
  }

  @override
  GStartPlotData_startPlot_data_channelData rebuild(
    void Function(GStartPlotData_startPlot_data_channelDataBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  GStartPlotData_startPlot_data_channelDataBuilder toBuilder() =>
      new GStartPlotData_startPlot_data_channelDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GStartPlotData_startPlot_data_channelData &&
        G__typename == other.G__typename &&
        x == other.x &&
        y == other.y;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, x.hashCode);
    _$hash = $jc(_$hash, y.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GStartPlotData_startPlot_data_channelData',
          )
          ..add('G__typename', G__typename)
          ..add('x', x)
          ..add('y', y))
        .toString();
  }
}

class GStartPlotData_startPlot_data_channelDataBuilder
    implements
        Builder<
          GStartPlotData_startPlot_data_channelData,
          GStartPlotData_startPlot_data_channelDataBuilder
        > {
  _$GStartPlotData_startPlot_data_channelData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  double? _x;
  double? get x => _$this._x;
  set x(double? x) => _$this._x = x;

  double? _y;
  double? get y => _$this._y;
  set y(double? y) => _$this._y = y;

  GStartPlotData_startPlot_data_channelDataBuilder() {
    GStartPlotData_startPlot_data_channelData._initializeBuilder(this);
  }

  GStartPlotData_startPlot_data_channelDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _x = $v.x;
      _y = $v.y;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GStartPlotData_startPlot_data_channelData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GStartPlotData_startPlot_data_channelData;
  }

  @override
  void update(
    void Function(GStartPlotData_startPlot_data_channelDataBuilder)? updates,
  ) {
    if (updates != null) updates(this);
  }

  @override
  GStartPlotData_startPlot_data_channelData build() => _build();

  _$GStartPlotData_startPlot_data_channelData _build() {
    final _$result =
        _$v ??
        new _$GStartPlotData_startPlot_data_channelData._(
          G__typename: BuiltValueNullFieldError.checkNotNull(
            G__typename,
            r'GStartPlotData_startPlot_data_channelData',
            'G__typename',
          ),
          x: BuiltValueNullFieldError.checkNotNull(
            x,
            r'GStartPlotData_startPlot_data_channelData',
            'x',
          ),
          y: BuiltValueNullFieldError.checkNotNull(
            y,
            r'GStartPlotData_startPlot_data_channelData',
            'y',
          ),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
