/// A set of widgets that are the foundation of a Fermi application.

library app_scaffold;

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'fermi_theme.dart';
import 'auth_widget.dart';

// Our Fermi theme generated with - https://m3.material.io/theme-builder#/custom

class _GlobalAppTheme {
  _GlobalAppTheme._();

  static ThemeData lightTheme =
      ThemeData(useMaterial3: true, colorScheme: lightColorScheme);
  static ThemeData darkTheme =
      ThemeData(useMaterial3: true, colorScheme: darkColorScheme);
}

/// Creates an application scaffold that uses the `GoRouter` package.
///
/// This lass creates a widget that supports Material Design and uses the
/// GoRouter package to navigate through the app. The theme is set to a
/// standardized, Fermilab-curated configuration.

class ControlsRouterApp extends StatelessWidget {
  final String title;
  final GoRouter router;

  const ControlsRouterApp(
      {required this.title, required this.router, super.key});

  // Return the MaterialApp widget which will define the look-and-feel for the
  // application.
  @override
  Widget build(BuildContext context) => MaterialApp.router(
        title: title,
        theme: _GlobalAppTheme.lightTheme,
        darkTheme: _GlobalAppTheme.darkTheme,
        routerConfig: router,
      );
}
