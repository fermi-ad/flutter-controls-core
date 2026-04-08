import 'package:test/test.dart';
import 'package:flutter_controls_core/flutter_controls_core.dart';

void main() {
  test('Status decodes positive facility and error values', () {
    const status = Status.fromInt(273);

    expect(status.facility, 17);
    expect(status.error, 1);
    expect(status.warning, isTrue);
    expect(status.success, isTrue);
    expect(status.fatal, isFalse);
  });

  test('Status preserves sign for negative error values', () {
    const status = Status.fromInt(-6143);

    expect(status.facility, 1);
    expect(status.error, -24);
    expect(status.warning, isFalse);
    expect(status.success, isFalse);
    expect(status.fatal, isTrue);
  });
}
