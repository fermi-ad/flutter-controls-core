/// A Flutter package with resources that most Fermi applications need.

library flutter_controls_core;

import "package:flutter/material.dart";
import "src/auth_widget.dart";

export 'src/status.dart';
export 'src/device_values.dart';
export 'src/app_scaffold.dart';
export 'src/auth_widget.dart';

export 'service/acsys/service.dart';

export 'package:openid_client/openid_client.dart' show Credential;

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

Future<void> runFermiApp(
    {required Widget appWidget, AuthInfo? authInfo}) async {
  if (authInfo != null) {
    await initAuth(authInfo.realm, authInfo.clientId, authInfo.clientSecret,
        authInfo.scopes);
  }

  return runApp(appWidget);
}
