import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> setDesktopScreenSize(WidgetTester tester) async {
  tester.view.physicalSize = const Size(1024, 768);
  tester.view.devicePixelRatio = 1.0;
}
