/// Defines a set of widgets that are the foundation of a Fermi application.

library app_scaffold;

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Our text theme taken from
// https://codingwitht.com/how-to-use-theme-in-flutter-light-dark-theme/

class _GlobalTextTheme {
  _GlobalTextTheme._();

  static TextTheme globalTextTheme = const TextTheme(
    titleSmall: TextStyle(fontSize: 16.0),
    titleMedium: TextStyle(fontSize: 18.0),
    titleLarge: TextStyle(fontSize: 24.0),
    bodySmall: TextStyle(fontSize: 14.0),
    bodyMedium: TextStyle(fontSize: 18.0),
    bodyLarge: TextStyle(fontSize: 20.0),
  );

  static TextTheme lightTextTheme = globalTextTheme.copyWith();
  static TextTheme darkTextTheme = globalTextTheme.copyWith();
}

// Our app theme taken from
// https://codingwitht.com/how-to-use-theme-in-flutter-light-dark-theme/

class _GlobalAppTheme {
  _GlobalAppTheme._();

  static ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    brightness: Brightness.light,
    textTheme: _GlobalTextTheme.lightTextTheme,
    appBarTheme: const AppBarTheme(),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(),
    elevatedButtonTheme:
        ElevatedButtonThemeData(style: ElevatedButton.styleFrom()),
    useMaterial3: true,
  );

  static ThemeData darkTheme = ThemeData(
    primarySwatch: Colors.blue,
    brightness: Brightness.dark,
    textTheme: _GlobalTextTheme.darkTextTheme,
    appBarTheme: const AppBarTheme(),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(),
    elevatedButtonTheme:
        ElevatedButtonThemeData(style: ElevatedButton.styleFrom()),
    useMaterial3: true,
  );
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
