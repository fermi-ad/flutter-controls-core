// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DPM.schema.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const GAcquisitionMode _$gAcquisitionModeONE_SHOT = const GAcquisitionMode._(
  'ONE_SHOT',
);
const GAcquisitionMode _$gAcquisitionModeONE_SHOT_TRIGGERED_ON_EVENT =
    const GAcquisitionMode._('ONE_SHOT_TRIGGERED_ON_EVENT');
const GAcquisitionMode _$gAcquisitionModeREPETITIVE_PERIODIC =
    const GAcquisitionMode._('REPETITIVE_PERIODIC');
const GAcquisitionMode _$gAcquisitionModeREPETITIVE_TRIGGERED_ON_EVENT =
    const GAcquisitionMode._('REPETITIVE_TRIGGERED_ON_EVENT');
const GAcquisitionMode _$gAcquisitionModeSAMPLE_ON_EVENT =
    const GAcquisitionMode._('SAMPLE_ON_EVENT');

GAcquisitionMode _$gAcquisitionModeValueOf(String name) {
  switch (name) {
    case 'ONE_SHOT':
      return _$gAcquisitionModeONE_SHOT;
    case 'ONE_SHOT_TRIGGERED_ON_EVENT':
      return _$gAcquisitionModeONE_SHOT_TRIGGERED_ON_EVENT;
    case 'REPETITIVE_PERIODIC':
      return _$gAcquisitionModeREPETITIVE_PERIODIC;
    case 'REPETITIVE_TRIGGERED_ON_EVENT':
      return _$gAcquisitionModeREPETITIVE_TRIGGERED_ON_EVENT;
    case 'SAMPLE_ON_EVENT':
      return _$gAcquisitionModeSAMPLE_ON_EVENT;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<GAcquisitionMode> _$gAcquisitionModeValues =
    new BuiltSet<GAcquisitionMode>(const <GAcquisitionMode>[
      _$gAcquisitionModeONE_SHOT,
      _$gAcquisitionModeONE_SHOT_TRIGGERED_ON_EVENT,
      _$gAcquisitionModeREPETITIVE_PERIODIC,
      _$gAcquisitionModeREPETITIVE_TRIGGERED_ON_EVENT,
      _$gAcquisitionModeSAMPLE_ON_EVENT,
    ]);

Serializer<GAcquisitionMode> _$gAcquisitionModeSerializer =
    new _$GAcquisitionModeSerializer();
Serializer<GChannelSettingSnapshotIn> _$gChannelSettingSnapshotInSerializer =
    new _$GChannelSettingSnapshotInSerializer();
Serializer<GDevValue> _$gDevValueSerializer = new _$GDevValueSerializer();
Serializer<GPlotConfigurationSnapshotIn>
_$gPlotConfigurationSnapshotInSerializer =
    new _$GPlotConfigurationSnapshotInSerializer();
Serializer<GTimeSeriesEntryIn> _$gTimeSeriesEntryInSerializer =
    new _$GTimeSeriesEntryInSerializer();

class _$GAcquisitionModeSerializer
    implements PrimitiveSerializer<GAcquisitionMode> {
  @override
  final Iterable<Type> types = const <Type>[GAcquisitionMode];
  @override
  final String wireName = 'GAcquisitionMode';

  @override
  Object serialize(
    Serializers serializers,
    GAcquisitionMode object, {
    FullType specifiedType = FullType.unspecified,
  }) => object.name;

  @override
  GAcquisitionMode deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => GAcquisitionMode.valueOf(serialized as String);
}

class _$GChannelSettingSnapshotInSerializer
    implements StructuredSerializer<GChannelSettingSnapshotIn> {
  @override
  final Iterable<Type> types = const [
    GChannelSettingSnapshotIn,
    _$GChannelSettingSnapshotIn,
  ];
  @override
  final String wireName = 'GChannelSettingSnapshotIn';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    GChannelSettingSnapshotIn object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'device',
      serializers.serialize(
        object.device,
        specifiedType: const FullType(String),
      ),
    ];
    Object? value;
    value = object.yMin;
    if (value != null) {
      result
        ..add('yMin')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(double)),
        );
    }
    value = object.yMax;
    if (value != null) {
      result
        ..add('yMax')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(double)),
        );
    }
    value = object.lineColor;
    if (value != null) {
      result
        ..add('lineColor')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.markerIndex;
    if (value != null) {
      result
        ..add('markerIndex')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  GChannelSettingSnapshotIn deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = new GChannelSettingSnapshotInBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'device':
          result.device =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
        case 'yMin':
          result.yMin =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(double),
                  )
                  as double?;
          break;
        case 'yMax':
          result.yMax =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(double),
                  )
                  as double?;
          break;
        case 'lineColor':
          result.lineColor =
              serializers.deserialize(value, specifiedType: const FullType(int))
                  as int?;
          break;
        case 'markerIndex':
          result.markerIndex =
              serializers.deserialize(value, specifiedType: const FullType(int))
                  as int?;
          break;
      }
    }

    return result.build();
  }
}

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
    final result = new GDevValueBuilder();

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

