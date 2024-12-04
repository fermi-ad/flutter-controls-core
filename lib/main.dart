import 'package:flutter/material.dart';
import 'package:flutter_controls_core/flutter_controls_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");

  await runFermiApp(
      authInfo: AuthInfo(
          realm: dotenv.env['AUTH_INFO_REALM']!,
          scopes: [],
          clientId: dotenv.env['AUTH_INFO_CLIENT_ID']!,
          clientSecret: dotenv.env['AUTH_INFO_CLIENT_SECRET']!),
      appWidget: const DemoAppWidget());
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
