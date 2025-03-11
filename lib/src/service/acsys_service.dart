/// {@category Data Acquisition}
library;

import 'package:flutter/material.dart';
import 'package:flutter_controls_core/flutter_controls_core.dart';

import 'package:built_collection/built_collection.dart';

import 'package:ferry/ferry.dart';
import 'package:gql_http_link/gql_http_link.dart';
import "package:gql_websocket_link/gql_websocket_link.dart";
import 'package:web_socket_channel/web_socket_channel.dart';

import 'package:flutter_controls_core/src/service/acsys/schema/__generated__/DPM.schema.gql.dart';
import 'package:flutter_controls_core/src/service/acsys/schema/__generated__/set_device.req.gql.dart';
import 'package:flutter_controls_core/src/service/acsys/schema/__generated__/stream_data.data.gql.dart'
    as sd_data;
import 'package:flutter_controls_core/src/service/acsys/schema/__generated__/stream_data.req.gql.dart'
    as sd_req;
import 'package:flutter_controls_core/src/service/acsys/schema/__generated__/stream_data.var.gql.dart'
    as sd_var;
import 'package:flutter_controls_core/src/service/acsys/schema/__generated__/start_plot.data.gql.dart';
import 'package:flutter_controls_core/src/service/acsys/schema/__generated__/start_plot.req.gql.dart';
import 'package:flutter_controls_core/src/service/acsys/schema/__generated__/plot_configs.data.gql.dart';
import 'package:flutter_controls_core/src/service/acsys/schema/__generated__/plot_configs.req.gql.dart';
import 'package:flutter_controls_core/src/service/acsys/schema/__generated__/read_devices.data.gql.dart'
    as rd_data;
import 'package:flutter_controls_core/src/service/acsys/schema/__generated__/read_devices.req.gql.dart'
    as rd_req;
import 'package:flutter_controls_core/src/service/acsys/schema/__generated__/remove_plot_config.data.gql.dart';
import 'package:flutter_controls_core/src/service/acsys/schema/__generated__/remove_plot_config.req.gql.dart';
import 'package:flutter_controls_core/src/service/acsys/schema/__generated__/update_plot_config.data.gql.dart';
import 'package:flutter_controls_core/src/service/acsys/schema/__generated__/update_plot_config.req.gql.dart';
import 'package:flutter_controls_core/src/service/acsys/schema/__generated__/users_last_config.data.gql.dart';
import 'package:flutter_controls_core/src/service/acsys/schema/__generated__/users_last_config.req.gql.dart';
import 'package:flutter_controls_core/src/service/acsys/schema/__generated__/set_users_config.data.gql.dart';
import 'package:flutter_controls_core/src/service/acsys/schema/__generated__/set_users_config.req.gql.dart';

import 'package:flutter_controls_core/src/service/devdb/schema/__generated__/get_device_info.req.gql.dart';
import 'package:flutter_controls_core/src/service/devdb/schema/__generated__/get_device_info.data.gql.dart';

import 'dart:developer' as dev;

// Declare an exception type that's specific to the ACSys API.

abstract class ACSysException implements Exception {
  final String message;

  const ACSysException(this.message);

  @override
  String toString() => message;
}

class ACSysInvArgException extends ACSysException {
  const ACSysInvArgException(String message) : super("InvArg: $message");
}

class ACSysTypeException extends ACSysException {
  const ACSysTypeException(String message) : super("Type: $message");
}

class ACSysConfigurationException extends ACSysException {
  const ACSysConfigurationException(String message) : super("Config: $message");
}

class ACSysGraphQLException extends ACSysException {
  const ACSysGraphQLException(String message) : super("GraphQL: $message");
}

// The classes in this section are used to return results from the queries /
// subscriptions. The generated classes have unusual names and have nested
// structure. We'd rather present a simpler result type. This also protects us
// from API changes; hopefully we won't have to change these result classes
// much, if at all.

