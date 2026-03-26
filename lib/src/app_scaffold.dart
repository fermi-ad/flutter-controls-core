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
  final (String, void Function())? buttonInfo, [
  final Widget? subtitle,
]) => Padding(
  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
  child: Row(
    children: [
      Expanded(
        flex: 3,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Icon(icon, size: 48.0),
            const SizedBox(height: 8.0),
            Text(
              account,
              style: const TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            if (subtitle != null) subtitle,
          ],
        ),
      ),
      if (buttonInfo != null) ...[
        const SizedBox(height: 12.0),
        Expanded(
          flex: 2,
          child: ElevatedButton(
            onPressed: buttonInfo.$2,
            child: Text(buttonInfo.$1),
          ),
        ),
      ],
    ],
  ),
);

Widget? _buildMissingRolesWarning(BuildContext context, Set<String> needed) {
  final missing =
      needed.where((role) => !AuthService.inRole(context, role)).toList();

  if (missing.isEmpty) return null;

  final colorScheme = Theme.of(context).colorScheme;

  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      const SizedBox(height: 12.0),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.warning_amber_rounded,
            color: colorScheme.error,
            size: 16.0,
          ),
          const SizedBox(width: 4.0),
          Text(
            "Missing Roles",
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: colorScheme.error,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      const SizedBox(height: 8.0),
      Wrap(
        spacing: 4.0,
        runSpacing: 4.0,
        alignment: WrapAlignment.center,
        children:
            missing
                .map(
                  (role) => Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 2.0,
                    ),
                    decoration: BoxDecoration(
                      color: colorScheme.errorContainer,
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Text(
                      role,
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: colorScheme.onErrorContainer,
                      ),
                    ),
                  ),
                )
                .toList(),
      ),
    ],
  );
}

// Private widget used to display content in the side, drawer menu's header.

final class _DrawerHeader extends StatelessWidget {
  final Set<String> neededRoles;

  const _DrawerHeader({this.neededRoles = const {}});

  @override
  Widget build(BuildContext context) {
    final UserInfo? userInfo = AuthService.getUserInfo(context);

    final content = switch ((userInfo, AuthService.authRequired)) {
      // For this case, the application didn't set up authentication parameters
      // so it plans to run with no privilieges. If the application tries to
      // use a service that needs authorization, the service will return an
      // error.
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
        _buildMissingRolesWarning(context, neededRoles),
      ),
    };

    return content;
  }
}

final class _Drawer extends StatelessWidget {
  final Widget? content;
  final Set<String> neededRoles;

  const _Drawer(this.content, this.neededRoles);

  @override
  Widget build(BuildContext context) {
    final ThemeData td = Theme.of(context);

    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            _DrawerHeader(neededRoles: neededRoles),
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
              "© 2025, 2026 Fermi Forward Discovery\nGroup, LLC, All rights reserved.",
              textAlign: TextAlign.center,
              style: td.textTheme.bodySmall?.copyWith(color: td.disabledColor),
            ),
          ],
        ),
      ),
    );
  }
}

class _GlobalStateProvider<T extends ChangeNotifier> extends InheritedWidget {
  final T model;

  const _GlobalStateProvider({required this.model, required super.child});

  @override
  bool updateShouldNotify(covariant _GlobalStateProvider<T> oldWidget) => false;
}

/// Creates the foundation of a scaffold-based app.
///
/// This creates a scaffold widget that uses Fermilab's theme and application
/// conventions.
///
/// [StandardApp] provides developers quite a bit of common, standardized
/// features that we expect from our applications. By using [StandardApp],
/// you can build an application that follows look-and-feel of our applications
/// and supports expected features:
///
/// * Uses our official light and dark mode themes to standardize on colors and
///   fonts
/// * Layout of top-level widgets will be consistent ([AppBar],
///   [NavigationBar], [Drawer])
/// * Authentication via KeyCloak
/// * Opt-in for any of our GraphQL services
/// * Global state support (for sharing data between the drawer and main body,
///   for instance.)

final class StandardApp<T extends ChangeNotifier?> extends StatelessWidget {
  final T? _model;

  /// Used for the title of the web page (for web targets.)
  final String title;

  /// The body of the application. This will inhabit the main area of the
  /// application.
  final Widget? body;

  /// The main body of the drawer.
  ///
  /// [StandardApp] creates a drawer on the left side. It automatically creates
  /// a header and footer for the drawer. The main portion, however, can be
  /// specied by the developer using this parameter.
  final Widget? drawerContent;

  /// Creates [Widget]s that reside above the [Scaffold] widget.
  ///
  /// This is a way to add [Widget]s that are located in the widget tree higher
  /// than the [Scaffold] widget (i.e. the main, application framework.)
  /// [providers] is a list of functions. Each function takes a [Widget] as a
  /// parameter and returns a [Widget]. It is assumed that the passed [Widget]
  /// will end up being a child of the [Widget] that was returned.
  ///
  /// The main purpose of this parameter is to register widgets that provide an
  /// API to our various GraphQL services.
  ///
  /// Provider widgets should *not* require being redrawn. If they do, it'll
  /// make the entire application redraw, which is expensive and slow.
  final List<Widget Function({required Widget child})> providers;

  /// Creates a floating action button.
  final Widget? floatingActionButton;

  /// [appBar] will be displayed as the application's title bar.
  final PreferredSizeWidget? appBar;

  final Set<String> _neededRoles;

  StandardApp({
    required this.title,
    T? model,
    this.appBar,
    this.body,
    this.drawerContent,
    this.floatingActionButton,
    this.providers = const [],
    List<String>? neededRoles,
    super.key,
  }) : _model = model,
       _neededRoles = neededRoles?.toSet() ?? {};

  /// Returns the model shared by the whole application.
  ///
  /// This will return `null` if there is no global model being used. The
  /// model extends [ChangeNotifier] so the returned value should be used
  /// with a [ListenableBuilder] so it knows when to rebuild it's dependent
  /// widgets.
  static T? getGlobalState<T extends ChangeNotifier>(BuildContext context) =>
      context.getInheritedWidgetOfExactType<_GlobalStateProvider<T>>()?.model;

  @override
  Widget build(BuildContext context) {
    final scaffold = providers.fold<Widget>(
      Scaffold(
        appBar: appBar,
        body: body,
        drawer: _Drawer(drawerContent, _neededRoles),
        floatingActionButton: floatingActionButton,
      ),
      (w, p) => p(child: w),
    );

    return MaterialApp(
      title: title,
      theme: _GlobalAppTheme.lightTheme,
      darkTheme: _GlobalAppTheme.darkTheme,
      home: AuthService(
        child:
            null is T
                ? scaffold
                : _GlobalStateProvider(
                  model: _model as ChangeNotifier,
                  child: scaffold,
                ),
      ),
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
