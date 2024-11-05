// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_controls_core/src/service/acsys/schema/__generated__/serializers.gql.dart'
    as _i1;

part 'start_plot.data.gql.g.dart';

abstract class GStartPlotData
    implements Built<GStartPlotData, GStartPlotDataBuilder> {
  GStartPlotData._();

  factory GStartPlotData([Function(GStartPlotDataBuilder b) updates]) =
      _$GStartPlotData;

  static void _initializeBuilder(GStartPlotDataBuilder b) =>
      b..G__typename = 'Subscription';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GStartPlotData_startPlot get startPlot;
  static Serializer<GStartPlotData> get serializer =>
      _$gStartPlotDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GStartPlotData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GStartPlotData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GStartPlotData.serializer,
        json,
      );
}

abstract class GStartPlotData_startPlot
    implements
        Built<GStartPlotData_startPlot, GStartPlotData_startPlotBuilder> {
  GStartPlotData_startPlot._();

  factory GStartPlotData_startPlot(
          [Function(GStartPlotData_startPlotBuilder b) updates]) =
      _$GStartPlotData_startPlot;

  static void _initializeBuilder(GStartPlotData_startPlotBuilder b) =>
      b..G__typename = 'PlotReplyData';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get plotId;
  BuiltList<GStartPlotData_startPlot_data> get data;
  static Serializer<GStartPlotData_startPlot> get serializer =>
      _$gStartPlotDataStartPlotSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GStartPlotData_startPlot.serializer,
        this,
      ) as Map<String, dynamic>);

  static GStartPlotData_startPlot? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GStartPlotData_startPlot.serializer,
        json,
      );
}

abstract class GStartPlotData_startPlot_data
    implements
        Built<GStartPlotData_startPlot_data,
            GStartPlotData_startPlot_dataBuilder> {
  GStartPlotData_startPlot_data._();

  factory GStartPlotData_startPlot_data(
          [Function(GStartPlotData_startPlot_dataBuilder b) updates]) =
      _$GStartPlotData_startPlot_data;

  static void _initializeBuilder(GStartPlotData_startPlot_dataBuilder b) =>
      b..G__typename = 'PlotChannelData';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get channelUnits;
  int get channelStatus;
  BuiltList<GStartPlotData_startPlot_data_channelData> get channelData;
  static Serializer<GStartPlotData_startPlot_data> get serializer =>
      _$gStartPlotDataStartPlotDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GStartPlotData_startPlot_data.serializer,
        this,
      ) as Map<String, dynamic>);

  static GStartPlotData_startPlot_data? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GStartPlotData_startPlot_data.serializer,
        json,
      );
}

abstract class GStartPlotData_startPlot_data_channelData
    implements
        Built<GStartPlotData_startPlot_data_channelData,
            GStartPlotData_startPlot_data_channelDataBuilder> {
  GStartPlotData_startPlot_data_channelData._();

  factory GStartPlotData_startPlot_data_channelData(
      [Function(GStartPlotData_startPlot_data_channelDataBuilder b)
          updates]) = _$GStartPlotData_startPlot_data_channelData;

  static void _initializeBuilder(
          GStartPlotData_startPlot_data_channelDataBuilder b) =>
      b..G__typename = 'PlotDataPoint';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  double get x;
  double get y;
  static Serializer<GStartPlotData_startPlot_data_channelData> get serializer =>
      _$gStartPlotDataStartPlotDataChannelDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GStartPlotData_startPlot_data_channelData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GStartPlotData_startPlot_data_channelData? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GStartPlotData_startPlot_data_channelData.serializer,
        json,
      );
}
