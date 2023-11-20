import 'dart:async';

import 'package:openid_client/openid_client.dart';
import 'package:openid_client/openid_client_browser.dart' as browser;

Future<Credential> authenticate(Client client,
    {List<String> scopes = const []}) async {
  browser.Authenticator(client, scopes: scopes).authorize();

  return Completer<Credential>().future;
}

Future<Credential?> getRedirectResult(Client client,
        {List<String> scopes = const []}) =>
    browser.Authenticator(client, scopes: scopes).credential;
