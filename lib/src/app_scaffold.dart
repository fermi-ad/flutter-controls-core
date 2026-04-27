/// A set of widgets that are the foundation of a Fermi application.

library;

import 'package:flutter/material.dart';
import 'package:flutter_controls_auth/flutter_controls_auth.dart';
import 'package:go_router/go_router.dart';
import 'fermi_theme.dart';
import 'package:bison_design_system/bison_design_system.dart';

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

// Resolves the light and dark [ThemeData] based on the [useBison] flag.
//
// When [useBison] is true, the Bison design system themes are returned.
// When false (default), the Fermi core themes are returned.
({ThemeData light, ThemeData dark}) _resolveTheme(bool useBison) => (
  light: useBison ? BisonThemeData.light() : _GlobalAppTheme.lightTheme,
  dark: useBison ? BisonThemeData.dark() : _GlobalAppTheme.darkTheme,
);

Widget buildAuthHeader(
  final IconData icon,
  final String account,
  final (String, void Function())? buttonInfo,
  final Widget? subtitle,
) => Padding(
  padding: const .symmetric(vertical: 8.0, horizontal: 8.0),
  child: Row(
    children: [
      Expanded(
        flex: 3,
        child: Column(
          mainAxisSize: .max,
          children: <Widget>[
            Icon(icon, size: 48.0),
            const SizedBox(height: 8.0),
            Text(
              account,
              style: const TextStyle(fontWeight: .bold),
              textAlign: .center,
            ),
            ?subtitle,
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
  final missing = needed
      .where((role) => !AuthService.inRole(context, role))
      .toList();

  if (missing.isEmpty) return null;

  final colorScheme = Theme.of(context).colorScheme;

  return Column(
    mainAxisSize: .min,
    children: [
      const SizedBox(height: 12.0),
      Row(
        mainAxisAlignment: .center,
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
              fontWeight: .bold,
            ),
          ),
        ],
      ),
      const SizedBox(height: 8.0),
      Wrap(
        spacing: 4.0,
        runSpacing: 4.0,
        alignment: .center,
        children: missing
            .map(
              (role) => Container(
                padding: const .symmetric(horizontal: 8.0, vertical: 2.0),
                decoration: BoxDecoration(
                  color: colorScheme.errorContainer,
                  borderRadius: .circular(4.0),
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

    final content = switch ((
      userInfo,
      AuthService.authRequired || neededRoles.isNotEmpty,
    )) {
      // For this case, the application didn't set up authentication parameters
      // so it plans to run with no privilieges. If the application tries to
      // use a service that needs authorization, the service will return an
      // error.
      (_, false) => buildAuthHeader(
        Icons.no_accounts_sharp,
        "No login required",
        null,
        null,
      ),

      (null, true) => buildAuthHeader(
        Icons.no_accounts_sharp,
        "Unauthorized",
        ("Login", () => AuthService.requestLogin(context)),
        _buildMissingRolesWarning(context, neededRoles),
      ),

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
        padding: const .all(8.0),
        child: Column(
          children: [
            _DrawerHeader(neededRoles: neededRoles),
            Divider(),
            Expanded(
              child: SingleChildScrollView(
                child: SizedBox(
                  width: .infinity,
                  child: content ?? Container(),
                ),
              ),
            ),
            Divider(),
            Text(
              "© 2025, 2026 Fermi Forward Discovery\nGroup, LLC, All rights reserved.",
              textAlign: .center,
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
/// you can build an application that follows look-and-feel of our
/// applications and supports expected features:
///
/// * Uses our official light and dark mode themes to standardize on colors
///   and fonts
/// * Layout of top-level widgets will be consistent ([NavigationBar],
///   [AppBar], [Drawer])
/// * Authentication via KeyCloak
/// * Opt-in for any of our GraphQL services
/// * Global state support (for sharing data between the drawer and main
///   body, for instance.)
///
/// If you want to share mutable state throughout your application, specify a
/// type in the `StandardApp` generic type. The type must extend
/// [ChangeNotifier] so that changes to the global state can be recognized by
/// the widgets using the state. Anytime the global state is changed, it must
/// call [notifyListeners]. A way to ensure this is to define set properties
/// on the type. to gain access to the global state, a widget can call
/// [StandardApp.getGlobalState] in its [build] method.
///

final class StandardApp<T extends ChangeNotifier?> extends StatelessWidget {
  final T? _model;

  /// Used for the title of the web page (for web targets.)
  final String title;

  /// The body of the application. This will inhabit the main area of the
  /// application.
  final Widget? body;

  /// The main body of the drawer.
  ///
  /// [StandardApp] creates a drawer on the left side. It automatically
  /// creates a header and footer for the drawer. The main portion, however,
  /// can be specified by the developer using this parameter.
  final Widget? drawerContent;

  /// Creates [Widget]s that reside above the [Scaffold] widget.
  ///
  /// [providers] is a list of functions. This is a way to add [Widget]s that
  /// are located in the widget tree higher than the [Scaffold] widget (i.e.
  /// the main, application framework.) Each function takes a [Widget] as a
  /// parameter and returns a [Widget]. It is assumed that the passed [Widget]
  /// will end up being a child of the [Widget] that was returned.
  ///
  /// Provider widgets should *not* require being redrawn. If they do, it'll
  /// make the entire application redraw, which is expensive and slow.
  ///
  /// The main purpose of this parameter is to register widgets that provide
  /// an API to our various GraphQL services. For instance, if an application
  /// wants to obtain device readings, it needs the ACSys GraphQL service. To
  /// use it, this parameter would be set to `[ACSysProvider.factory()]`.
  final List<Widget Function({required Widget child})> providers;

  /// Creates a floating action button.
  final Widget? floatingActionButton;

  /// [appBar] will be displayed as the application's title bar.
  final PreferredSizeWidget? appBar;

  final Set<String> _neededRoles;
  final ThemeMode themeMode;

  /// Defines what design to use. When set to false (default) the theme used
  /// will be the one defined by the core library. When true, the theme defined by
  /// [BisonThemeData] will be used
  final bool useBison;

  StandardApp({
    required this.title,
    T? model,
    this.appBar,
    this.body,
    this.drawerContent,
    this.floatingActionButton,
    this.providers = const [],
    List<String>? neededRoles,
    this.themeMode = ThemeMode.system,
    this.useBison = false,
    super.key,
  }) : _model = model,
       _neededRoles = neededRoles?.toSet() ?? {};

  /// Returns the model shared by the whole application.
  ///
  /// This will return `null` if there is no global model being used. The
  /// model extends [ChangeNotifier] so the returned value should be used
  /// with a [ListenableBuilder] so it knows when to rebuild its dependent
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

    final theme = _resolveTheme(useBison);

    return MaterialApp(
      title: title,
      theme: theme.light,
      darkTheme: theme.dark,
      themeMode: themeMode,
      home: AuthService(
        child: null is T
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

  /// Defines what design to use. When set to false (default) the theme used
  /// will be the one defined by the core library. When true, the theme defined by
  /// the [BisonThemeData] will be used
  final bool useBison;

  const _RouterApp({
    required this.title,
    required this.router,
    this.useBison = false,
  });

  // Return the MaterialApp widget which will define the look-and-feel for
  // the application.
  @override
  Widget build(BuildContext context) {
    final theme = _resolveTheme(useBison);

    return MaterialApp.router(
      title: title,
      theme: theme.light,
      darkTheme: theme.dark,
      routerConfig: router,
    );
  }
}

/// Creates an application scaffold that uses the `GoRouter` package.
///
/// This class creates a widget that supports Material Design and uses the
/// GoRouter package to navigate through the app. The theme is set to a
/// standardized, Fermilab-curated configuration.

final class NonAuthRouterApp extends StatelessWidget {
  final _RouterApp _app;

  NonAuthRouterApp({
    required String title,
    required GoRouter router,
    bool useBison = false,
    super.key,
  }) : _app = _RouterApp(title: title, router: router, useBison: useBison);

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

  AuthRouterApp({
    required String title,
    required GoRouter router,
    bool useBison = false,
    super.key,
  }) : _app = _RouterApp(title: title, router: router, useBison: useBison);

  // Return the MaterialApp widget which will define the look-and-feel for the
  // application.
  @override
  Widget build(BuildContext context) => AuthService(child: _app);
}