final class DeviceInfoAnalogAlarm {
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

final class DeviceInfoProperty {
  final double minVal;
  final double maxVal;
  final String? commonUnits;
  final int commonIndex;
  final List<double> commonCoeff;
  final String? primaryUnits;
  final int primaryIndex;
  final bool isContrSetting;
  final bool isDestructiveRead;
  final bool isFeScaling;
  final bool isStepMotor;

  const DeviceInfoProperty(
      {required this.minVal,
      required this.maxVal,
      this.commonUnits,
      required this.commonIndex,
      required this.commonCoeff,
      this.primaryUnits,
      required this.primaryIndex,
      required this.isContrSetting,
      required this.isDestructiveRead,
      required this.isFeScaling,
      required this.isStepMotor});
}

final class KnobbingInfo {
  final double minVal;
  final double maxVal;
  final double step;

  const KnobbingInfo(
      {required this.minVal, required this.maxVal, required this.step});
}

final class BasicStatusProperty {
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

final class ExtendedBasicStatusEntry {
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

final class DeviceInfoBasicStatus {
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

final class DeviceInfoDigitalControl {
  final int value;
  final String shortName;
  final String longName;

  const DeviceInfoDigitalControl(
      {required this.value, required this.shortName, required this.longName});
}

final class DeviceInfo {
  final int di;
  final String name;
  final String description;
  final DeviceInfoProperty? reading;
  final (DeviceInfoProperty, KnobbingInfo?)? setting;
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

final class Reading {
  final int refId;
  final Status status;
  final int cycle;
  final DateTime timestamp;
  final DeviceValue? value;

  const Reading(
      {required this.refId,
      this.status = Status.okay,
      required this.cycle,
      required this.timestamp,
      this.value});
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

final class BasicStatusAttribute {
  final String character;
  final StatusColor color;

  const BasicStatusAttribute({required this.character, required this.color});
}

final class ExtendedStatusAttribute {
  final String? description;
  final int value;
  final String? valueText;
  final StatusColor? color;

  const ExtendedStatusAttribute(
      {this.description, required this.value, this.valueText, this.color});
}

final class DigitalStatus {
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

final class SettingStatus {
  final int facilityCode;
  final int errorCode;

  const SettingStatus({required this.facilityCode, required this.errorCode});
}

enum AnalogAlarmState { notAlarming, alarming, bypassed }

final class AnalogAlarmStatus {
  final int refId;
  final int status;
  final int cycle;
  final DateTime timestamp;
  final AnalogAlarmState state;

  const AnalogAlarmStatus(
      {required this.refId,
      this.status = 0,
      required this.cycle,
      required this.timestamp,
      required this.state});
}

final class PlotReply {
  final String plotId;
  final String xAxisUnits;
  final double? xAxisMin;
  final double? xAxisMax;
  final int? windowSize;
  final List<PlotChannelData> data;

  const PlotReply(
      {required this.plotId,
      required this.xAxisUnits,
      this.xAxisMin,
      this.xAxisMax,
      this.windowSize,
      required this.data});
}

final class PlotChannelData {
  final String name;
  final String units;
  final int status;
  final List<PlotPoint> points;

  const PlotChannelData(
      {required this.name,
      required this.units,
      this.status = 0,
      this.points = const []});
}

final class PlotPoint {
  final double x;
  final double y;

  const PlotPoint({required this.x, required this.y});
}

final class ChannelSettingSnapshot {
  final Color? lineColor;
  final int? markerIndex;

  const ChannelSettingSnapshot({this.lineColor, this.markerIndex});
}

// Only used by the plot ID class to generate IDs for testing.

int _genPlotId = 1_000_000;

/// Wrap an integer with the semantics of a plot configuration ID. An ID
/// is only an identifer and can't be manipulated as an integer. It only
/// supports comparisons.

extension type PlotConfigId._(int raw) implements Comparable {
  PlotConfigId._fromInt(this.raw);
  PlotConfigId.generate() : raw = _genPlotId++;
  int get _value => raw;
  int compareTo(PlotConfigId other) => raw.compareTo(other.raw);
}

class PlotConfigurationListing {
  PlotConfigId? configurationId;
  String configurationName;

