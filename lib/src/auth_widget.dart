/// Provides authentication services to Flutter apps.
///
///

library auth_widget;

import 'package:flutter/material.dart';
import 'package:openid_client/openid_client.dart';
import 'openid_io.dart' if (dart.library.html) 'openid_browser.dart' as oid;

typedef ScopeList = List<String>;

// Private class that notifies registered clients when the credentials are
// updated.

class _AuthService extends InheritedWidget {
  final void Function(ScopeList?) requestAuth;
  final Credential? credentials;

  const _AuthService(
      {this.credentials, required this.requestAuth, required super.child});

  // Find an instance of the authentication service in the widget tree. If the
  // service isn't ready, this will return `null`.

  static _AuthService of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<_AuthService>()!;

  // If this widget gets rebuilt, we don't need to notify clients, if the
  // `Client` object is the same. If it's different, we might need to
  // re-authenticate, so we'll notify the clients.

  @override
  bool updateShouldNotify(_AuthService oldWidget) =>
      oldWidget.credentials != credentials;
}

/// Provides authentication services.
///
/// This widget should be placed near the Scaffold of an application to minimize
/// updates. Each update may trigger a new sign-on session. When this widget is
/// created, the application isn't automatically authenticated. To initiate
/// authentication, the [requestAuthentication] method should be called. This
/// allows an application to run with limited features when not authenticated.

class AuthService extends StatefulWidget {
  final Uri url;
  final String clientId;
  final String clientSecret;
  final Widget child;

  /// Creates an instance of an authentication session.
  ///
  /// [realm] indicates the realm in which the application wants access.
  ///
  /// [clientId] is a site-assigned value for the application. Each application
  /// should have its own ID. This value generated from our KeyCloak server.
  ///
  /// [clientSecret] is a secret associated with the client ID.
  ///
  /// [child] is the top-level widget under this widget. All widgets, starting
  /// at `child`, will be able to request authentication and get access to the
  /// user's credentials.

  AuthService(
      {required String realm,
      required this.clientId,
      required this.clientSecret,
      required this.child,
      super.key})
      : url = Uri(
            scheme: "https",
            host: "adkube-auth.fnal.gov",
            path: "/realms/$realm/");

  @override
  State<AuthService> createState() => _AuthState();

  /// Accesses the current credentials.
  ///
  /// This function should be called from within a widget's `build()` method.
  /// It returns the current credentials (could be `null` if the user hasn't
  /// signed in.) This also registers the widget to get updated when the
  /// credentials change.

  static Credential? getCreds(BuildContext context) =>
      _AuthService.of(context).credentials;

  /// Requests that the app be authenticated.
  ///
  /// This method will start a sign-on session to get the user's credentials.
  /// The context that is passed to this function will be refreshed when the
  /// credentials are updated.

  static void requestAuthentication(BuildContext context, ScopeList scope) =>
      _AuthService.of(context).requestAuth(scope);

  /// Requests the app's credentials be revoked.
  ///
  /// This method will clear out the local credentials and request the server
  /// invalid the authentication token. The context that is passed to this
  /// function will be refreshed when the credentials are cleared.

  static Future<void> requestLogout(BuildContext context) async {
    final Credential? creds = AuthService.getCreds(context);

    if (creds != null) {
      return (await creds.revoke());
    } else {
      return Future.value();
    }
  }
}

class _AuthState extends State<AuthService> {
  Future<Credential>? _fut;

  Future<Credential?> _initFuture(ScopeList? scopes) async {
    if (scopes != null) {
      final issuer = await Issuer.discover(widget.url);
      final client =
          Client(issuer, widget.clientId, clientSecret: widget.clientSecret);

      return (await oid.authenticate(client, scopes: scopes));
    } else {
      return null;
    }
  }

  // Render the widgets. This uses a FutureBuilder to monitor the life of the
  // authentication Client. All of what gets rendered in the widget tree,
  // however, is based on the child widget.

  @override
  Widget build(BuildContext context) => FutureBuilder(
      future: _fut,
      initialData: null,
      builder: (context, snapshot) {
        // If there's an error, report it via SnackBar.

        if (snapshot.hasError) {
          final snackBar = SnackBar(
            content: Text('Unable to authenticate: ${snapshot.error}.'),
          );

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }

        return _AuthService(
            credentials: snapshot.data,
            requestAuth: (scope) => setState(() => _initFuture(scope)),
            child: widget.child);
      });
}
