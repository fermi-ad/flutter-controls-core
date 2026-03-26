import 'dart:typed_data';

import 'package:test/test.dart';
import 'package:flutter_controls_core/flutter_controls_core.dart';

DeviceValue _makeScalar(double v) => DevScalar(v);

DeviceValue _makeScalarArray(List<double> s) => DevScalarArray(s);

DeviceValue _makeText(String s) => DevText(s);

DeviceValue _makeTextArray(List<String> s) => DevTextArray(s);

DeviceValue _makeRaw(Uint8List v) => DevRaw(v);

void main() {
  // This test verifies the equality operator is working for `DeviceValue`
  // types.
  test("Test device value equality", () {
    const v = DevScalar(1.0);

    expect(v, equals(v));
    expect(_makeScalar(1.0), equals(_makeScalar(1.0)));
    expect(_makeScalar(2.0), isNot(equals(_makeScalar(1.0))));

    expect(_makeRaw(Uint8List.fromList([])), isNot(equals(_makeScalar(1.0))));
    expect(
      _makeRaw(Uint8List.fromList([])),
      equals(_makeRaw(Uint8List.fromList([]))),
    );
    expect(_makeRaw(Uint8List.fromList([])), isNot(equals(_makeText("Hi"))));
    expect(
      _makeRaw(Uint8List.fromList([1, 2, 3])),
      equals(_makeRaw(Uint8List.fromList([1, 2, 3]))),
    );
    expect(
      _makeRaw(Uint8List.fromList([1, 2, 3])),
      isNot(equals(_makeRaw(Uint8List.fromList([0, 2, 3])))),
    );

    expect(_makeText("Hello"), isNot(equals(_makeScalar(1.0))));
    expect(_makeText("hello"), isNot(equals(_makeRaw(Uint8List.fromList([])))));
    expect(_makeText("Hello"), equals(_makeText("Hello")));
    expect(_makeText("Hello"), isNot(equals(_makeText("Hi"))));

    expect(_makeTextArray(["Hello", "there"]), isNot(equals(_makeScalar(1.0))));
    expect(
      _makeTextArray(["Hello", "there"]),
      isNot(equals(_makeRaw(Uint8List.fromList([])))),
    );
    expect(_makeTextArray(["Hello", "there"]), isNot(equals(_makeText("Hi"))));
    expect(
      _makeTextArray(["Hello", "there"]),
      equals(_makeTextArray(["Hello", "there"])),
    );
    expect(
      _makeTextArray(["Hello", "there"]),
      isNot(equals(_makeTextArray(["Hi", "there"]))),
    );

    expect(_makeScalarArray([1.0, 2.0, 3.0]), isNot(equals(_makeScalar(1.0))));
    expect(
      _makeScalarArray([1.0, 2.0, 3.0]),
      isNot(equals(_makeRaw(Uint8List.fromList([])))),
    );
    expect(_makeScalarArray([1.0, 2.0, 3.0]), isNot(equals(_makeText("Hi"))));
    expect(
      _makeScalarArray([1.0, 2.0, 3.0]),
      isNot(equals(_makeTextArray(["Hello", "there"]))),
    );
    expect(
      _makeScalarArray([1.0, 2.0, 3.0]),
      equals(_makeScalarArray([1.0, 2.0, 3.0])),
    );
    expect(
      _makeScalarArray([1.0, 2.0, 3.0]),
      isNot(equals(_makeScalarArray([1.0, 3.0]))),
    );
  });

  test("Test device value conversions", () {
    // Make sure the DeviceValue types all pass through unchanged.

    expect(
      _makeRaw(Uint8List.fromList([])).toDevVal(),
      equals(_makeRaw(Uint8List.fromList([]))),
    );
    expect(
      _makeRaw(Uint8List.fromList([1, 2])).toDevVal(),
      equals(_makeRaw(Uint8List.fromList([1, 2]))),
    );
    expect(
      Uint8List.fromList([1, 2]).toDevVal(),
      equals(_makeRaw(Uint8List.fromList([1, 2]))),
    );

    expect(_makeScalar(1.0).toDevVal(), equals(_makeScalar(1.0)));
    expect(1.0.toDevVal(), equals(_makeScalar(1.0)));

    expect(_makeScalarArray([1.0]).toDevVal(), equals(_makeScalarArray([1.0])));

    expect(_makeText("A").toDevVal(), equals(_makeText("A")));
    expect("Hello".toDevVal(), equals(_makeText("Hello")));

    expect(_makeTextArray(["A"]).toDevVal(), equals(_makeTextArray(["A"])));
  });
}