  PlotConfigurationListing(
      {this.configurationId, required this.configurationName});
}

final class PlotConfigurationSnapshot extends PlotConfigurationListing {
  Map<String, ChannelSettingSnapshot> channels;
  double? yMin;
  double? yMax;
  double? xMin;
  double? xMax;
  double? timeDelta; 
  bool isShowLabels;
  bool isScalar;   
  bool isOneShot;
  int? updateDelay;
  int? nAcquisitions;
  int? tclkEvent;

  PlotConfigurationSnapshot(
      {super.configurationId,
      required super.configurationName,
      required this.channels,
      this.yMin,
      this.yMax,
      this.xMin,
      this.xMax,
      this.timeDelta, 
      required this.isShowLabels,
      required this.isScalar, 
      required this.isOneShot, 
      this.updateDelay,
      this.nAcquisitions,
      this.tclkEvent});
}

/// Defines the ACSys API.
///
/// This class is used by other classes to implement the ACSys API. The class
/// that supports the actual API is [ACSysService]. For testing, it is
/// recommended to define a class that implements this interface using well-
/// known data responses.

abstract interface class ACSysServiceAPI {
  /// Returns information about a device.
  ///
  /// - [devices] is a list of device names
  ///
  /// This function queries the device database for all the devices in the
  /// list and returns a list of information associated with the devices.
  /// The information will be in the same order as the devices in the request.

  Future<List<DeviceInfo>> getDeviceInfo(List<String> devices);

  /// Takes a list of data acquisition strings and returns a stream that
  /// provides readings for the requests.

  Stream<Reading> monitorDevices(List<String> drfs);

  /// Takes a list of device names and returns their current reading.

  Future<List<Reading>> readDevices(List<String> devices);

  /// Takes a list of data acquisition strings and returns a stream that
  /// provides the setting value of the requests.
  Stream<Reading> monitorSettingProperty(List<String> drfs);

  /// Takes a list of data acquisition strings and returns a stream that
  /// provides up-to-date `DigitalStatus` values of the devices.
  Stream<DigitalStatus> monitorDigitalStatusDevices(List<String> devices);

  /// Takes a list of data acquisition strings and returns a stream that
  /// provides a sample of the analog alarm property.
  Stream<AnalogAlarmStatus> monitorAnalogAlarmProperty(List<String> drfs);

  /// Returns a stream which provides plot data for the devices specified in
  /// the parameter list.
  Stream<PlotReply> startPlot(List<String> drfs,
      {double? xMin,
      double? xMax,
      int? windowSize,
      int? updateRate,
      int? nAcquisitions,
      int? triggerEvent});

  /// Saves the plot configuration to the database.
  Future<PlotConfigurationSnapshot> savePlotConfiguration(
      {required PlotConfigurationSnapshot snapshot});

  /// Queries the database for a plot configuration.
  Future<PlotConfigurationSnapshot> retrievePlotConfiguration(
      {required PlotConfigId configurationId});

  /// Returns every plot configuration in the database.
  Future<List<PlotConfigurationListing>> listPlotConfigurations();

  /// Removes a plot configuration from the database.
  Future<void> removePlotConfiguration({required PlotConfigId configurationId});

  /// Returns the last plot configuration that the user saved.
  Future<PlotConfigurationSnapshot> retrieveLastUserConfiguration();

  /// Sets the provided plot configuration as the last one the user saved.
  Future<void> saveUserConfiguration(
      {required PlotConfigurationSnapshot snapshot});

  /// Takes a device name and a value and sends a request to apply the value to
  /// the device.
  Future<SettingStatus> submit(
      {required String forDRF, required DeviceValue newSetting});

  /// Takes a device name and a value and sends a request to apply the value to
  /// the device's digital control property.
  Future<SettingStatus> sendCommand(
      {required String toDRF, required String value});
}

/// Provides an interface to Fermi's data acquisition API.
///
/// An instance of this class could be used in an application to acquire data
/// from the control system. But a better way is to use the [ACSysProvider]
/// widget which manages an object of this class.

final class ACSysService implements ACSysServiceAPI {
  final Client _q;
  final Client _s;
  final Client _qDevDb;

