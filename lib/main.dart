import 'package:flutter/material.dart';
import 'package:flutter_controls_core/flutter_controls_core.dart';

Future<void> main() async {
  await runFermiApp(appWidget: const DemoAppWidget());
}

class DemoAppWidget extends StatelessWidget {
  const DemoAppWidget({super.key});

  static const title = "Fermi Controls Demo App";

  @override
  Widget build(BuildContext context) => StandardApp(
      title: title,
      appBar: AppBar(title: const Text(title)),
      body: const Center(
          child: Text(
        "This application demos the capabilities of the flutter-controls-core library.",
        textAlign: TextAlign.center,
      )));
}
