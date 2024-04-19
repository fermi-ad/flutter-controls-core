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

    dev.log('getting issuer', name: "auth");

    final issuer = await Issuer.discover(uri).timeout(tmo);

    dev.log('got issuer: ${issuer.metadata.authorizationEndpoint}',
        name: "auth");

    final Client client = Client(issuer, clientId, clientSecret: clientSecret);

    _credentials = await oid.getRedirectResult(client, scopes: scopes);

    if (_credentials == null) {
      dev.log('performing authentication', name: "auth");

      _credentials =
          await oid.authenticate(client, scopes: scopes).timeout(tmo);
    }
  } on TimeoutException {
    dev.log('timeout communicating with KeyCloak', name: "auth");
  }
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

  static Credential? getCreds() => _credentials;

  /// Requests the app's credentials be revoked.
  ///
  /// This method will clear out the local credentials and request the server
  /// invalid the authentication token.

  static Future<void> requestLogout() =>
      _credentials?.revoke() ?? Future.value();
}

class _AuthState extends State<AuthService> {
  // Render the widgets. This uses a FutureBuilder to monitor the life of the
  // authentication Client. All of what gets rendered in the widget tree,
  // however, is based on the child widget.

  @override
  Widget build(BuildContext context) => Container(child: widget.child);
}
