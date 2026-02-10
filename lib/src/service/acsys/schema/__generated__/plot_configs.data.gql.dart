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
  BuiltList<String> get plotConfiguration;
  static Serializer<GPlotConfigsData> get serializer =>
      _$gPlotConfigsDataSerializer;

  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GPlotConfigsData.serializer, this)
          as Map<String, dynamic>);

  static GPlotConfigsData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GPlotConfigsData.serializer, json);
}