class _$GPlotConfigurationSnapshotInSerializer
    implements StructuredSerializer<GPlotConfigurationSnapshotIn> {
  @override
  final Iterable<Type> types = const [
    GPlotConfigurationSnapshotIn,
    _$GPlotConfigurationSnapshotIn,
  ];
  @override
  final String wireName = 'GPlotConfigurationSnapshotIn';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    GPlotConfigurationSnapshotIn object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'configurationName',
      serializers.serialize(
        object.configurationName,
        specifiedType: const FullType(String),
      ),
      'channels',
      serializers.serialize(
        object.channels,
        specifiedType: const FullType(BuiltList, const [
          const FullType(GChannelSettingSnapshotIn),
        ]),
      ),
      'isScalar',
      serializers.serialize(
        object.isScalar,
        specifiedType: const FullType(bool),
      ),
      'isOneShot',
      serializers.serialize(
        object.isOneShot,
        specifiedType: const FullType(bool),
      ),
      'isShowLabels',
      serializers.serialize(
        object.isShowLabels,
        specifiedType: const FullType(bool),
      ),
      'isPersistent',
      serializers.serialize(
        object.isPersistent,
        specifiedType: const FullType(bool),
      ),
      'isBlink',
      serializers.serialize(
        object.isBlink,
        specifiedType: const FullType(bool),
      ),
      'dataLimit',
      serializers.serialize(
        object.dataLimit,
        specifiedType: const FullType(int),
      ),
    ];
    Object? value;
    value = object.configurationId;
    if (value != null) {
      result
        ..add('configurationId')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.xMin;
    if (value != null) {
      result
        ..add('xMin')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(double)),
        );
    }
    value = object.xMax;
    if (value != null) {
      result
        ..add('xMax')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(double)),
        );
    }
    value = object.startTime;
    if (value != null) {
      result
        ..add('startTime')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(double)),
        );
    }
    value = object.endTime;
    if (value != null) {
      result
        ..add('endTime')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(double)),
        );
    }
    value = object.timeDelta;
    if (value != null) {
      result
        ..add('timeDelta')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(double)),
        );
    }
    value = object.acquisitionMode;
    if (value != null) {
      result
        ..add('acquisitionMode')
        ..add(
          serializers.serialize(
            value,
            specifiedType: const FullType(GAcquisitionMode),
          ),
        );
    }
    value = object.updateDelay;
    if (value != null) {
      result
        ..add('updateDelay')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.nAcquisitions;
    if (value != null) {
      result
        ..add('nAcquisitions')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.tclkEvent;
    if (value != null) {
      result
        ..add('tclkEvent')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.sampleOnEvent;
    if (value != null) {
      result
        ..add('sampleOnEvent')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.chXAxis;
    if (value != null) {
      result
        ..add('chXAxis')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }
    return result;
  }

  @override
  GPlotConfigurationSnapshotIn deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = new GPlotConfigurationSnapshotInBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'configurationId':
          result.configurationId =
              serializers.deserialize(value, specifiedType: const FullType(int))
                  as int?;
          break;
        case 'configurationName':
          result.configurationName =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
        case 'channels':
          result.channels.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(BuiltList, const [
                    const FullType(GChannelSettingSnapshotIn),
                  ]),
                )!
                as BuiltList<Object?>,
          );
          break;
        case 'xMin':
          result.xMin =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(double),
                  )
                  as double?;
          break;
        case 'xMax':
          result.xMax =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(double),
                  )
                  as double?;
          break;
        case 'startTime':
          result.startTime =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(double),
                  )
                  as double?;
          break;
        case 'endTime':
          result.endTime =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(double),
                  )
                  as double?;
          break;
        case 'timeDelta':
          result.timeDelta =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(double),
                  )
                  as double?;
          break;
        case 'isScalar':
          result.isScalar =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(bool),
                  )!
                  as bool;
          break;
        case 'isOneShot':
          result.isOneShot =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(bool),
                  )!
                  as bool;
          break;
        case 'isShowLabels':
          result.isShowLabels =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(bool),
                  )!
                  as bool;
          break;
        case 'isPersistent':
          result.isPersistent =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(bool),
                  )!
                  as bool;
          break;
        case 'isBlink':
          result.isBlink =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(bool),
                  )!
                  as bool;
          break;
        case 'acquisitionMode':
          result.acquisitionMode =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(GAcquisitionMode),
                  )
                  as GAcquisitionMode?;
          break;
        case 'dataLimit':
          result.dataLimit =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(int),
                  )!
                  as int;
          break;
        case 'updateDelay':
          result.updateDelay =
              serializers.deserialize(value, specifiedType: const FullType(int))
                  as int?;
          break;
        case 'nAcquisitions':
          result.nAcquisitions =
              serializers.deserialize(value, specifiedType: const FullType(int))
                  as int?;
          break;
        case 'tclkEvent':
          result.tclkEvent =
              serializers.deserialize(value, specifiedType: const FullType(int))
                  as int?;
          break;
        case 'sampleOnEvent':
          result.sampleOnEvent =
              serializers.deserialize(value, specifiedType: const FullType(int))
                  as int?;
          break;
        case 'chXAxis':
          result.chXAxis =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String?;
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
    final result = new GTimeSeriesEntryInBuilder();

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

