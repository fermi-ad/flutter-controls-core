/// A set of widgets that are the foundation of a Fermi application.

library app_scaffold;

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'auth_widget.dart';
import 'fermi_theme.dart';

// Our Fermi theme generated with - https://m3.material.io/theme-builder#/custom

class _GlobalAppTheme {
  _GlobalAppTheme._();

  static ThemeData lightTheme =
      ThemeData(useMaterial3: true, colorScheme: lightColorScheme);
  static ThemeData darkTheme =
      ThemeData(useMaterial3: true, colorScheme: darkColorScheme);
}

/// Creates the foundation of a non-authenticated, scaffold app.
///
/// This creates a scaffold widget that uses Fermilab's theme. [title] will
/// be used for the title of the web page (for web targets.) [appBar] will
/// be displayed as the application's title bar. [body] is the body of the
/// application.

class StandardApp extends StatelessWidget {
  final String title;
  final Widget? body;
  final Widget? drawer;
  final Widget? floatingActionButton;
  final PreferredSizeWidget? appBar;

  const StandardApp(
      {required this.title,
      this.appBar,
      this.body,
      this.drawer,
      this.floatingActionButton,
      super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
      title: title,
      theme: _GlobalAppTheme.lightTheme,
      darkTheme: _GlobalAppTheme.darkTheme,
      home: AuthService(
          child: Scaffold(
              appBar: appBar,
              body: body,
              drawer: drawer,
              floatingActionButton: floatingActionButton)));
}

/// Creates an application scaffold that uses the `GoRouter` package.
///
/// This class creates a widget that supports Material Design and uses the
/// GoRouter package to navigate through the app. The theme is set to a
/// standardized, Fermilab-curated configuration.

class NonAuthRouterApp extends StatelessWidget {
  final String title;
  final GoRouter router;

  const NonAuthRouterApp(
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

/// Creates an application scaffold that uses the `GoRouter` package and
/// authentication.
///
/// This class creates a widget that supports Material Design and uses the
/// GoRouter package to navigate through the app. The theme is set to a
/// standardized, Fermilab-curated configuration. This widget also requires
/// parameter to aid in authenticating the app: the [realm], [clientId], and
/// [clientSecret]. These parameters are generated by the KeyCloak service.

class AuthRouterApp extends StatelessWidget {
  final String title;
  final GoRouter router;

  const AuthRouterApp({required this.title, required this.router, super.key});

  // Return the MaterialApp widget which will define the look-and-feel for the
  // application.
  @override
  Widget build(BuildContext context) => AuthService(
          child: MaterialApp.router(
        title: title,
        theme: _GlobalAppTheme.lightTheme,
        darkTheme: _GlobalAppTheme.darkTheme,
        routerConfig: router,
      ));
}
