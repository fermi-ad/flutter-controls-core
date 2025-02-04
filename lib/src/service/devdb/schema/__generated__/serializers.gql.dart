// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart' show StandardJsonPlugin;
import 'package:ferry_exec/ferry_exec.dart';
import 'package:flutter_controls_core/src/service/date_serializer.dart'
    show DateSerializer;
import 'package:flutter_controls_core/src/service/devdb/schema/__generated__/get_device_info.data.gql.dart'
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
import 'package:flutter_controls_core/src/service/devdb/schema/__generated__/get_device_info.req.gql.dart'
    show GDevicePropertyFieldsReq, GgetDeviceInfoReq;
import 'package:flutter_controls_core/src/service/devdb/schema/__generated__/get_device_info.var.gql.dart'
    show GDevicePropertyFieldsVars, GgetDeviceInfoVars;
import 'package:gql_code_builder_serializers/gql_code_builder_serializers.dart'
    show OperationSerializer;

part 'serializers.gql.g.dart';

final SerializersBuilder _serializersBuilder = _$serializers.toBuilder()
  ..add(OperationSerializer())
  ..add(DateSerializer())
  ..add(GgetDeviceInfoData_deviceInfo_result.serializer)
  ..addPlugin(StandardJsonPlugin());
@SerializersFor([
  GDevicePropertyFieldsData,
  GDevicePropertyFieldsReq,
  GDevicePropertyFieldsVars,
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
