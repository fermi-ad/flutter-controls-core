// Declare an exception type that's specific to the ACSys API.

library service;

import "package:flutter_controls_core/src/status.dart";
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

import 'dart:developer' as dev;

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
  final double minVal;
  final double maxVal;
  final String? commonUnits;
  final int commonIndex;
  final List<double> commonCoeff;
  final String? primaryUnits;
  final int primaryIndex;

  const DeviceInfoProperty(
      {required this.minVal,
      required this.maxVal,
      this.commonUnits,
      required this.commonIndex,
      required this.commonCoeff,
      this.primaryUnits,
      required this.primaryIndex});
}

class KnobbingInfo {
  final double minVal;
  final double maxVal;
  final double step;

  const KnobbingInfo(
      {required this.minVal, required this.maxVal, required this.step});
}

class BasicStatusProperty {
  final int maskVal;
  final int matchVal;
  final bool invert;
  final String character0;
  final StatusColor color0;
  final String character1;
  final StatusColor color1;

  const BasicStatusProperty(
      {required this.maskVal,
      required this.matchVal,
      required this.invert,
      required this.character0,
      required this.color0,
      required this.character1,
      required this.color1});

  BasicStatusAttribute getState(int value) =>
      ((invert ? ~value : value) & maskVal) == matchVal
          ? BasicStatusAttribute(character: character1, color: color1)
          : BasicStatusAttribute(character: character0, color: color0);
}

/// Holds one item of a device's extended basic status.
///
/// A device can have "extended status" information associated with it. This
/// appears as a list of these entries. It defines which bit in the status,
/// [bitNo], is being defined. Each entry has a [description] which indicates
/// the use of the bit; a color and descriptive name for when the bit is 0
/// ([color0], [name0]); and a color and name for when it's 1 ([color1],
/// [name1]).

class ExtendedBasicStatusEntry {
  final int bitNo;
  final String description;
  final int color0;
  final String name0;
  final int color1;
  final String name1;

  const ExtendedBasicStatusEntry(
      {required this.bitNo,
      required this.description,
      required this.color0,
      required this.name0,
      required this.color1,
      required this.name1});

  ExtendedStatusAttribute getState(int value) => (value & (1 << bitNo)) != 0
      ? ExtendedStatusAttribute(
          description: description,
          value: 1,
          color: _toColor(color1),
          valueText: name1)
      : ExtendedStatusAttribute(
          description: description,
          value: 0,
          color: _toColor(color0),
          valueText: name0);
}

class DeviceInfoBasicStatus {
  final BasicStatusProperty? onOffProperty;
  final BasicStatusProperty? readyTrippedProperty;
  final BasicStatusProperty? remoteLocalProperty;
  final BasicStatusProperty? positiveNegativeProperty;
  final List<ExtendedBasicStatusEntry> extendedBasicStatus;

  const DeviceInfoBasicStatus(
      {this.onOffProperty,
      this.readyTrippedProperty,
      this.remoteLocalProperty,
      this.positiveNegativeProperty,
      this.extendedBasicStatus = const []});
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
  final (DeviceInfoProperty, KnobbingInfo)? setting;
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
  final Status status;
  final int cycle;
  final DateTime timestamp;
  final double? value;
  final String? rawValue;
  final double? primaryValue;

  const Reading(
      {required this.refId,
      this.status = Status.okay,
      required this.cycle,
      required this.timestamp,
      this.value,
      this.rawValue,
      this.primaryValue});
}

/// Enumeration representing console colors.
///
/// These colors are the set of 8 colors used in the legacy console environment.
/// Our early Flutter applications try to maintain the look and feel, so we
/// are supporting these values. Hopefully this enumeration, and all dependent
/// code, will get deprecated and -- eventually -- removed.

enum StatusColor { black, blue, green, cyan, red, magenta, yellow, white }

// Local function that converts an integer value into a `StatusColor`. Any
// out-of-range values are converted to `white`.

StatusColor _toColor(int value) => switch (value) {
      0 => StatusColor.black,
      1 => StatusColor.blue,
      2 => StatusColor.green,
      3 => StatusColor.cyan,
      4 => StatusColor.red,
      5 => StatusColor.magenta,
      6 => StatusColor.yellow,
      _ => StatusColor.white
    };

