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

Credential? _credentials;

Future<void> initAuth(String realm, String clientId, String clientSecret,
    List<String> scopes) async {
  try {
    final uri = Uri.parse('https://adkube-auth.fnal.gov/realms/$realm/');
    const Duration tmo = Duration(seconds: 2);

    final issuer = await Issuer.discover(uri).timeout(tmo);
    final Client client = Client(issuer, clientId, clientSecret: clientSecret);

    _credentials = await oid.getRedirectResult(client, scopes: scopes);
    _credentials ??=
          await oid.authenticate(client, scopes: scopes).timeout(tmo);
  } on TimeoutException {
    dev.log('timeout communicating with KeyCloak', name: "auth");
  }
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

  /// Requests the app's credentials be revoked.
  ///
  /// This method will clear out the local credentials and request the server
  /// invalid the authentication token.

  static Future<void> requestLogout() async => _credentials?.revoke();
}

class _AuthState extends State<AuthService> {
  UserInfo? userInfo;

  @override
  void initState() {
    super.initState();
    _credentials
        ?.getUserInfo()
        .then((value) => setState(() => userInfo = value))
        .catchError((err) => dev.log("userInfo returned $err"));
  }

  @override
  Widget build(BuildContext context) =>
      _AuthCredentials(userInfo: userInfo, child: widget.child);
}
