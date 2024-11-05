// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart' show StandardJsonPlugin;
import 'package:ferry_exec/ferry_exec.dart';
import 'package:flutter_controls_core/src/service/acsys/schema/__generated__/DPM.schema.gql.dart'
    show GDevValue, GXformAvgExpr, GXformDeviceExpr, GXformExpr, GXformRequest;
import 'package:flutter_controls_core/src/service/acsys/schema/__generated__/set_device.data.gql.dart'
    show GSetDeviceData, GSetDeviceData_setDevice;
import 'package:flutter_controls_core/src/service/acsys/schema/__generated__/set_device.req.gql.dart'
    show GSetDeviceReq;
import 'package:flutter_controls_core/src/service/acsys/schema/__generated__/set_device.var.gql.dart'
    show GSetDeviceVars;
import 'package:flutter_controls_core/src/service/acsys/schema/__generated__/start_plot.data.gql.dart'
    show
        GStartPlotData,
        GStartPlotData_startPlot,
        GStartPlotData_startPlot_data,
        GStartPlotData_startPlot_data_channelData;
import 'package:flutter_controls_core/src/service/acsys/schema/__generated__/start_plot.req.gql.dart'
    show GStartPlotReq;
import 'package:flutter_controls_core/src/service/acsys/schema/__generated__/start_plot.var.gql.dart'
    show GStartPlotVars;
import 'package:flutter_controls_core/src/service/acsys/schema/__generated__/stream_data.data.gql.dart'
    show
        GStreamDataData_acceleratorData_data_result,
        GStreamDataData,
        GStreamDataData_acceleratorData,
        GStreamDataData_acceleratorData_data,
        GStreamDataData_acceleratorData_data_result__asScalar,
        GStreamDataData_acceleratorData_data_result__asStatusReply,
        GStreamDataData_acceleratorData_data_result__base;
import 'package:flutter_controls_core/src/service/acsys/schema/__generated__/stream_data.req.gql.dart'
    show GStreamDataReq;
import 'package:flutter_controls_core/src/service/acsys/schema/__generated__/stream_data.var.gql.dart'
    show GStreamDataVars;
import 'package:flutter_controls_core/src/service/date_serializer.dart'
    show DateSerializer;
import 'package:gql_code_builder/src/serializers/operation_serializer.dart'
    show OperationSerializer;

part 'serializers.gql.g.dart';

final SerializersBuilder _serializersBuilder = _$serializers.toBuilder()
  ..add(OperationSerializer())
  ..add(DateSerializer())
  ..add(GStreamDataData_acceleratorData_data_result.serializer)
  ..addPlugin(StandardJsonPlugin());
@SerializersFor([
  GDevValue,
  GSetDeviceData,
  GSetDeviceData_setDevice,
  GSetDeviceReq,
  GSetDeviceVars,
  GStartPlotData,
  GStartPlotData_startPlot,
  GStartPlotData_startPlot_data,
  GStartPlotData_startPlot_data_channelData,
  GStartPlotReq,
  GStartPlotVars,
  GStreamDataData,
  GStreamDataData_acceleratorData,
  GStreamDataData_acceleratorData_data,
  GStreamDataData_acceleratorData_data_result__asScalar,
  GStreamDataData_acceleratorData_data_result__asStatusReply,
  GStreamDataData_acceleratorData_data_result__base,
  GStreamDataReq,
  GStreamDataVars,
  GXformAvgExpr,
  GXformDeviceExpr,
  GXformExpr,
  GXformRequest,
])
final Serializers serializers = _serializersBuilder.build();
