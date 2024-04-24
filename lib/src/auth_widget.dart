/// Provides authentication services to Flutter apps.
///
///

library auth_widget;

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:openid_client/openid_client.dart';
import 'openid_io.dart' if (dart.library.html) 'openid_browser.dart' as oid;

import 'dart:developer' as dev;

typedef ScopeList = List<String>;

class AuthInfo {
  final String realm;
  final String clientId;
  final String clientSecret;
  final List<String> scopes;

  const AuthInfo(
      {required this.realm,
      required this.clientId,
      required this.clientSecret,
      this.scopes = const []});
}

Credential? _credentials;
late Future<Credential?> Function() _authenticate;

Future<void> initAuth(String realm, String clientId, String clientSecret,
    List<String> scopes) async {
  final uri = Uri.parse('https://adkube-auth.fnal.gov/realms/$realm/');
  const Duration tmo = Duration(seconds: 2);

  final issuer = await Issuer.discover(uri).timeout(tmo);
  final Client client = Client(issuer, clientId, clientSecret: clientSecret);

  _authenticate = () async {
    if (_credentials == null) {
      try {
        return oid.authenticate(client, scopes: scopes).timeout(tmo);
      } on TimeoutException {
        dev.log('timeout communicating with KeyCloak', name: "auth");
        return null;
      }
    }
    return _credentials;
  };

  _credentials = await oid.getRedirectResult(client, scopes: scopes);
}

class _AuthCredentials extends InheritedWidget {
  final Credential? credentials;
  final UserInfo? userInfo;

  _AuthCredentials({this.userInfo, required super.child})
      : credentials = _credentials;

  @override
  bool updateShouldNotify(covariant _AuthCredentials oldWidget) =>
      oldWidget.credentials != credentials || oldWidget.userInfo != userInfo;
}

/// Provides authentication services.
///
/// This widget should be placed near the Scaffold of an application to minimize
/// updates. Each update may trigger a new sign-on session. When this widget is
/// created, the application isn't automatically authenticated. To initiate
/// authentication, the [requestAuthentication] method should be called. This
/// allows an application to run with limited features when not authenticated.

class AuthService extends StatefulWidget {
  final Widget child;

  const AuthService({required this.child, super.key});

  @override
  State<AuthService> createState() => _AuthState();

  static Credential? getCreds(BuildContext context) => context
      .dependOnInheritedWidgetOfExactType<_AuthCredentials>()
      ?.credentials;

  static UserInfo? getUserInfo(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<_AuthCredentials>()?.userInfo;

  static Future<void> requestLogin(BuildContext context) async =>
      await context.findAncestorStateOfType<_AuthState>()?.requestLogin();

  static Future<void> requestLogout(BuildContext context) async =>
      await context.findAncestorStateOfType<_AuthState>()?.requestLogout();
}

class _AuthState extends State<AuthService> {
  UserInfo? userInfo;

  bool get authenticated => _credentials != null;

  // Set-up a background process to retrieve the user's information.

  Future<void> getUserInfo() async {
    _credentials
        ?.getUserInfo()
        .then((value) => setState(() => userInfo = value))
        .catchError((err) => dev.log("userInfo returned $err"));
  }

  @override
  void initState() {
    super.initState();

    // If the credentials aren't `null`, then we can retrieve the user
    // information. Start a background task to access the user info.

    if (authenticated) {
      Future<void>.microtask(getUserInfo);
    }
  }

  Future<void> requestLogin() async {
    final creds = await _authenticate();

    if (creds != null) {
      final user = await creds.getUserInfo();

      setState(() {
        _credentials = creds;
        userInfo = user;
      });
    }
  }

  /// Requests the app's credentials be revoked.
  ///
  /// This method will clear out the local credentials and request the server
  /// invalid the authentication token.

  Future<void> requestLogout() async {
    // await _credentials?.revoke();
    setState(() {
      _credentials = null;
      userInfo = null;
    });
  }

  @override
  Widget build(BuildContext context) =>
      _AuthCredentials(userInfo: userInfo, child: widget.child);
}
