// /Users/neswold/projects/flutter-controls-core/test/plot_config_test.dart

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_controls_core/src/service/acsys_service.dart';

void main() {
  group('ChannelSettingSnapshot', () {
    test('fromJson parses valid full JSON', () {
      final json = {
        'lineColor': 0xFF0000FF, // Blue
        'markerIndex': 1,
        'yMin': -10.5,
        'yMax': 10.5,
      };

      final snapshot = ChannelSettingSnapshot.fromJson(json);

      expect(snapshot.lineColor?.toARGB32(), 0xFF0000FF);
      expect(snapshot.markerIndex, 1);
      expect(snapshot.yMin, -10.5);
      expect(snapshot.yMax, 10.5);
    });

    test('fromJson handles int values for double fields', () {
      final json = {'yMin': -10, 'yMax': 10};

      final snapshot = ChannelSettingSnapshot.fromJson(json);

      expect(snapshot.yMin, -10.0);
      expect(snapshot.yMax, 10.0);
    });

    test('fromJson handles incorrect types gracefully (sets to null)', () {
      final json = {
        'lineColor': 'not an int',
        'markerIndex': 5.5, // double instead of int
        'yMin': 'low',
        'yMax': false,
      };

      final snapshot = ChannelSettingSnapshot.fromJson(json);

      expect(snapshot.lineColor, null);
      expect(snapshot.markerIndex, null);
      expect(snapshot.yMin, null);
      expect(snapshot.yMax, null);
    });

    test('toJson returns correct map', () {
      const snapshot = ChannelSettingSnapshot(
        lineColor: Color(0xFF00FF00),
        markerIndex: 2,
        yMin: 0.0,
        yMax: 100.0,
      );

      final json = snapshot.toJson();

      expect(json['lineColor'], 0xFF00FF00);
      expect(json['markerIndex'], 2);
      expect(json['yMin'], 0.0);
      expect(json['yMax'], 100.0);
    });
  });

  group('PlotConfigurationSnapshot', () {
    final testId = PlotConfigId.generate();

    test('fromJson parses valid full JSON', () {
      final json = {
        'channels': {
          'M:OUTTMP': {'lineColor': 0xFFFF0000, 'yMin': 0, 'yMax': 100},
        },
        'xMin': 0,
        'xMax': 60,
        'timeDelta': 0.1,
        'startTime': 1000.0,
        'endTime': 2000.0,
        'isShowLabels': false,
        'isScalar': false,
        'isOneShot': true,
        'isPersistent': true,
        'isBlink': true,
        'updateDelay': 500,
        'nAcquisitions': 10,
        'tclkEvent': 0x12,
        'sampleOnEvent': 0x15,
        'acquisitionMode': 'rep_periodic',
        'xAxis': 'Time',
        'dataLimit': 1024,
      };

      final snapshot = PlotConfigurationSnapshot.fromJson(
        testId,
        'Test Config',
        json,
      );

      expect(snapshot.configurationId, testId);
      expect(snapshot.configurationName, 'Test Config');
      expect(snapshot.channels.length, 1);
      expect(snapshot.channels['M:OUTTMP']?.yMax, 100.0);

      expect(snapshot.xMin, 0.0);
      expect(snapshot.xMax, 60.0);
      expect(snapshot.timeDelta, 0.1);
      expect(snapshot.startTime, 1000.0);
      expect(snapshot.endTime, 2000.0);

      expect(snapshot.isShowLabels, false);
      expect(snapshot.isScalar, false);
      expect(snapshot.isOneShot, true);
      expect(snapshot.isPersistent, true);
      expect(snapshot.isBlink, true);

      expect(snapshot.updateDelay, 500);
      expect(snapshot.nAcquisitions, 10);
      expect(snapshot.tclkEvent, 0x12);
      expect(snapshot.sampleOnEvent, 0x15);
      expect(snapshot.acquisitionMode, AcquisitionMode.repetitivePeriodic);
      expect(snapshot.xAxis, 'Time');
      expect(snapshot.dataLimit, 1024);
    });

    test('fromJson uses defaults for missing fields', () {
      final json = <String, dynamic>{}; // Empty map

      final snapshot = PlotConfigurationSnapshot.fromJson(
        testId,
        'Defaults',
        json,
      );

      // Check defaults defined in fromJson logic
      expect(snapshot.isShowLabels, true);
      expect(snapshot.isScalar, true);
      expect(snapshot.isOneShot, false);
      expect(snapshot.isPersistent, false);
      expect(snapshot.isBlink, false);
      expect(snapshot.dataLimit, 32768);
      expect(snapshot.channels, isEmpty);

      // Nullables should be null
      expect(snapshot.xMin, null);
      expect(snapshot.acquisitionMode, null);
    });

    test('fromJson handles robust type checking', () {
      final json = {
        'xMin': 'not a number',
        'isShowLabels': 'not a bool',
        'dataLimit': 123.45, // double provided for int field
      };

      final snapshot = PlotConfigurationSnapshot.fromJson(
        testId,
        'Robust',
        json,
      );

      expect(snapshot.xMin, null);
      // 'not a bool' should fail `is bool` check and fall back to default (true)
      expect(snapshot.isShowLabels, true);
      // 123.45 should fail `is int` check and fall back to default
      expect(snapshot.dataLimit, 32768);
    });

    test('fromJson ignores malformed channels but parses valid ones', () {
      final json = {
        'channels': {
          'GOOD:DEV': {'yMin': 0},
          'BAD:DEV': 'this is not a map',
        },
      };

      final snapshot = PlotConfigurationSnapshot.fromJson(
        testId,
        'Partial Channels',
        json,
      );

      expect(snapshot.channels.length, 1);
      expect(snapshot.channels.containsKey('GOOD:DEV'), true);
      expect(snapshot.channels['GOOD:DEV']?.yMin, 0.0);
      expect(snapshot.channels.containsKey('BAD:DEV'), false);
    });

    test('toJson round trip', () {
      final original = PlotConfigurationSnapshot(
        configurationId: testId,
        configurationName: 'Round Trip',
        channels: {'DEV': const ChannelSettingSnapshot(yMin: 1.0, yMax: 2.0)},
        xMin: 0.0,
        xMax: 10.0,
        isShowLabels: true,
        isScalar: false,
        isOneShot: true,
        dataLimit: 100,
        acquisitionMode: AcquisitionMode.sampleOnEvent,
      );

      final json = original.toJson();
      final rebuilt = PlotConfigurationSnapshot.fromJson(
        testId,
        'Round Trip',
        json,
      );

      expect(rebuilt.xMin, original.xMin);
      expect(rebuilt.xMax, original.xMax);
      expect(rebuilt.isShowLabels, original.isShowLabels);
      expect(rebuilt.acquisitionMode, original.acquisitionMode);
      expect(rebuilt.channels.length, 1);
      expect(rebuilt.channels['DEV']?.yMax, 2.0);
    });
  });
}
