// Declare an exception type that's specific to the ACSys API.

library service;

import "package:flutter_controls_core/src/device_values.dart";

import 'package:built_collection/built_collection.dart';

import "package:gql_websocket_link/gql_websocket_link.dart";
import 'package:gql_http_link/gql_http_link.dart';
import 'package:ferry/ferry.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'package:flutter_controls_core/service/acsys/schema/__generated__/DPM.schema.gql.dart';
import 'package:flutter_controls_core/service/acsys/schema/__generated__/get_device_info.req.gql.dart';
import 'package:flutter_controls_core/service/acsys/schema/__generated__/get_device_info.data.gql.dart';
import 'package:flutter_controls_core/service/acsys/schema/__generated__/set_device.req.gql.dart';
import 'package:flutter_controls_core/service/acsys/schema/__generated__/stream_data.data.gql.dart';
import 'package:flutter_controls_core/service/acsys/schema/__generated__/stream_data.req.gql.dart';
import 'package:flutter_controls_core/service/acsys/schema/__generated__/stream_data.var.gql.dart';

import 'dart:developer' as developer;

abstract class ACSysException implements Exception {
  final String message;

  const ACSysException(this.message);

  @override
  String toString() => message;
}

class ACSysInvArgException extends ACSysException {
  ACSysInvArgException(String message) : super("InvArg: $message");
}

class ACSysTypeException extends ACSysException {
  ACSysTypeException(String message) : super("Type: $message");
}

class ACSysGraphQLException extends ACSysException {
  ACSysGraphQLException(String message) : super("GraphQL: $message");
}

// The classes in this section are used to return results from the queries /
// subscriptions. The generated classes have unusual names and have nested
// structure. We'd rather present a simpler result type. This also protects us
// from API changes; hopefully we won't have to change these result classes
// much, if at all.

class DeviceInfoAnalogAlarm {
  final String nominal;
  final String tolerance;
  final String min;
  final String max;

  const DeviceInfoAnalogAlarm(
      {required this.nominal,
      required this.tolerance,
      required this.min,
      required this.max});
}

class DeviceInfoProperty {
  final String? commonUnits;
  final String? primaryUnits;

  const DeviceInfoProperty({this.commonUnits, this.primaryUnits});
}

class BasicStatusProperty {
  final String character0;
  final StatusColor color0;
  final String character1;
  final StatusColor color1;

  const BasicStatusProperty(
      {required this.character0,
      required this.color0,
      required this.character1,
      required this.color1});
}

class DeviceInfoBasicStatus {
  final BasicStatusProperty? onOffProperty;
  final BasicStatusProperty? readyTrippedProperty;
  final BasicStatusProperty? remoteLocalProperty;
  final BasicStatusProperty? positiveNegativeProperty;

  const DeviceInfoBasicStatus(
      {this.onOffProperty,
      this.readyTrippedProperty,
      this.remoteLocalProperty,
      this.positiveNegativeProperty});
}

class DeviceInfoDigitalControl {
  final int value;
  final String shortName;
  final String longName;

  const DeviceInfoDigitalControl(
      {required this.value, required this.shortName, required this.longName});
}

class DeviceInfo {
  final int di;
  final String name;
  final String description;
  final DeviceInfoProperty? reading;
  final DeviceInfoProperty? setting;
  final DeviceInfoAnalogAlarm? alarm;
  final DeviceInfoBasicStatus? basicStatus;
  final List<DeviceInfoDigitalControl> digControl;

  const DeviceInfo(
      {required this.di,
      required this.name,
      required this.description,
      this.reading,
      this.setting,
      this.alarm,
      this.basicStatus,
      this.digControl = const []});
}

class Reading {
  final int refId;
  final int status;
  final int cycle;
  final DateTime timestamp;
  final double? value;
  final String? rawValue;
  final double? primaryValue;

  const Reading(
      {required this.refId,
      this.status = 0,
      required this.cycle,
      required this.timestamp,
      this.value,
      this.rawValue,
      this.primaryValue});
}

enum StatusColor { black, blue, green, cyan, red, magenta, yellow, white }

class BasicStatusAttribute {
  final String character;
  final StatusColor color;

  const BasicStatusAttribute({required this.character, required this.color});
}

class ExtendedStatusAttribute {
  final String? description;
  final String value;
  final String? valueText;
  final StatusColor? color;