class _$GChannelSettingSnapshotIn extends GChannelSettingSnapshotIn {
  @override
  final String device;
  @override
  final double? yMin;
  @override
  final double? yMax;
  @override
  final int? lineColor;
  @override
  final int? markerIndex;

  factory _$GChannelSettingSnapshotIn([
    void Function(GChannelSettingSnapshotInBuilder)? updates,
  ]) => (new GChannelSettingSnapshotInBuilder()..update(updates))._build();

  _$GChannelSettingSnapshotIn._({
    required this.device,
    this.yMin,
    this.yMax,
    this.lineColor,
    this.markerIndex,
  }) : super._() {
    BuiltValueNullFieldError.checkNotNull(
      device,
      r'GChannelSettingSnapshotIn',
      'device',
    );
  }

  @override
  GChannelSettingSnapshotIn rebuild(
    void Function(GChannelSettingSnapshotInBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  GChannelSettingSnapshotInBuilder toBuilder() =>
      new GChannelSettingSnapshotInBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GChannelSettingSnapshotIn &&
        device == other.device &&
        yMin == other.yMin &&
        yMax == other.yMax &&
        lineColor == other.lineColor &&
        markerIndex == other.markerIndex;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, device.hashCode);
    _$hash = $jc(_$hash, yMin.hashCode);
    _$hash = $jc(_$hash, yMax.hashCode);
    _$hash = $jc(_$hash, lineColor.hashCode);
    _$hash = $jc(_$hash, markerIndex.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GChannelSettingSnapshotIn')
          ..add('device', device)
          ..add('yMin', yMin)
          ..add('yMax', yMax)
          ..add('lineColor', lineColor)
          ..add('markerIndex', markerIndex))
        .toString();
  }
}