class BasicStatusAttribute {
  final String character;
  final StatusColor color;

  const BasicStatusAttribute({required this.character, required this.color});
}

class ExtendedStatusAttribute {
  final String? description;
  final int value;
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

/// Defines the API for the GraphQL interface.
///
/// The API is declared as an abstract class so that one could `implement` a
/// class for testing purposes.

abstract interface class ACSysServiceAPI {
  /// Takes a list of device names and returns a list of information associated
  /// with the devices. The information will be in the same order as the devices
  /// in the request.
  Future<List<DeviceInfo>> getDeviceInfo(List<String> devices);

  /// Takes a list of data acquisition strings and returns a stream that
  /// provides readings for the requests.
  Stream<Reading> monitorDevices(List<String> drfs);

  /// Takes a list of data acquisition strings and returns a stream that
  /// provides the setting value of the requests.
  Stream<Reading> monitorSettingProperty(List<String> drfs);

  /// Takes a list of data acquisition strings and returns a stream that
  /// provides up-to-date `DigitalStatus` values of the devices.
  Stream<DigitalStatus> monitorDigitalStatusDevices(List<String> devices);

  /// Takes a device name and a value and sends a request to apply the value to
  /// the device.
  Future<SettingStatus> submit(
      {required String forDRF, required DeviceValue newSetting});

  /// Takes a device name and a value and sends a request to apply the value to
  /// the device's digital control property.
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
          GgetDeviceInfoReq((b) => b..vars.devices = ListBuilder(devices));