  const ExtendedStatusAttribute(
      {this.description, required this.value, this.valueText, this.color});
}

class DigitalStatus {
  final int refId;
  final int status;
  final int cycle;
  final DateTime timestamp;
  final BasicStatusAttribute? onOff;
  final BasicStatusAttribute? readyTripped;
  final BasicStatusAttribute? remoteLocal;
  final BasicStatusAttribute? positiveNegative;
  final List<ExtendedStatusAttribute>? extendedStatus;

  const DigitalStatus(
      {required this.refId,
      this.status = 0,
      required this.cycle,
      required this.timestamp,
      this.onOff,
      this.readyTripped,
      this.remoteLocal,
      this.positiveNegative,
      this.extendedStatus});
}

class SettingStatus {
  final int facilityCode;
  final int errorCode;

  const SettingStatus({required this.facilityCode, required this.errorCode});
}

abstract class ACSysServiceAPI {
  Future<List<DeviceInfo>> getDeviceInfo(List<String> devices);
  Stream<Reading> monitorDevices(List<String> drfs);
  Stream<Reading> monitorSettingProperty(List<String> drfs);
  Stream<DigitalStatus> monitorDigitalStatusDevices(List<String> drfs);
  Future<SettingStatus> submit(
      {required String forDRF, required DeviceValue newSetting});
  Future<SettingStatus> sendCommand(
      {required String toDRF, required String value});
}

// This class provides an interface to Fermi's DPM API via GraphQL. This widget
// should be placed near the top of your widget tree. Widgets further down can
// access this object by calling `DpmService.of(context)`.

class ACSysService implements ACSysServiceAPI {
  final Client _q;
  final Client _s;

  // Constructor. This creates the HTTP links needed to communicate with our
  // GraphQL endpoints.

  ACSysService()
      : _q = Client(
          link: HttpLink(
            Uri(
              scheme: "https",
              host: "acsys-proxy.fnal.gov",
              port: 8000,
              path: "/acsys",
            ).toString(),
          ),
          cache: Cache(),
        ),
        _s = Client(
          link: WebSocketLink(null,
              channelGenerator: () => WebSocketChannel.connect(
                    Uri(
                      scheme: "wss",
                      host: "acsys-proxy.fnal.gov",
                      port: 8000,
                      path: "/acsys",
                    ),
                    protocols: ["graphql-ws"],
                  ),
              reconnectInterval: const Duration(seconds: 1)),
          cache: Cache(),
        );

  // Common code needed to do RPCs. The caller sends in a protobuf request and,
  // optionally, a function to translate the protobuf reply into some other data
  // type.

  Future<Result> _rpc<TData, TVars, Result>(OperationRequest<TData, TVars> req,
          {Result Function(TData)? xlat}) =>
      _q
          .request(req)
          .where((response) => !response.loading)
          .first
          .then((value) {
        if (value.hasErrors) {
          throw Exception(value.graphqlErrors);
        } else {
          final data = value.data;

          if (data != null) {
            return xlat != null ? xlat(data) : data as Result;
          } else {
            throw Exception("no data was returned from request");
          }
        }
      });

  // Returns information about devices. The caller provides a list of device
  // names and will receive a list of `DeviceInfo` objects. The order of the
  // results in the returned list correspond to the order of the devices in the
  // source list.
  @override
  Future<List<DeviceInfo>> getDeviceInfo(List<String> devices) async {
    if (devices.isNotEmpty) {
      final req =
          GGetDeviceInfoReq((b) => b..vars.names = ListBuilder(devices));

      return _rpc(req,
          xlat: (GGetDeviceInfoData data) =>
              data.deviceInfo.result.map(_convertToDevInfo).toList());
    } else {
      throw ACSysInvArgException("empty device list");
    }
  }

  // Private conversion method to convert an obnoxiously named, nested class
  // into our nicer, flatter one. Used by `getDeviceInfo()`.

  static DeviceInfo _convertToDevInfo(GGetDeviceInfoData_deviceInfo_result e) {
    if (e is GGetDeviceInfoData_deviceInfo_result__asDeviceInfo) {
      final DeviceInfoProperty? rProp = e.reading != null
          ? DeviceInfoProperty(
              primaryUnits: e.reading!.primaryUnits,
              commonUnits: e.reading!.commonUnits)
          : null;
      final DeviceInfoProperty? sProp = e.setting != null
          ? DeviceInfoProperty(
              primaryUnits: e.setting!.primaryUnits,
              commonUnits: e.setting!.commonUnits)
          : null;

      return DeviceInfo(
        di: 0,
        name: "",
        description: e.description,
        reading: rProp,
        setting: sProp,
      );
    } else {
      if (e is GGetDeviceInfoData_deviceInfo_result__asErrorReply) {
        throw UnimplementedError("getDeviceInfo returned an error");
      } else {
        throw UnimplementedError("getDeviceInfo unexpected response");
      }
    }
  }

