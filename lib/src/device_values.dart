/// Defines all types used by devices in Fermilab's control system.
///
/// This module providess a sealed class hierarchy which defines all the types
/// of values that can be found in Fermilab's control system. If a new type is
/// added, it needs to be defined in this module and a new release of this
/// package needs to be made.
///
/// Functions that deal with devices will specify `DeviceValue` as a parameter
/// or return a `DeviceValue` value. For instance, if a hypothetical `setDevice`
/// function takes a devices name and a device value, we could set it to `10.0`
/// by making the call
///
/// ```
/// setDevice("DEVICE", DevScalar(10.0));
/// ```
///
/// If one were receiving a value from a function, you can use pattern-matching
/// to get the value. For instance, reading (hypothetically) outdoor temperature
/// returns a floating point number:
///
/// ```
/// if (readDevice("M:OUTTMP") case DevScalar(value: deg)) {
///     print("It is $deg degrees outside.");
/// } else {
///     print("M:OUTTMP didn't return a floating point number!");
/// }
/// ```

library device_values;

import 'package:flutter/foundation.dart';

/// Use this type to indicate any device type is allowed.
///
/// Functions that use this as a parameter will accept any of the derived
/// classes. Functions that return this type can, actually, return any of the
/// derived types.

sealed class DeviceValue {
  const DeviceValue();

  @override
  bool operator ==(covariant DeviceValue other) {
    if (identical(this, other)) return true;

    switch ((this, other)) {
      case ((DevRaw(value: var v), DevRaw(value: var o))):
        return listEquals(v, o);
      case ((DevScalar(value: var v), DevScalar(value: var o))):
        return v == o;
      case ((DevScalarArray(value: var v), DevScalarArray(value: var o))):
        return listEquals(v, o);
      case ((DevText(value: var v), DevText(value: var o))):
        return v == o;
      case ((DevTextArray(value: var v), DevTextArray(value: var o))):
        return listEquals(v, o);
      default:
        return false;
    }
  }

  @override
  int get hashCode => switch (this) {
        DevRaw(value: var v) => v.hashCode,
        DevScalar(value: var v) => v.hashCode,
        DevText(value: var v) => v.hashCode,
        DevScalarArray(value: var v) => v.hashCode,
        DevTextArray(value: var v) => v.hashCode,
      };
}

/// Represents a raw, byte array.
///
/// If you ask for "raw" data from a device, you'll get an instance of this
/// type. Your application will have to interpret the data and determine how to
/// scale it. This type is mostly useful for diagnostics or for actual, binary
/// data buffers (i.e. image data.)

class DevRaw extends DeviceValue {
  final List<int> value;

  const DevRaw(this.value);
}

/// Represents a single, floating point number.
///
/// Most devices deal with floating point values. This is the type to send to
/// a device and what would be returned when reading it.

class DevScalar extends DeviceValue {
  final double value;

  const DevScalar(this.value);
}

/// Represents an array of floating point values.
///
/// Some devices are "array devices" and will return an array of floating point
/// values. This type is also used by EPICS "waveform" devices.

class DevScalarArray extends DeviceValue {
  final List<double> value;

  const DevScalarArray(this.value);
}

/// Represents a single string of characters.

class DevText extends DeviceValue {
  final String value;

  const DevText(this.value);
}

/// Represents an array of strings.

class DevTextArray extends DeviceValue {
  final List<String> value;

  const DevTextArray(this.value);
}

// The `ToDeviceValue` extension allows us to convert primitive types into a
// `DeviceValue`.

extension ToDeviceValue on DeviceValue {
  DeviceValue toDevVal() => this;
}

extension DoubleToDeviceValue on double {
  DeviceValue toDevVal() => DevScalar(this);
}

extension TextToDeviceValue on String {
  DeviceValue toDevVal() => DevText(this);
}

extension RawToDeviceValue on List<int> {
  DeviceValue toDevVal() => DevRaw(this);
}

extension DoubleArrayToDeviceValue on List<double> {
  DeviceValue toDevVal() => DevScalarArray(this);
}

extension TextArrayToDeviceValue on List<String> {
  DeviceValue toDevVal() => DevTextArray(this);
}
