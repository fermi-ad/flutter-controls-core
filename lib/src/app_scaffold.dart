/// A set of widgets that are the foundation of a Fermi application.

library;

import 'package:flutter/material.dart';
import 'package:openid_client/openid_client.dart';
import 'package:go_router/go_router.dart';
import 'fermi_theme.dart';
import 'auth_widget.dart';

// Our Fermi theme generated with - https://m3.material.io/theme-builder#/custom

final class _GlobalAppTheme {
  _GlobalAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: lightColorScheme,
    fontFamily: 'RobotoLocal',
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: darkColorScheme,
    fontFamily: 'RobotoLocal',
  );
}

// Private widget used to display content in the side, drawer menu's header.

final class _DrawerHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData td = Theme.of(context);
    final UserInfo? userInfo = AuthService.getUserInfo(context);

    final content = switch ((userInfo, AuthService.authRequired)) {
      // For this case, the application didn't set up authentication parameters so
      // it plans to run with no privilieges. If the application tries to use a service
      // that needs authorization, the service will return an error.
      (_, false) => [
        Expanded(
          child: Icon(
            Icons.no_accounts_sharp,
            size: 48.0,
            semanticLabel: "No login required",
            color: td.disabledColor,
          ),
        ),
        const Text("No privileges required.", textAlign: TextAlign.center),
      ],
      (null, true) => [
        Expanded(
          child: Icon(
            Icons.no_accounts_sharp,
            size: 48.0,
            semanticLabel: "Login required",
            color: td.disabledColor,
          ),
        ),
        const Text("Unauthorized"),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(td.disabledColor),
            ),
            onPressed: () => AuthService.requestLogin(context),
            child: const Text("Login"),
          ),
        ),
      ],
      (UserInfo user, true) => [
        Expanded(
          child: Icon(
            Icons.account_circle,
            size: 48.0,
            semanticLabel: "Logged in as ${user.name}",
          ),
        ),
        Text(user.name ?? "** no name in system **"),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: ElevatedButton(
            onPressed: () => AuthService.requestLogout(context),
            child: const Text("Logout"),
          ),
        ),
      ],
    };

    return DrawerHeader(child: Column(children: content));
  }
}

final class _Drawer extends StatelessWidget {
  final List<Widget>? content;

  const _Drawer(this.content);

  @override
  Widget build(BuildContext context) {
    final ThemeData td = Theme.of(context);

    return Drawer(
      child: Column(
        children: [
          Expanded(child: ListView(children: [_DrawerHeader(), ...?content])),

          // Change to "Fermi Forward Discovery Group, LLC" in 2025.
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              "© 2025 Fermi Forward Discovery Group, LLC\nAll rights reserved.",
              textAlign: TextAlign.center,
              style: td.textTheme.bodySmall?.copyWith(color: td.disabledColor),
            ),
          ),
        ],
      ),
    );
  }
}

/// Creates the foundation of a scaffold-based app.
///
/// This creates a scaffold widget that uses Fermilab's theme. [title] will
/// be used for the title of the web page (for web targets.) [appBar] will
/// be displayed as the application's title bar. [body] is the body of the
/// application.

final class StandardApp extends StatelessWidget {
  final String title;
  final Widget? body;
  final List<Widget>? drawerContents;
  final List<Widget Function({required Widget child})> providers;
  final Widget? floatingActionButton;
  final PreferredSizeWidget? appBar;

  const StandardApp({
    required this.title,
    this.appBar,
    this.body,
    this.drawerContents,
    this.floatingActionButton,
    this.providers = const [],
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final scaffold = providers.fold<Widget>(
      Scaffold(
        appBar: appBar,
        body: body,
        drawer: _Drawer(drawerContents),
        floatingActionButton: floatingActionButton,
      ),
      (w, p) => p(child: w),
    );

    return MaterialApp(
      title: title,
      theme: _GlobalAppTheme.lightTheme,
      darkTheme: _GlobalAppTheme.darkTheme,
      home: AuthService(child: scaffold),
    );
  }
}

final class _RouterApp extends StatelessWidget {
  final String title;
  final GoRouter router;

  const _RouterApp({required this.title, required this.router});

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

/// Creates an application scaffold that uses the `GoRouter` package.
///
/// This class creates a widget that supports Material Design and uses the
/// GoRouter package to navigate through the app. The theme is set to a
/// standardized, Fermilab-curated configuration.

final class NonAuthRouterApp extends StatelessWidget {
  final _RouterApp _app;

  NonAuthRouterApp({required String title, required GoRouter router, super.key})
    : _app = _RouterApp(title: title, router: router);

  // Return the MaterialApp widget which will define the look-and-feel for the
  // application.
  @override
  Widget build(BuildContext context) => _app;
}

/// Creates an application scaffold that uses the `GoRouter` package and
/// authentication.
///
/// This class creates a widget that supports Material Design and uses the
/// GoRouter package to navigate through the app. The theme is set to a
/// standardized, Fermilab-curated configuration. This widget also requires
/// parameter to aid in authenticating the app: the [realm], [clientId], and
/// [clientSecret]. These parameters are generated by the KeyCloak service.

final class AuthRouterApp extends StatelessWidget {
  final _RouterApp _app;
  final String realm;
  final String clientId;
  final String clientSecret;

  AuthRouterApp({
    required String title,
    required GoRouter router,
    required this.realm,
    required this.clientId,
    required this.clientSecret,
    super.key,
  }) : _app = _RouterApp(title: title, router: router);

  // Return the MaterialApp widget which will define the look-and-feel for the
  // application.
  @override
  Widget build(BuildContext context) => AuthService(child: _app);
}