class GChannelSettingSnapshotInBuilder
    implements
        Builder<GChannelSettingSnapshotIn, GChannelSettingSnapshotInBuilder> {
  _$GChannelSettingSnapshotIn? _$v;

  String? _device;
  String? get device => _$this._device;
  set device(String? device) => _$this._device = device;

  double? _yMin;
  double? get yMin => _$this._yMin;
  set yMin(double? yMin) => _$this._yMin = yMin;

  double? _yMax;
  double? get yMax => _$this._yMax;
  set yMax(double? yMax) => _$this._yMax = yMax;

  int? _lineColor;
  int? get lineColor => _$this._lineColor;
  set lineColor(int? lineColor) => _$this._lineColor = lineColor;

  int? _markerIndex;
  int? get markerIndex => _$this._markerIndex;
  set markerIndex(int? markerIndex) => _$this._markerIndex = markerIndex;

  GChannelSettingSnapshotInBuilder();

  GChannelSettingSnapshotInBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _device = $v.device;
      _yMin = $v.yMin;
      _yMax = $v.yMax;
      _lineColor = $v.lineColor;
      _markerIndex = $v.markerIndex;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GChannelSettingSnapshotIn other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GChannelSettingSnapshotIn;
  }

  @override
  void update(void Function(GChannelSettingSnapshotInBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GChannelSettingSnapshotIn build() => _build();

  _$GChannelSettingSnapshotIn _build() {
    final _$result =
        _$v ??
        new _$GChannelSettingSnapshotIn._(
          device: BuiltValueNullFieldError.checkNotNull(
            device,
            r'GChannelSettingSnapshotIn',
            'device',
          ),
          yMin: yMin,
          yMax: yMax,
          lineColor: lineColor,
          markerIndex: markerIndex,
        );
    replace(_$result);
    return _$result;
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
  @override
  final BuiltList<GTimeSeriesEntryIn>? timeSeriesVal;

  factory _$GDevValue([void Function(GDevValueBuilder)? updates]) =>
      (new GDevValueBuilder()..update(updates))._build();

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

  ListBuilder<GTimeSeriesEntryIn>? _timeSeriesVal;
  ListBuilder<GTimeSeriesEntryIn> get timeSeriesVal =>
      _$this._timeSeriesVal ??= new ListBuilder<GTimeSeriesEntryIn>();
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
      _$result =
          _$v ??
          new _$GDevValue._(
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
        throw new BuiltValueNestedFieldError(
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

class _$GPlotConfigurationSnapshotIn extends GPlotConfigurationSnapshotIn {
  @override
  final int? configurationId;
  @override
  final String configurationName;
  @override
  final BuiltList<GChannelSettingSnapshotIn> channels;
  @override
  final double? xMin;
  @override
  final double? xMax;
  @override
  final double? startTime;
  @override
  final double? endTime;
  @override
  final double? timeDelta;
  @override
  final bool isScalar;
  @override
  final bool isOneShot;
  @override
  final bool isShowLabels;
  @override
  final bool isPersistent;
  @override
  final bool isBlink;
  @override
  final GAcquisitionMode? acquisitionMode;
  @override
  final int dataLimit;
  @override
  final int? updateDelay;
  @override
  final int? nAcquisitions;
  @override
  final int? tclkEvent;
  @override
  final int? sampleOnEvent;
  @override
  final String? chXAxis;

  factory _$GPlotConfigurationSnapshotIn([
    void Function(GPlotConfigurationSnapshotInBuilder)? updates,
  ]) => (new GPlotConfigurationSnapshotInBuilder()..update(updates))._build();

  _$GPlotConfigurationSnapshotIn._({
    this.configurationId,
    required this.configurationName,
    required this.channels,
    this.xMin,
    this.xMax,
    this.startTime,
    this.endTime,
    this.timeDelta,
    required this.isScalar,
    required this.isOneShot,
    required this.isShowLabels,
    required this.isPersistent,
    required this.isBlink,
    this.acquisitionMode,
    required this.dataLimit,
    this.updateDelay,
    this.nAcquisitions,
    this.tclkEvent,
    this.sampleOnEvent,
    this.chXAxis,
  }) : super._() {
    BuiltValueNullFieldError.checkNotNull(
      configurationName,
      r'GPlotConfigurationSnapshotIn',
      'configurationName',
    );
    BuiltValueNullFieldError.checkNotNull(
      channels,
      r'GPlotConfigurationSnapshotIn',
      'channels',
    );
    BuiltValueNullFieldError.checkNotNull(
      isScalar,
      r'GPlotConfigurationSnapshotIn',
      'isScalar',
    );
    BuiltValueNullFieldError.checkNotNull(
      isOneShot,
      r'GPlotConfigurationSnapshotIn',
      'isOneShot',
    );
    BuiltValueNullFieldError.checkNotNull(
      isShowLabels,
      r'GPlotConfigurationSnapshotIn',
      'isShowLabels',
    );
    BuiltValueNullFieldError.checkNotNull(
      isPersistent,
      r'GPlotConfigurationSnapshotIn',
      'isPersistent',
    );
    BuiltValueNullFieldError.checkNotNull(
      isBlink,
      r'GPlotConfigurationSnapshotIn',
      'isBlink',
    );
    BuiltValueNullFieldError.checkNotNull(
      dataLimit,
      r'GPlotConfigurationSnapshotIn',
      'dataLimit',
    );
  }

  @override
  GPlotConfigurationSnapshotIn rebuild(
    void Function(GPlotConfigurationSnapshotInBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  GPlotConfigurationSnapshotInBuilder toBuilder() =>
      new GPlotConfigurationSnapshotInBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPlotConfigurationSnapshotIn &&
        configurationId == other.configurationId &&
        configurationName == other.configurationName &&
        channels == other.channels &&
        xMin == other.xMin &&
        xMax == other.xMax &&
        startTime == other.startTime &&
        endTime == other.endTime &&
        timeDelta == other.timeDelta &&
        isScalar == other.isScalar &&
        isOneShot == other.isOneShot &&
        isShowLabels == other.isShowLabels &&
        isPersistent == other.isPersistent &&
        isBlink == other.isBlink &&
        acquisitionMode == other.acquisitionMode &&
        dataLimit == other.dataLimit &&
        updateDelay == other.updateDelay &&
        nAcquisitions == other.nAcquisitions &&
        tclkEvent == other.tclkEvent &&
        sampleOnEvent == other.sampleOnEvent &&
        chXAxis == other.chXAxis;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, configurationId.hashCode);
    _$hash = $jc(_$hash, configurationName.hashCode);
    _$hash = $jc(_$hash, channels.hashCode);
    _$hash = $jc(_$hash, xMin.hashCode);
    _$hash = $jc(_$hash, xMax.hashCode);
    _$hash = $jc(_$hash, startTime.hashCode);
    _$hash = $jc(_$hash, endTime.hashCode);
    _$hash = $jc(_$hash, timeDelta.hashCode);
    _$hash = $jc(_$hash, isScalar.hashCode);
    _$hash = $jc(_$hash, isOneShot.hashCode);
    _$hash = $jc(_$hash, isShowLabels.hashCode);
    _$hash = $jc(_$hash, isPersistent.hashCode);
    _$hash = $jc(_$hash, isBlink.hashCode);
    _$hash = $jc(_$hash, acquisitionMode.hashCode);
    _$hash = $jc(_$hash, dataLimit.hashCode);
    _$hash = $jc(_$hash, updateDelay.hashCode);
    _$hash = $jc(_$hash, nAcquisitions.hashCode);
    _$hash = $jc(_$hash, tclkEvent.hashCode);
    _$hash = $jc(_$hash, sampleOnEvent.hashCode);
    _$hash = $jc(_$hash, chXAxis.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GPlotConfigurationSnapshotIn')
          ..add('configurationId', configurationId)
          ..add('configurationName', configurationName)
          ..add('channels', channels)
          ..add('xMin', xMin)
          ..add('xMax', xMax)
          ..add('startTime', startTime)
          ..add('endTime', endTime)
          ..add('timeDelta', timeDelta)
          ..add('isScalar', isScalar)
          ..add('isOneShot', isOneShot)
          ..add('isShowLabels', isShowLabels)
          ..add('isPersistent', isPersistent)
          ..add('isBlink', isBlink)
          ..add('acquisitionMode', acquisitionMode)
          ..add('dataLimit', dataLimit)
          ..add('updateDelay', updateDelay)
          ..add('nAcquisitions', nAcquisitions)
          ..add('tclkEvent', tclkEvent)
          ..add('sampleOnEvent', sampleOnEvent)
          ..add('chXAxis', chXAxis))
        .toString();
  }
}

class GPlotConfigurationSnapshotInBuilder
    implements
        Builder<
          GPlotConfigurationSnapshotIn,
          GPlotConfigurationSnapshotInBuilder
        > {
  _$GPlotConfigurationSnapshotIn? _$v;

  int? _configurationId;
  int? get configurationId => _$this._configurationId;
  set configurationId(int? configurationId) =>
      _$this._configurationId = configurationId;

  String? _configurationName;
  String? get configurationName => _$this._configurationName;
  set configurationName(String? configurationName) =>
      _$this._configurationName = configurationName;

  ListBuilder<GChannelSettingSnapshotIn>? _channels;
  ListBuilder<GChannelSettingSnapshotIn> get channels =>
      _$this._channels ??= new ListBuilder<GChannelSettingSnapshotIn>();
  set channels(ListBuilder<GChannelSettingSnapshotIn>? channels) =>
      _$this._channels = channels;

  double? _xMin;
  double? get xMin => _$this._xMin;
  set xMin(double? xMin) => _$this._xMin = xMin;

  double? _xMax;
  double? get xMax => _$this._xMax;
  set xMax(double? xMax) => _$this._xMax = xMax;

  double? _startTime;
  double? get startTime => _$this._startTime;
  set startTime(double? startTime) => _$this._startTime = startTime;

  double? _endTime;
  double? get endTime => _$this._endTime;
  set endTime(double? endTime) => _$this._endTime = endTime;

  double? _timeDelta;
  double? get timeDelta => _$this._timeDelta;
  set timeDelta(double? timeDelta) => _$this._timeDelta = timeDelta;

  bool? _isScalar;
  bool? get isScalar => _$this._isScalar;
  set isScalar(bool? isScalar) => _$this._isScalar = isScalar;

  bool? _isOneShot;
  bool? get isOneShot => _$this._isOneShot;
  set isOneShot(bool? isOneShot) => _$this._isOneShot = isOneShot;

  bool? _isShowLabels;
  bool? get isShowLabels => _$this._isShowLabels;
  set isShowLabels(bool? isShowLabels) => _$this._isShowLabels = isShowLabels;

  bool? _isPersistent;
  bool? get isPersistent => _$this._isPersistent;
  set isPersistent(bool? isPersistent) => _$this._isPersistent = isPersistent;

  bool? _isBlink;
  bool? get isBlink => _$this._isBlink;
  set isBlink(bool? isBlink) => _$this._isBlink = isBlink;

  GAcquisitionMode? _acquisitionMode;
  GAcquisitionMode? get acquisitionMode => _$this._acquisitionMode;
  set acquisitionMode(GAcquisitionMode? acquisitionMode) =>
      _$this._acquisitionMode = acquisitionMode;

  int? _dataLimit;
  int? get dataLimit => _$this._dataLimit;
  set dataLimit(int? dataLimit) => _$this._dataLimit = dataLimit;

  int? _updateDelay;
  int? get updateDelay => _$this._updateDelay;
  set updateDelay(int? updateDelay) => _$this._updateDelay = updateDelay;

  int? _nAcquisitions;
  int? get nAcquisitions => _$this._nAcquisitions;
  set nAcquisitions(int? nAcquisitions) =>
      _$this._nAcquisitions = nAcquisitions;

  int? _tclkEvent;
  int? get tclkEvent => _$this._tclkEvent;
  set tclkEvent(int? tclkEvent) => _$this._tclkEvent = tclkEvent;

  int? _sampleOnEvent;
  int? get sampleOnEvent => _$this._sampleOnEvent;
  set sampleOnEvent(int? sampleOnEvent) =>
      _$this._sampleOnEvent = sampleOnEvent;

  String? _chXAxis;
  String? get chXAxis => _$this._chXAxis;
  set chXAxis(String? chXAxis) => _$this._chXAxis = chXAxis;

  GPlotConfigurationSnapshotInBuilder();

  GPlotConfigurationSnapshotInBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _configurationId = $v.configurationId;
      _configurationName = $v.configurationName;
      _channels = $v.channels.toBuilder();
      _xMin = $v.xMin;
      _xMax = $v.xMax;
      _startTime = $v.startTime;
      _endTime = $v.endTime;
      _timeDelta = $v.timeDelta;
      _isScalar = $v.isScalar;
      _isOneShot = $v.isOneShot;
      _isShowLabels = $v.isShowLabels;
      _isPersistent = $v.isPersistent;
      _isBlink = $v.isBlink;
      _acquisitionMode = $v.acquisitionMode;
      _dataLimit = $v.dataLimit;
      _updateDelay = $v.updateDelay;
      _nAcquisitions = $v.nAcquisitions;
      _tclkEvent = $v.tclkEvent;
      _sampleOnEvent = $v.sampleOnEvent;
      _chXAxis = $v.chXAxis;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPlotConfigurationSnapshotIn other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPlotConfigurationSnapshotIn;
  }

  @override
  void update(void Function(GPlotConfigurationSnapshotInBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPlotConfigurationSnapshotIn build() => _build();

  _$GPlotConfigurationSnapshotIn _build() {
    _$GPlotConfigurationSnapshotIn _$result;
    try {
      _$result =
          _$v ??
          new _$GPlotConfigurationSnapshotIn._(
            configurationId: configurationId,
            configurationName: BuiltValueNullFieldError.checkNotNull(
              configurationName,
              r'GPlotConfigurationSnapshotIn',
              'configurationName',
            ),
            channels: channels.build(),
            xMin: xMin,
            xMax: xMax,
            startTime: startTime,
            endTime: endTime,
            timeDelta: timeDelta,
            isScalar: BuiltValueNullFieldError.checkNotNull(
              isScalar,
              r'GPlotConfigurationSnapshotIn',
              'isScalar',
            ),
            isOneShot: BuiltValueNullFieldError.checkNotNull(
              isOneShot,
              r'GPlotConfigurationSnapshotIn',
              'isOneShot',
            ),
            isShowLabels: BuiltValueNullFieldError.checkNotNull(
              isShowLabels,
              r'GPlotConfigurationSnapshotIn',
              'isShowLabels',
            ),
            isPersistent: BuiltValueNullFieldError.checkNotNull(
              isPersistent,
              r'GPlotConfigurationSnapshotIn',
              'isPersistent',
            ),
            isBlink: BuiltValueNullFieldError.checkNotNull(
              isBlink,
              r'GPlotConfigurationSnapshotIn',
              'isBlink',
            ),
            acquisitionMode: acquisitionMode,
            dataLimit: BuiltValueNullFieldError.checkNotNull(
              dataLimit,
              r'GPlotConfigurationSnapshotIn',
              'dataLimit',
            ),
            updateDelay: updateDelay,
            nAcquisitions: nAcquisitions,
            tclkEvent: tclkEvent,
            sampleOnEvent: sampleOnEvent,
            chXAxis: chXAxis,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'channels';
        channels.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
          r'GPlotConfigurationSnapshotIn',
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
  ]) => (new GTimeSeriesEntryInBuilder()..update(updates))._build();

  _$GTimeSeriesEntryIn._({required this.stamp, required this.value})
    : super._() {
    BuiltValueNullFieldError.checkNotNull(
      stamp,
      r'GTimeSeriesEntryIn',
      'stamp',
    );
    BuiltValueNullFieldError.checkNotNull(
      value,
      r'GTimeSeriesEntryIn',
      'value',
    );
  }

  @override
  GTimeSeriesEntryIn rebuild(
    void Function(GTimeSeriesEntryInBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  GTimeSeriesEntryInBuilder toBuilder() =>
      new GTimeSeriesEntryInBuilder()..replace(this);

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
    ArgumentError.checkNotNull(other, 'other');
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
        new _$GTimeSeriesEntryIn._(
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

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
