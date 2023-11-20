library auth_widget;

import 'package:flutter/material.dart';
import 'package:openid_client/openid_client.dart';
import 'openid_io.dart' if (dart.library.html) 'openid_browser.dart' as oid;

class AuthWidget extends StatefulWidget {
  final Uri url;
  final String clientId;
  final String clientSecret;
  final Widget child;

  AuthWidget(
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
  State<AuthWidget> createState() => _AuthState();
}

class _AuthState extends State<AuthWidget> {
  Future<Client>? _fut;

  // Creates a future which builds an authentication Client asynchronously. If
  // this method gets called outside of `initState()`, it should be wrapped
  // with `setState()` like so: `setState(_createFuture)`.

  void _createFuture() {
    _fut = Issuer.discover(widget.url).then((value) =>
        Client(value, widget.clientId, clientSecret: widget.clientSecret));
  }

  // Create initial state by starting a Future that builds the authentication
  // client asynchronously.

  @override
  void initState() {
    _createFuture();
    super.initState();
  }

  // Render the widgets. This uses a FutureBuilder to monitor the life of the
  // authentication Client. All of what gets rendered in the widget tree,
  // however, is based on the child widget.

  @override
  Widget build(BuildContext context) => FutureBuilder(
      future: _fut,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return AuthService(snapshot.data!, child: widget.child);
        } else {
          return widget.child;
        }
      });
}

/// Handles authenticating the client.
///
/// This widget is automatically inserted in the widget tree once the
/// authentication state has been initialized. Applications do not create
/// instances of this class directly.
///
/// A client uses `AuthService.maybeOf(context)` to retrieve a reference to the
/// authentication service. If the method returns `null`, it means there was an
/// error setting up the service. Applications should use a `null` to generate
/// an interface that doesn't require authentication. It may be impossible for
/// an application to create a useful interface. In that case, displaying an
/// error message may be the most appropriate action.

class AuthService extends InheritedWidget {
  final Client _client;

  const AuthService(this._client, {super.key, required super.child});

  /// Find an instance of the authentication service in the widget tree. If the
  /// service isn't ready, this will return `null`.

  static AuthService? maybeOf(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<AuthService>();

  /// If this widget gets rebuilt, we don't need to notify clients, if the
  /// `Client` object is the same. If it's different, we might need to
  /// re-authenticate, so we'll notify the clients.

  @override
  bool updateShouldNotify(AuthService oldWidget) =>
      oldWidget._client != _client;

  /// Performs the authentication asynchronously.

  Future<Credential> authenticate({List<String> scopes = const []}) async =>
      oid.authenticate(_client, scopes: scopes);
}
