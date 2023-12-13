library status;

class Status {
  final int code;

  const Status(int facCode, int errCode) : code = errCode * 256 + facCode;

  const Status.fromInt(int value) : code = value;

  int get facility => code ~/ 256;
  int get error => code & 255;

  bool get success => error >= 0;
  bool get warning => error > 0;
  bool get fatal => error < 0;

  // Global, predefined status codes.

  static const Status okay = Status(0, 0);

  static const Status noProperty = Status(17, -27);
}