  static Map<String, String> _buildAuthHeader(String? jwt) =>
      jwt != null ? {"Authorization": "Bearer $jwt"} : {};

  // Constructor. This creates the HTTP links needed to communicate with our
  // GraphQL endpoints.

  ACSysService({String? jwt})
      : _q = Client(
            link: HttpLink("https://acsys-proxy.fnal.gov:8001/acsys",
                defaultHeaders: _buildAuthHeader(jwt)),
            cache: Cache()),
        _s = Client(
            link: WebSocketLink(null,
                channelGenerator: () => WebSocketChannel.connect(
                      Uri(
                        scheme: "wss",
                        host: "acsys-proxy.fnal.gov",
                        port: 8001,
                        path: "/acsys/s",
                      ),
                      protocols: ["graphql-ws"],
                    ),
                reconnectInterval: const Duration(seconds: 1)),
            cache: Cache()),
        _qDevDb = Client(
            link: HttpLink("https://acsys-proxy.fnal.gov:8001/devdb",
                defaultHeaders: _buildAuthHeader(jwt)),
            cache: Cache());

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

  Future<Result> _rpcDevDb<TData, TVars, Result>(
          OperationRequest<TData, TVars> req,
          {Result Function(TData)? xlat}) =>
      _qDevDb
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

  /// Returns information about devices. The caller provides a list of device
  /// names and will receive a list of `DeviceInfo` objects. The order of the
  /// results in the returned list correspond to the order of the devices in the
  /// source list.

  @override
  Future<List<DeviceInfo>> getDeviceInfo(List<String> devices) async {
    if (devices.isNotEmpty) {
      final req =
          GgetDeviceInfoReq((b) => b..vars.devices = ListBuilder(devices));

      return _rpcDevDb(req,
          xlat: (GgetDeviceInfoData data) =>
              data.deviceInfo.result.map(_convertToDevInfo).toList());
    } else {
      throw const ACSysInvArgException("empty device list");
    }
  }

  @override
  Future<List<Reading>> readDevices(List<String> devices) {
    final req = rd_req.GStreamDataReq((b) => b
      ..vars.devList = ListBuilder(devices)
      ..fetchPolicy = FetchPolicy.NetworkOnly);

    return _rpc(req, xlat: _convertReading);
  }

  static (DeviceInfoProperty, KnobbingInfo?)? processSetting(
      GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_setting? s) {
    if (s != null) {
      final GgetDeviceInfoData_deviceInfo_result__asDeviceInfo_setting_knobInfo?
          ki = s.knobInfo;

      return (
        DeviceInfoProperty(
            minVal: s.minVal,
            maxVal: s.maxVal,
            primaryUnits: s.primaryUnits,
            primaryIndex: s.primaryIndex,
            commonUnits: s.commonUnits,
            commonIndex: s.commonIndex,
            commonCoeff: s.coeff.toList(),
            isContrSetting: s.isContrSetting,
            isDestructiveRead: s.isDestructiveRead,
            isFeScaling: s.isFeScaling,
            isStepMotor: s.isStepMotor),
        ki != null
            ? KnobbingInfo(
                minVal: s.knobInfo!.minVal,
                maxVal: s.knobInfo!.maxVal,
                step: s.knobInfo!.step)
            : null
      );
    } else {
      return null;
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
              commonCoeff: e.reading!.coeff.toList(),
              isContrSetting: e.reading!.isContrSetting,
              isDestructiveRead: e.reading!.isDestructiveRead,
              isFeScaling: e.reading!.isFeScaling,
              isStepMotor: e.reading!.isStepMotor)
          : null;
      final sProp = processSetting(e.setting);

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
    final req = sd_req.GStreamDataReq((b) => b
      ..vars.drfs = ListBuilder(drfs)
      ..fetchPolicy = FetchPolicy.NetworkOnly);

    return _s
        .request(req)
        .handleError(
            (error) => dev.log("error: $error", name: "gql.monitorDevices"))
        .where((event) => !event.loading)
        .map(_convertMonitor);
  }

