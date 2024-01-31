// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart' show StandardJsonPlugin;
import 'package:ferry_exec/ferry_exec.dart';
import 'package:flutter_controls_core/service/acsys/schema/__generated__/DPM.schema.gql.dart'
    show GDateTime, GDevValue;
import 'package:flutter_controls_core/service/acsys/schema/__generated__/get_device_info.data.gql.dart'
    show
        GgetDeviceInfoData_deviceInfo_result,
        GDevicePropertyFieldsData,
        GgetDeviceInfoData,
        GgetDeviceInfoData_deviceInfo,
        GgetDeviceInfoData_deviceInfo_result__asDeviceInfo,
        GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_digControl,
        GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_digControl_entries,
        GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus,
        GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_entries,
        GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_extEntries,
        GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_reading,
        GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_setting,
        GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_setting_knobInfo,
        GgetDeviceInfoData_deviceInfo_result__asErrorReply,
        GgetDeviceInfoData_deviceInfo_result__base;
import 'package:flutter_controls_core/service/acsys/schema/__generated__/get_device_info.req.gql.dart'
    show GDevicePropertyFieldsReq, GgetDeviceInfoReq;
import 'package:flutter_controls_core/service/acsys/schema/__generated__/get_device_info.var.gql.dart'
    show GDevicePropertyFieldsVars, GgetDeviceInfoVars;
import 'package:flutter_controls_core/service/acsys/schema/__generated__/set_device.data.gql.dart'
    show GSetDeviceData, GSetDeviceData_setDevice;
import 'package:flutter_controls_core/service/acsys/schema/__generated__/set_device.req.gql.dart'
    show GSetDeviceReq;
import 'package:flutter_controls_core/service/acsys/schema/__generated__/set_device.var.gql.dart'
    show GSetDeviceVars;
import 'package:flutter_controls_core/service/acsys/schema/__generated__/stream_data.data.gql.dart'
    show
        GStreamDataData_acceleratorData_data_result,
        GStreamDataData,
        GStreamDataData_acceleratorData,
        GStreamDataData_acceleratorData_data,
        GStreamDataData_acceleratorData_data_result__asScalar,
        GStreamDataData_acceleratorData_data_result__asStatusReply,
        GStreamDataData_acceleratorData_data_result__base;
import 'package:flutter_controls_core/service/acsys/schema/__generated__/stream_data.req.gql.dart'
    show GStreamDataReq;
import 'package:flutter_controls_core/service/acsys/schema/__generated__/stream_data.var.gql.dart'
    show GStreamDataVars;
import 'package:flutter_controls_core/service/acsys/schema/date_serializer.dart'
    show DateSerializer;
import 'package:gql_code_builder/src/serializers/operation_serializer.dart'
    show OperationSerializer;

part 'serializers.gql.g.dart';

final SerializersBuilder _serializersBuilder = _$serializers.toBuilder()
  ..add(OperationSerializer())
  ..add(DateSerializer())
  ..add(GStreamDataData_acceleratorData_data_result.serializer)
  ..add(GgetDeviceInfoData_deviceInfo_result.serializer)
  ..addPlugin(StandardJsonPlugin());
@SerializersFor([
  GDateTime,
  GDevValue,
  GDevicePropertyFieldsData,
  GDevicePropertyFieldsReq,
  GDevicePropertyFieldsVars,
  GSetDeviceData,
  GSetDeviceData_setDevice,
  GSetDeviceReq,
  GSetDeviceVars,
  GStreamDataData,
  GStreamDataData_acceleratorData,
  GStreamDataData_acceleratorData_data,
  GStreamDataData_acceleratorData_data_result__asScalar,
  GStreamDataData_acceleratorData_data_result__asStatusReply,
  GStreamDataData_acceleratorData_data_result__base,
  GStreamDataReq,
  GStreamDataVars,
  GgetDeviceInfoData,
  GgetDeviceInfoData_deviceInfo,
  GgetDeviceInfoData_deviceInfo_result__asDeviceInfo,
  GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_digControl,
  GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_digControl_entries,
  GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus,
  GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_entries,
  GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus_extEntries,
  GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_reading,
  GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_setting,
  GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_setting_knobInfo,
  GgetDeviceInfoData_deviceInfo_result__asErrorReply,
  GgetDeviceInfoData_deviceInfo_result__base,
  GgetDeviceInfoReq,
  GgetDeviceInfoVars,
])
final Serializers serializers = _serializersBuilder.build();
