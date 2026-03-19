// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_controls_core/src/service/acsys/schema/__generated__/serializers.gql.dart'
    as _i1;

part 'plot_configs.data.gql.g.dart';

abstract class GPlotConfigsData
    implements Built<GPlotConfigsData, GPlotConfigsDataBuilder> {
  GPlotConfigsData._();

  factory GPlotConfigsData([void Function(GPlotConfigsDataBuilder b) updates]) =
      _$GPlotConfigsData;

  static void _initializeBuilder(GPlotConfigsDataBuilder b) =>
      b..G__typename = 'Query';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GPlotConfigsData_plotConfiguration> get plotConfiguration;
  static Serializer<GPlotConfigsData> get serializer =>
      _$gPlotConfigsDataSerializer;

  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GPlotConfigsData.serializer, this)
          as Map<String, dynamic>);

  static GPlotConfigsData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GPlotConfigsData.serializer, json);
}

abstract class GPlotConfigsData_plotConfiguration
    implements
        Built<
          GPlotConfigsData_plotConfiguration,
          GPlotConfigsData_plotConfigurationBuilder
        > {
  GPlotConfigsData_plotConfiguration._();

  factory GPlotConfigsData_plotConfiguration([
    void Function(GPlotConfigsData_plotConfigurationBuilder b) updates,
  ]) = _$GPlotConfigsData_plotConfiguration;

  static void _initializeBuilder(GPlotConfigsData_plotConfigurationBuilder b) =>
      b..G__typename = 'PlotConfig';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int get configId;
  String get configName;
  String get config;
  static Serializer<GPlotConfigsData_plotConfiguration> get serializer =>
      _$gPlotConfigsDataPlotConfigurationSerializer;

  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(
            GPlotConfigsData_plotConfiguration.serializer,
            this,
          )
          as Map<String, dynamic>);

  static GPlotConfigsData_plotConfiguration? fromJson(
    Map<String, dynamic> json,
  ) => _i1.serializers.deserializeWith(
    GPlotConfigsData_plotConfiguration.serializer,
    json,
  );
}