  // Convert the incoming GraphQL messages into `Reading` objects.

  static Reading _convertMonitor(
      OperationResponse<sd_data.GStreamDataData, sd_var.GStreamDataVars> e) {
    // If the packet doesn't have GraphQL errors, then we can process the
    // payload.

    if (!e.hasErrors) {
      final sd_data.GStreamDataData_acceleratorData data =
          e.data!.acceleratorData;
      final sd_data.GStreamDataData_acceleratorData_data_result result =
          data.data.result;

      return Reading(
          refId: data.refId,
          cycle: data.cycle,
          timestamp: data.data.timestamp,
          value: result.toDevValue());
    } else {
      throw ACSysGraphQLException(e.graphqlErrors.toString());
    }
  }

  static List<Reading> _convertReading(rd_data.GStreamDataData e) =>
      e.acceleratorData
          .map((v) => Reading(
              refId: v.refId,
              cycle: v.cycle,
              timestamp: v.data.timestamp,
              value: v.data.result.toDevValue()))
          .toList();

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
      final statusVal = rdg.value?.toDouble()?.toInt() ?? 0;

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

  @override
  Stream<AnalogAlarmStatus> monitorAnalogAlarmProperty(List<String> drfs) =>
      const Stream.empty();

  @override
  Stream<PlotReply> startPlot(List<String> drfs,
      {double? xMin,
      double? xMax,
      int? windowSize,
      int? updateRate,
      int? nAcquisitions,
      int? triggerEvent}) {
    final req = GStartPlotReq((b) => b
      ..fetchPolicy = FetchPolicy.NetworkOnly
      ..vars.drfList = ListBuilder(drfs)
      ..vars.xMin = xMin
      ..vars.xMax = xMax
      ..vars.windowSize = windowSize
      ..vars.nAcquisitions = nAcquisitions
      ..vars.updateDelay = updateRate
      ..vars.triggerEvent = triggerEvent);

    return _s
        .request(req)
        .handleError((error) => dev.log("error: $error", name: "gql.startPlot"))
        .where((event) => !event.loading)
        .map((e) => e.data!.startPlot.toPlotReply(req));
  }

  @override
  Future<List<PlotConfigurationListing>> listPlotConfigurations() {
    final req =
        GPlotConfigsReq((b) => b..fetchPolicy = FetchPolicy.NetworkOnly);

    return _rpc(req,
        xlat: (GPlotConfigsData data) => data.plotConfiguration
            .map((e) => PlotConfigurationListing(
                configurationId: PlotConfigId._fromInt(e.configurationId),
                configurationName: e.configurationName))
            .toList());
  }

  @override
  Future<void> removePlotConfiguration(
      {required PlotConfigId configurationId}) {
    final req =
        GDeletePlotConfigReq((b) => b..vars.id = configurationId._value);

    return _rpc(req, xlat: (GDeletePlotConfigData data) => ());
  }

  @override
  Future<PlotConfigurationSnapshot> retrieveLastUserConfiguration() {
    final req = GUsersLastConfigReq((b) => b);

    return _rpc(req, xlat: (GUsersLastConfigData data) {
      final e = data.usersLastConfiguration!;

      return PlotConfigurationSnapshot(
          configurationId: PlotConfigId._fromInt(e.configurationId),
          configurationName: e.configurationName,
          channels: Map.fromEntries(e.channels.map((e) => MapEntry(
              e.device,
              ChannelSettingSnapshot(
                  lineColor: e.lineColor != null ? Color(e.lineColor!) : null,
                  markerIndex: e.markerIndex)))),
          yMin: e.yMin,
          yMax: e.yMax,
          xMin: e.xMin,
          xMax: e.xMax,
          timeDelta: e.timeDelta,
          isOneShot: e.isOneShot,
          isScalar: e.isScalar,
          isShowLabels: e.isShowLabels,
          updateDelay: e.updateDelay,
          nAcquisitions: e.nAcquisitions,
          tclkEvent: e.tclkEvent);
    });
  }