      return _rpc(req,
          xlat: (GgetDeviceInfoData data) =>
              data.deviceInfo.result.map(_convertToDevInfo).toList());
    } else {
      throw ACSysInvArgException("empty device list");
    }
  }

  // Private conversion method to convert an obnoxiously named, nested class
  // into our nicer, flatter one. Used by `getDeviceInfo()`.

  static DeviceInfo _convertToDevInfo(GgetDeviceInfoData_deviceInfo_result e) {
    // Make sure we got a device info structure.

    if (e is GgetDeviceInfoData_deviceInfo_result__asDeviceInfo) {
      // Save off the reading and setting properties, if they exist.

      final DeviceInfoProperty? rProp = e.reading != null
          ? DeviceInfoProperty(
              minVal: e.reading!.minVal,
              maxVal: e.reading!.maxVal,
              primaryUnits: e.reading!.primaryUnits,
              primaryIndex: e.reading!.primaryIndex,
              commonUnits: e.reading!.commonUnits,
              commonIndex: e.reading!.commonIndex,
              commonCoeff: e.reading!.coeff.toList())
          : null;
      final (DeviceInfoProperty, KnobbingInfo)? sProp = e.setting != null
          ? (
              DeviceInfoProperty(
                  minVal: e.setting!.minVal,
                  maxVal: e.setting!.maxVal,
                  primaryUnits: e.setting!.primaryUnits,
                  primaryIndex: e.setting!.primaryIndex,
                  commonUnits: e.setting!.commonUnits,
                  commonIndex: e.setting!.commonIndex,
                  commonCoeff: e.setting!.coeff.toList()),
              KnobbingInfo(
                  minVal: e.setting!.knobInfo.minVal,
                  maxVal: e.setting!.knobInfo.maxVal,
                  step: e.setting!.knobInfo.step)
            )
          : null;

      // Create a spot to hold the basic status, if it exists.

      DeviceInfoBasicStatus? bs;

      // If the device has a basic status property, we need to accumulate the
      // information and then save it into `bs`.

      if (e.digStatus
          case GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_digStatus(
            entries: var data,
            extEntries: var extData
          )) {
        BasicStatusProperty? propOn;
        BasicStatusProperty? propReady;
        BasicStatusProperty? propRemote;
        BasicStatusProperty? propPositive;

        // Loop through the legacy basic status information.

        for (final (idx, item) in data.indexed) {
          // Convert the gRPC status info into our GraphQL representation.

          final prop = BasicStatusProperty(
              maskVal: item.maskVal,
              matchVal: item.matchVal,
              invert: item.invert,
              character0: item.falseChar,
              color0: _toColor(item.falseColor),
              character1: item.trueChar,
              color1: _toColor(item.trueColor));

          // The index of the attribute indicates to which legacy status it
          // applies.

          switch (idx) {
            case 0:
              propOn = prop;
            case 1:
              propReady = prop;
            case 2:
              propRemote = prop;
            case 3:
              propPositive = prop;
            default:
          }
        }

        // Create the final basic status value that will be included with the
        // device information.

        bs = DeviceInfoBasicStatus(
            onOffProperty: propOn,
            readyTrippedProperty: propReady,
            remoteLocalProperty: propRemote,
            positiveNegativeProperty: propPositive,
            extendedBasicStatus: extData
                .map((e) => ExtendedBasicStatusEntry(
                    bitNo: e.bitNo,
                    color0: e.color0,
                    name0: e.name0,
                    color1: e.color1,
                    name1: e.name1,
                    description: e.description))
                .toList());
      }

      // If the device has digital control, populate the list with the converted
      // values. These will get inserted into the final device info value.

      List<DeviceInfoDigitalControl> dc = [];

      if (e.digControl
          case GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_digControl(
            entries: var entries
          )) {
        dc = entries
            .map(
              (ii) => DeviceInfoDigitalControl(
                  value: ii.value,
                  shortName: ii.shortName,
                  longName: ii.longName),
            )
            .toList();
      }

      // Create the final, device info structure.

      return DeviceInfo(
          di: 0,
          name: "",
          description: e.description,
          reading: rProp,
          setting: sProp,
          basicStatus: bs,
          digControl: dc);
    } else {
      if (e is GgetDeviceInfoData_deviceInfo_result__asErrorReply) {
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
        .handleError(
            (error) => dev.log("error: $error", name: "gql.monitorDevices"))
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
            status: Status.fromInt(result.status));
      }

      // TODO: We are only supporting a single, scalar value for the moment. Any
      // types we don't yet support will report an error and tear down the
      // stream.

      throw ACSysTypeException("can't handle ${result.G__typename} types");
    } else {
      throw ACSysGraphQLException(e.graphqlErrors.toString());
    }
  }

  @override
  Stream<DigitalStatus> monitorDigitalStatusDevices(
      List<String> devices) async* {
    // Get device information for the list of devices. We need to use this
    // information to 1) make sure the device actually has a basic status
    // property and, 2) build a translation table for when values come in.

    final devInfo = await getDeviceInfo(devices);

    // Build up the translation table by iterating through the list of results.
    // If the device has the status property, add it to the table. Otherwise
    // return an error to the requestor. We're only going to send valid devices
    // to DPM.
    //
    // Also build up a list of DRF strings that represent the basic status of
    // the devices.
    //
    // TODO: This code only works with ACNET devices. We need to implement EPICS
    // support, too.

    final List<(int, DeviceInfoBasicStatus)> table = [];
    final List<String> drf = [];

    for (final (idx, item) in devInfo.indexed) {
      if (item.basicStatus != null) {
        table.add((idx, item.basicStatus!));

        // TODO: Need to add the device name to the gRPC reply type.

        drf.add("${devices[idx]}.STATUS.BIT_VALUE");
      } else {
        yield DigitalStatus(
            refId: idx,
            cycle: 0,
            timestamp: DateTime.now(),
            status: Status.noProperty.code);
      }
    }

    // Now set up a monitor for the list of devices and stream the results back.

    final strm = monitorDevices(drf);

    yield* strm.map((rdg) {
      final (refId, bs) = table[rdg.refId];
      final statusVal = (rdg.value ?? 0.0).toInt();

      return DigitalStatus(
          status: rdg.status.code,
          refId: refId,
          cycle: rdg.cycle,
          timestamp: rdg.timestamp,
          onOff: bs.onOffProperty?.getState(statusVal),
          readyTripped: bs.readyTrippedProperty?.getState(statusVal),
          remoteLocal: bs.remoteLocalProperty?.getState(statusVal),
          positiveNegative: bs.positiveNegativeProperty?.getState(statusVal),
          extendedStatus: bs.extendedBasicStatus
              .map((item) => item.getState(statusVal))
              .toList());
    });
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
