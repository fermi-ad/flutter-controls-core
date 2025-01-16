// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_controls_core/src/service/acsys/schema/__generated__/serializers.gql.dart'
    as _i1;

part 'update_plot_config.data.gql.g.dart';

abstract class GUpdatePlotConfigData
    implements Built<GUpdatePlotConfigData, GUpdatePlotConfigDataBuilder> {
  GUpdatePlotConfigData._();

  factory GUpdatePlotConfigData(
          [Function(GUpdatePlotConfigDataBuilder b) updates]) =
      _$GUpdatePlotConfigData;

  static void _initializeBuilder(GUpdatePlotConfigDataBuilder b) =>
      b..G__typename = 'Mutation';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GUpdatePlotConfigData_updatePlotConfiguration get updatePlotConfiguration;
  static Serializer<GUpdatePlotConfigData> get serializer =>
      _$gUpdatePlotConfigDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdatePlotConfigData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUpdatePlotConfigData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdatePlotConfigData.serializer,
        json,
      );
}

abstract class GUpdatePlotConfigData_updatePlotConfiguration
    implements
        Built<GUpdatePlotConfigData_updatePlotConfiguration,
            GUpdatePlotConfigData_updatePlotConfigurationBuilder> {
  GUpdatePlotConfigData_updatePlotConfiguration._();

  factory GUpdatePlotConfigData_updatePlotConfiguration(
      [Function(GUpdatePlotConfigData_updatePlotConfigurationBuilder b)
          updates]) = _$GUpdatePlotConfigData_updatePlotConfiguration;

  static void _initializeBuilder(
          GUpdatePlotConfigData_updatePlotConfigurationBuilder b) =>
      b..G__typename = 'StatusReply';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int get status;
  static Serializer<GUpdatePlotConfigData_updatePlotConfiguration>
      get serializer =>
          _$gUpdatePlotConfigDataUpdatePlotConfigurationSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdatePlotConfigData_updatePlotConfiguration.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUpdatePlotConfigData_updatePlotConfiguration? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdatePlotConfigData_updatePlotConfiguration.serializer,
        json,
      );
}