  @override
  Future<void> saveUserConfiguration(
      {required PlotConfigurationSnapshot snapshot}) {
    final req = GSetUsersConfigReq(
        (b) => b..vars.cfg = _plotConfigurationSnapshotIn(snapshot));

    return _rpc(req, xlat: (GSetUsersConfigData data) => ());
  }

  @override
  Future<PlotConfigurationSnapshot> retrievePlotConfiguration(
      {required PlotConfigId configurationId}) {
    final req = GPlotConfigsReq((b) => b..vars.id = configurationId._value);

    return _rpc(req,
        xlat: (GPlotConfigsData data) => data.plotConfiguration
            .map((e) => PlotConfigurationSnapshot(
                configurationId: PlotConfigId._fromInt(e.configurationId),
                configurationName: e.configurationName,
                channels: Map.fromEntries(e.channels.map((e) => MapEntry(
                    e.device,
                    ChannelSettingSnapshot(
                        lineColor:
                            e.lineColor != null ? Color(e.lineColor!) : null,
                        markerIndex: e.markerIndex)))),
                yMin: e.yMin,
                yMax: e.yMax,
                xMin: e.xMin,
                xMax: e.xMax,
                timeDelta: e.timeDelta,
                isOneShot: e.isOneShot,
                isScalar: e.isScalar,
                isShowLabels: e.isShowLabels,
                updateDelay: e.updateDelay,
                nAcquisitions: e.nAcquisitions,
                tclkEvent: e.tclkEvent))
            .toList()).then(
      (value) {
        switch (value) {
          case []:
            throw const ACSysConfigurationException("no configuration found");
          case [PlotConfigurationSnapshot e]:
            return e;
          default:
            throw const ACSysConfigurationException(
                "multiple configurations found");
        }
      },
    );
  }

  GPlotConfigurationSnapshotInBuilder _plotConfigurationSnapshotIn(
          PlotConfigurationSnapshot cfg) =>
      GPlotConfigurationSnapshotInBuilder()
        ..configurationId = cfg.configurationId?._value
        ..configurationName = cfg.configurationName
        ..channels = ListBuilder(
            cfg.channels.entries.map((e) => GChannelSettingSnapshotIn((b) => b
              ..device = e.key
              ..lineColor = e.value.lineColor?.value
              ..markerIndex = e.value.markerIndex)))
        ..yMin = cfg.yMin
        ..yMax = cfg.yMax
        ..xMin = cfg.xMin
        ..xMax = cfg.xMax
        ..timeDelta = cfg.timeDelta
        ..isOneShot = cfg.isOneShot
        ..isScalar = cfg.isScalar
        ..isShowLabels = cfg.isShowLabels
        ..updateDelay = cfg.updateDelay
        ..nAcquisitions = cfg.nAcquisitions
        ..tclkEvent = cfg.tclkEvent;

