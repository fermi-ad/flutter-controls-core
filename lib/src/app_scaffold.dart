/// A set of widgets that are the foundation of a Fermi application.

library;

import 'package:flutter/material.dart';
import 'package:flutter_controls_auth/flutter_controls_auth.dart';
import 'package:go_router/go_router.dart';
import 'fermi_theme.dart';

// Our Fermi theme generated with - https://m3.material.io/theme-builder#/custom

final class _GlobalAppTheme {
  _GlobalAppTheme._();

  static const String _fontFamily = 'Local Roboto';

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: lightColorScheme,
    fontFamily: _fontFamily,
    package: 'flutter_controls_core',
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: darkColorScheme,
    fontFamily: _fontFamily,
    package: 'flutter_controls_core',
  );
}

Widget buildAuthHeader(
  final IconData icon,
  final String account,
  final (String, void Function())? buttonInfo,
) => Row(
  mainAxisAlignment: MainAxisAlignment.start,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: <Widget>[
    Expanded(
      flex: 3,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(icon, size: 40.0),
            SizedBox(height: 4.0), // Spacer
            Text(account),
          ],
        ),
      ),
    ),
    if (buttonInfo != null)
      Expanded(
        flex: 2,
        child: Center(
          child: ElevatedButton(
            onPressed: buttonInfo.$2,
            child: Text(buttonInfo.$1),
          ),
        ),
      ),
  ],
);

// Private widget used to display content in the side, drawer menu's header.

final class _DrawerHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UserInfo? userInfo = AuthService.getUserInfo(context);

    final content = switch ((userInfo, AuthService.authRequired)) {
      // For this case, the application didn't set up authentication parameters so
      // it plans to run with no privilieges. If the application tries to use a service
      // that needs authorization, the service will return an error.
      (_, false) => buildAuthHeader(
        Icons.no_accounts_sharp,
        "No login required",
        null,
      ),

      (null, true) => buildAuthHeader(Icons.no_accounts_sharp, "Unauthorized", (
        "Login",
        () => AuthService.requestLogin(context),
      )),

      (UserInfo user, true) => buildAuthHeader(
        Icons.account_circle,
        user.name ?? "UNKNOWN",
        ("Logout", () => AuthService.requestLogout(context)),
      ),
    };

    return content;
  }
}

final class _Drawer extends StatelessWidget {
  final Widget? content;

  const _Drawer(this.content);

  @override
  Widget build(BuildContext context) {
    final ThemeData td = Theme.of(context);

    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            _DrawerHeader(),
            Divider(),
            Expanded(
              child: SingleChildScrollView(
                child: SizedBox(
                  width: double.infinity,
                  child: content ?? Container(),
                ),
              ),
            ),
            Divider(),
            Text(
              "© 2025 Fermi Forward Discovery Group, LLC\nAll rights reserved.",
              textAlign: TextAlign.center,
              style: td.textTheme.bodySmall?.copyWith(color: td.disabledColor),
            ),
          ],
        ),
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
  final Widget? drawerContent;
  final List<Widget Function({required Widget child})> providers;
  final Widget? floatingActionButton;
  final PreferredSizeWidget? appBar;

  const StandardApp({
    required this.title,
    this.appBar,
    this.body,
    this.drawerContent,
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
        drawer: _Drawer(drawerContent),
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
/// standardized, Fermilab-curated configuration.

final class AuthRouterApp extends StatelessWidget {
  final _RouterApp _app;

  AuthRouterApp({required String title, required GoRouter router, super.key})
    : _app = _RouterApp(title: title, router: router);

  // Return the MaterialApp widget which will define the look-and-feel for the
  // application.
  @override
  Widget build(BuildContext context) => AuthService(child: _app);
}
