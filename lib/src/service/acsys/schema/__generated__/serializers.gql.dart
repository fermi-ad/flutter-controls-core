// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart' show StandardJsonPlugin;
import 'package:ferry_exec/ferry_exec.dart';
import 'package:flutter_controls_core/src/service/acsys/schema/__generated__/DPM.schema.gql.dart'
    show GDevValue, GTimeSeriesEntryIn;
import 'package:flutter_controls_core/src/service/acsys/schema/__generated__/plot_configs.data.gql.dart'
    show GPlotConfigsData;
import 'package:flutter_controls_core/src/service/acsys/schema/__generated__/plot_configs.req.gql.dart'
    show GPlotConfigsReq;
import 'package:flutter_controls_core/src/service/acsys/schema/__generated__/plot_configs.var.gql.dart'
    show GPlotConfigsVars;
import 'package:flutter_controls_core/src/service/acsys/schema/__generated__/read_alarms.data.gql.dart'
    show GAlarmsSnapshotData, GAlarmsSnapshotData_alarmsSnapshot;
import 'package:flutter_controls_core/src/service/acsys/schema/__generated__/read_alarms.req.gql.dart'
    show GAlarmsSnapshotReq;
import 'package:flutter_controls_core/src/service/acsys/schema/__generated__/read_alarms.var.gql.dart'
    show GAlarmsSnapshotVars;
import 'package:flutter_controls_core/src/service/acsys/schema/__generated__/read_devices.data.gql.dart'
    show
        GReadDevicesData_acceleratorData_data_result,
        GReadDevicesData,
        GReadDevicesData_acceleratorData,
        GReadDevicesData_acceleratorData_data,
        GReadDevicesData_acceleratorData_data_result__asScalar,
        GReadDevicesData_acceleratorData_data_result__asScalarArray,
        GReadDevicesData_acceleratorData_data_result__asStatusReply,
        GReadDevicesData_acceleratorData_data_result__asText,
        GReadDevicesData_acceleratorData_data_result__asTextArray,
        GReadDevicesData_acceleratorData_data_result__base;
import 'package:flutter_controls_core/src/service/acsys/schema/__generated__/read_devices.req.gql.dart'
    show GReadDevicesReq;
import 'package:flutter_controls_core/src/service/acsys/schema/__generated__/read_devices.var.gql.dart'
    show GReadDevicesVars;
import 'package:flutter_controls_core/src/service/acsys/schema/__generated__/remove_plot_config.data.gql.dart'
    show GDeletePlotConfigData, GDeletePlotConfigData_deletePlotConfiguration;
import 'package:flutter_controls_core/src/service/acsys/schema/__generated__/remove_plot_config.req.gql.dart'
    show GDeletePlotConfigReq;
import 'package:flutter_controls_core/src/service/acsys/schema/__generated__/remove_plot_config.var.gql.dart'
    show GDeletePlotConfigVars;
import 'package:flutter_controls_core/src/service/acsys/schema/__generated__/set_device.data.gql.dart'
    show GSetDeviceData, GSetDeviceData_setDevice;
import 'package:flutter_controls_core/src/service/acsys/schema/__generated__/set_device.req.gql.dart'
    show GSetDeviceReq;
import 'package:flutter_controls_core/src/service/acsys/schema/__generated__/set_device.var.gql.dart'
    show GSetDeviceVars;
import 'package:flutter_controls_core/src/service/acsys/schema/__generated__/set_users_config.data.gql.dart'
    show GSetUsersConfigData, GSetUsersConfigData_usersConfiguration;
import 'package:flutter_controls_core/src/service/acsys/schema/__generated__/set_users_config.req.gql.dart'
    show GSetUsersConfigReq;
import 'package:flutter_controls_core/src/service/acsys/schema/__generated__/set_users_config.var.gql.dart'
    show GSetUsersConfigVars;
import 'package:flutter_controls_core/src/service/acsys/schema/__generated__/start_plot.data.gql.dart'
    show
        GStartPlotData_startPlot_data_channelData_result,
        GStartPlotData,
        GStartPlotData_startPlot,
        GStartPlotData_startPlot_data,
        GStartPlotData_startPlot_data_channelData,
        GStartPlotData_startPlot_data_channelData_result__asScalar,
        GStartPlotData_startPlot_data_channelData_result__asScalarArray,
        GStartPlotData_startPlot_data_channelData_result__base;
import 'package:flutter_controls_core/src/service/acsys/schema/__generated__/start_plot.req.gql.dart'
    show GStartPlotReq;
import 'package:flutter_controls_core/src/service/acsys/schema/__generated__/start_plot.var.gql.dart'
    show GStartPlotVars;
import 'package:flutter_controls_core/src/service/acsys/schema/__generated__/stream_alarms.data.gql.dart'
    show GStreamAlarmsData, GStreamAlarmsData_alarms;
import 'package:flutter_controls_core/src/service/acsys/schema/__generated__/stream_alarms.req.gql.dart'
    show GStreamAlarmsReq;
import 'package:flutter_controls_core/src/service/acsys/schema/__generated__/stream_alarms.var.gql.dart'
    show GStreamAlarmsVars;