  @override
  Future<PlotConfigurationSnapshot> savePlotConfiguration(
      {required PlotConfigurationSnapshot snapshot}) {
    final req = GUpdatePlotConfigReq(
        (b) => b..vars.cfg = _plotConfigurationSnapshotIn(snapshot));

    return _rpc(req,
            xlat: (GUpdatePlotConfigData data) => data.updatePlotConfiguration)
        .then((id) => snapshot
          ..configurationId = id == null ? null : PlotConfigId._fromInt(id));
  }
}

extension on sd_data.GStreamDataData_acceleratorData_data_result {
  DeviceValue toDevValue() => switch (this) {
        sd_data.GStreamDataData_acceleratorData_data_result__asScalar val =>
          DevScalar(val.scalarValue),
        sd_data.GStreamDataData_acceleratorData_data_result__asScalarArray
          val =>
          DevScalarArray(val.scalarArrayValue.toList()),
        sd_data.GStreamDataData_acceleratorData_data_result__asText val =>
          DevText(val.textValue),
        sd_data.GStreamDataData_acceleratorData_data_result__asTextArray val =>
          DevTextArray(val.textArrayValue.toList()),
        _ => throw ACSysTypeException("unexpected data type, $runtimeType")
      };
}

extension on rd_data.GStreamDataData_acceleratorData_data_result {
  DeviceValue toDevValue() => switch (this) {
        sd_data.GStreamDataData_acceleratorData_data_result__asScalar val =>
          DevScalar(val.scalarValue),
        sd_data.GStreamDataData_acceleratorData_data_result__asScalarArray
          val =>
          DevScalarArray(val.scalarArrayValue.toList()),
        sd_data.GStreamDataData_acceleratorData_data_result__asText val =>
          DevText(val.textValue),
        sd_data.GStreamDataData_acceleratorData_data_result__asTextArray val =>
          DevTextArray(val.textArrayValue.toList()),
        _ => throw ACSysTypeException("unexpected data type, $runtimeType")
      };
}

extension on GStartPlotData_startPlot_data {
  PlotChannelData toPlotChannelData(int idx, GStartPlotReq req) =>
      PlotChannelData(
          name: req.vars.drfList[idx],
          units: channelUnits,
          status: channelStatus,
          points: channelData.map((e) => PlotPoint(x: e.x, y: e.y)).toList());
}

extension on GStartPlotData_startPlot {
  PlotReply toPlotReply(GStartPlotReq req) => PlotReply(
      plotId: plotId,
      xAxisUnits: "Time",
      xAxisMin: req.vars.xMin?.toDouble(),
      xAxisMax: req.vars.xMax?.toDouble(),
      windowSize: req.vars.windowSize,
      data:
          data.indexed.map((e) => e.$2.toPlotChannelData(e.$1, req)).toList());
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

/// A widget that provides access to the ACSys Service API. This doesn't
/// exist in the widget, nor does it do anything but provide access to the
/// API using the coolly named `ACSys.api()` method.

final class ACSys {
  /// Returns an object supporting the ACSys API.
  ///
  /// Any widget that uses this to retrieve the ACSys service object will
  /// get registered if the [ACSysProvider] gets rebuilt.

  static ACSysServiceAPI api(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<_ACSysProviderIW>()!._service;
}

/// Provides the ACSys API to the application.
///
/// If an application wishes to use the ACSys API, it should place an instance
/// of this widget near the top of its tree so it doesn't get rebuilt. With
/// this in the tree, other widgets can use the API by calling [ACSys.api()]
/// to get an [ACSysServiceAPI] object which implements the API.
final class ACSysProvider extends StatelessWidget {
  final Widget child;
  final ACSysServiceAPI? service;

  /// Creates the widget.
  ///
  /// - [child] is the widget subtree that gets added to the tree below this
  ///   widget.
  /// - [key] is an optional identifier for the widget.
  /// - [service] is an optional obect which implements the [ACSysServiceAPI]
  ///   interface. If this option is omitted, the widget will use an
  ///   implementation that communicates over the network to the offcial
  ///   control system API. This option is mainly to mock-up a service to
  ///   use in unit tests.
  const ACSysProvider({this.service, required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return _ACSysProviderIW(
        service: service ?? ACSysService(jwt: AuthService.getJwt(context)), child: child);
  }
}

// The inherited widget that provides the ACSys API to the application. This
// is a private class which holds a spot in the widget tree where the service
// object is stored. Inherited Widgets provide registration so that widgets
// can be rapidly rebuilt when the service object changes.

final class _ACSysProviderIW extends InheritedWidget {
  final ACSysServiceAPI _service;

  const _ACSysProviderIW(
      {required ACSysServiceAPI service, required super.child})
      : _service = service;

  @override
  bool updateShouldNotify(covariant _ACSysProviderIW oldWidget) =>
      _service != oldWidget._service;
}