  // Returns a stream of readings for the devices specified in the parameter
  // list. The `Reading` class has a `refId` field which indicates to which
  // device in the passed array the current reading belongs. If `value` is null,
  // the `status` field will hold the ACNET error status. No more readings will
  // be sent for a device in error.
  @override
  Stream<Reading> monitorDevices(List<String> drfs) {
    final req = GStreamDataReq((b) => b..vars.drfs = ListBuilder(drfs));

    return _s
        .request(req)
        .handleError((error) =>
            developer.log("error: $error", name: "gql.monitorDevices"))
        .where((event) => !event.loading)
        .map(_convertToReading);
  }

  // Convert the incoming GraphQL messages into `Reading` objects.

  static Reading _convertToReading(
      OperationResponse<GStreamDataData, GStreamDataVars> e) {
    // If the packet doesn't have GraphQL errors, then we can process the
    // payload.

    if (!e.hasErrors) {
      final GStreamDataData_acceleratorData data = e.data!.acceleratorData;
      final GStreamDataData_acceleratorData_data_result result =
          data.data.result;

      // If the result has a scalar value, return a `Reading` with the value.

      if (result is GStreamDataData_acceleratorData_data_result__asScalar) {
        return Reading(
            refId: data.refId,
            cycle: data.cycle,
            timestamp: data.data.timestamp,
            value: result.scalarValue);
      }

      // If the result is a status, then the value is `null` and we save the
      // status code.

      if (result
          is GStreamDataData_acceleratorData_data_result__asStatusReply) {
        return Reading(
            refId: data.refId,
            cycle: data.cycle,
            timestamp: data.data.timestamp,
            status: result.status);
      }

      // We are only supporting a single, scalar value for the moment. Any types
      // we don't yet support will report an error and tear down the stream.

      throw ACSysTypeException("can't handle ${result.G__typename} types");
    } else {
      throw ACSysGraphQLException(e.graphqlErrors.toString());
    }
  }

  @override
  Stream<DigitalStatus> monitorDigitalStatusDevices(List<String> drfs) {
    return const Stream<DigitalStatus>.empty();
  }

  @override
  Stream<Reading> monitorSettingProperty(List<String> drfs) =>
      monitorDevices(drfs);

  // Performs a setting request. `forDRF` is the DRF string representing the
  // target device and property to receive the setting. `newSetting` is the
  // value of the setting. The future this function returns will resolve to the
  // status of the setting.

  @override
  Future<SettingStatus> submit(
      {required String forDRF, required DeviceValue newSetting}) {
    // Define a nested function which converts the GraphQL reply into a
    // SettingStatus.

    xlat(e) => SettingStatus(
        facilityCode: e.setDevice.status ~/ 256,
        errorCode: e.setDevice.status & 255);

    // Build the request.

    final req = GSetDeviceReq((b) => b
      ..vars.device = forDRF
      ..vars.value = newSetting._toGDevValue());

    return _rpc(req, xlat: xlat);
  }

  @override
  Future<SettingStatus> sendCommand(
          {required String toDRF, required String value}) =>
      submit(forDRF: toDRF, newSetting: DevText(value));
}

// And an extension to the DevValue hierarchy which translates a value into a
// GraphQL `GDevValue` type. No other code needs to be exposed to this
// interface, so we only make the extension visible in this module.

extension on DeviceValue {
  GDevValueBuilder _toGDevValue() {
    return switch (this) {
      DevRaw(value: var v) => GDevValueBuilder()..rawVal = ListBuilder(v),
      DevScalar(value: var v) => GDevValueBuilder()..scalarVal = v,
      DevScalarArray(value: var v) => GDevValueBuilder()
        ..scalarArrayVal = ListBuilder(v),
      DevText(value: var v) => GDevValueBuilder()..textVal = v,
      DevTextArray(value: var v) => GDevValueBuilder()
        ..textArrayVal = ListBuilder(v)
    };
  }
}