import 'package:flutter_controls_core/src/service/acsys/schema/__generated__/stream_data.data.gql.dart'
    show
        GStreamDataData_acceleratorData_data_result,
        GStreamDataData,
        GStreamDataData_acceleratorData,
        GStreamDataData_acceleratorData_data,
        GStreamDataData_acceleratorData_data_result__asScalar,
        GStreamDataData_acceleratorData_data_result__asScalarArray,
        GStreamDataData_acceleratorData_data_result__asStatusReply,
        GStreamDataData_acceleratorData_data_result__asText,
        GStreamDataData_acceleratorData_data_result__asTextArray,
        GStreamDataData_acceleratorData_data_result__base;
import 'package:flutter_controls_core/src/service/acsys/schema/__generated__/stream_data.req.gql.dart'
    show GStreamDataReq;
import 'package:flutter_controls_core/src/service/acsys/schema/__generated__/stream_data.var.gql.dart'
    show GStreamDataVars;
import 'package:flutter_controls_core/src/service/acsys/schema/__generated__/update_plot_config.data.gql.dart'
    show GUpdatePlotConfigData;
import 'package:flutter_controls_core/src/service/acsys/schema/__generated__/update_plot_config.req.gql.dart'
    show GUpdatePlotConfigReq;
import 'package:flutter_controls_core/src/service/acsys/schema/__generated__/update_plot_config.var.gql.dart'
    show GUpdatePlotConfigVars;
import 'package:flutter_controls_core/src/service/acsys/schema/__generated__/users_last_config.data.gql.dart'
    show GUsersLastConfigData;
import 'package:flutter_controls_core/src/service/acsys/schema/__generated__/users_last_config.req.gql.dart'
    show GUsersLastConfigReq;
import 'package:flutter_controls_core/src/service/acsys/schema/__generated__/users_last_config.var.gql.dart'
    show GUsersLastConfigVars;
import 'package:flutter_controls_core/src/service/date_serializer.dart'
    show DateSerializer;
import 'package:gql_code_builder_serializers/gql_code_builder_serializers.dart'
    show OperationSerializer;

part 'serializers.gql.g.dart';

final SerializersBuilder _serializersBuilder =
    _$serializers.toBuilder()
      ..add(OperationSerializer())
      ..add(DateSerializer())
      ..add(GReadDevicesData_acceleratorData_data_result.serializer)
      ..add(GStartPlotData_startPlot_data_channelData_result.serializer)
      ..add(GStreamDataData_acceleratorData_data_result.serializer)
      ..addPlugin(StandardJsonPlugin());
@SerializersFor([
  GAlarmsSnapshotData,
  GAlarmsSnapshotData_alarmsSnapshot,
  GAlarmsSnapshotReq,
  GAlarmsSnapshotVars,
  GDeletePlotConfigData,
  GDeletePlotConfigData_deletePlotConfiguration,
  GDeletePlotConfigReq,
  GDeletePlotConfigVars,
  GDevValue,
  GPlotConfigsData,
  GPlotConfigsReq,
  GPlotConfigsVars,
  GReadDevicesData,
  GReadDevicesData_acceleratorData,
  GReadDevicesData_acceleratorData_data,
  GReadDevicesData_acceleratorData_data_result__asScalar,
  GReadDevicesData_acceleratorData_data_result__asScalarArray,
  GReadDevicesData_acceleratorData_data_result__asStatusReply,
  GReadDevicesData_acceleratorData_data_result__asText,
  GReadDevicesData_acceleratorData_data_result__asTextArray,
  GReadDevicesData_acceleratorData_data_result__base,
  GReadDevicesReq,
  GReadDevicesVars,
  GSetDeviceData,
  GSetDeviceData_setDevice,
  GSetDeviceReq,
  GSetDeviceVars,
  GSetUsersConfigData,
  GSetUsersConfigData_usersConfiguration,
  GSetUsersConfigReq,
  GSetUsersConfigVars,
  GStartPlotData,
  GStartPlotData_startPlot,
  GStartPlotData_startPlot_data,
  GStartPlotData_startPlot_data_channelData,
  GStartPlotData_startPlot_data_channelData_result__asScalar,
  GStartPlotData_startPlot_data_channelData_result__asScalarArray,
  GStartPlotData_startPlot_data_channelData_result__base,
  GStartPlotReq,
  GStartPlotVars,
  GStreamAlarmsData,
  GStreamAlarmsData_alarms,
  GStreamAlarmsReq,
  GStreamAlarmsVars,
  GStreamDataData,
  GStreamDataData_acceleratorData,
  GStreamDataData_acceleratorData_data,
  GStreamDataData_acceleratorData_data_result__asScalar,
  GStreamDataData_acceleratorData_data_result__asScalarArray,
  GStreamDataData_acceleratorData_data_result__asStatusReply,
  GStreamDataData_acceleratorData_data_result__asText,
  GStreamDataData_acceleratorData_data_result__asTextArray,
  GStreamDataData_acceleratorData_data_result__base,
  GStreamDataReq,
  GStreamDataVars,
  GTimeSeriesEntryIn,
  GUpdatePlotConfigData,
  GUpdatePlotConfigReq,
  GUpdatePlotConfigVars,
  GUsersLastConfigData,
  GUsersLastConfigReq,
  GUsersLastConfigVars,
])
final Serializers serializers = _serializersBuilder.build();
