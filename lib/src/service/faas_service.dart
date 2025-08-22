library;

import 'package:flutter/material.dart';
import 'package:flutter_controls_core/flutter_controls_core.dart';
import 'package:ferry/ferry.dart';
import 'package:gql_http_link/gql_http_link.dart';

import 'package:flutter_controls_core/src/service/faas/schema/__generated__/to_clinks.req.gql.dart';
import 'package:flutter_controls_core/src/service/faas/schema/__generated__/to_unix.req.gql.dart';

abstract interface class FaasServiceAPI {
  Future<int?> clinksToUnix(int clinks);
  Future<int> unixToClinks(int time);
}

final class FaasService implements FaasServiceAPI {
  final Client _q;

  static Map<String, String> _buildAuthHeader(String? jwt) =>
      jwt != null ? {"Authorization": "Bearer $jwt"} : {};

  // Constructor. This creates the HTTP link needed to communicate with our
  // GraphQL endpoint.

  FaasService({String? jwt})
    : _q = Client(
        link: HttpLink(
          "https://acsys-proxy.fnal.gov:8001/faas",
          defaultHeaders: _buildAuthHeader(jwt),
        ),
        cache: Cache(),
      );

  Future<Result> _rpc<TData, TVars, Result>(
    OperationRequest<TData, TVars> req, {
    Result Function(TData)? xlat,
  }) => _q.request(req).where((response) => !response.loading).first.then((
    value,
  ) {
    if (value.hasErrors) {
      if (value.linkException != null) {
        throw value.linkException!;
      } else if (value.graphqlErrors != null) {
        throw Exception(value.graphqlErrors);
      } else {
        throw Exception("unknown error");
      }
    } else {
      final data = value.data;

      if (data != null) {
        return xlat != null ? xlat(data) : data as Result;
      } else {
        throw Exception("no data was returned from request");
      }
    }
  });

  @override
  Future<int?> clinksToUnix(int clinks) =>
      _rpc(GToUnixReq((b) => b..vars.clinks = clinks));

  @override
  Future<int> unixToClinks(int time) =>
      _rpc(GToClinksReq((b) => b..vars.time = time));
}

/// A widget that provides access to the FaaS Service API. This doesn't
/// exist in the widget tree, nor does it do anything but provide access
/// to the API using the `Faas.api()` method.

final class Faas {
  /// Returns an object supporting the Faas API.
  ///
  /// Any widget that uses this to retrieve the FaaS service object will
  /// get registered if the [FaasProvider] gets rebuilt.

  static FaasServiceAPI api(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<_FaasProviderIW>()!.service;
}

/// Provides the FaaS API to the application.
///
/// If an application wishes to use the FaaS API, it should place an instance
/// of this widget near the top of its tree so it doesn't get rebuilt. With
/// this in the tree, other widgets can use the API by calling [Faas.api()]
/// to get an [FaasServiceAPI] object which implements the API.
///
/// Although this widget can be created and placed in the tree manually, it is
/// recommended to use the [FaasProvider.factory()] method to create this
/// widget. This method returns a function that can be added to the list
/// passed to the `providers` parameter of the [StandardApp] widget. Doing so
/// ensures the FaaS provider can be used by all widgets in the application --
/// even those in the [AppBar] and [Drawer] widgets. It also ensures that the
/// widget has access to the [AthService] object so it can use authorization
/// tokens to communicate with the FaaS API, if necessary.
final class FaasProvider extends StatelessWidget {
  final Widget child;
  final FaasServiceAPI? service;

  /// A factory function that creates a [FaasProvider] widget.
  ///
  /// This function returns a function that can be added to the list passed to
  /// the `providers` parameter of the [StandardApp] widget.
  ///
  /// - [service] is an optional object which implements the [FaasServiceAPI]
  ///   interface. If this option is omitted, the widget will use communicate
  ///   with the official GraphQL service.
  /// - [key] is an optional identifier for the widget.

  static FaasProvider Function({required Widget child}) factory({
    FaasServiceAPI? service,
    Key? key,
  }) =>
      ({required Widget child}) =>
          FaasProvider._(service: service, key: key, child: child);

  // Creates the widget.
  //
  // - [child] is the widget subtree that gets added to the tree below this
  //   widget.
  // - [key] is an optional identifier for the widget.
  // - [service] is an optional obect which implements the [FaasServiceAPI]
  //   interface. If this option is omitted, the widget will use an
  //   implementation that communicates over the network to the offcial
  //   control system API. This option is mainly to mock-up a service to
  //   use in unit tests.
  const FaasProvider._({this.service, required this.child, super.key});

  @override
  Widget build(BuildContext context) => _FaasProviderIW(
    service: service ?? FaasService(jwt: AuthService.getJwt(context)),
    child: child,
  );
}

// The inherited widget that provides the ACSys API to the application. This
// is a private class which holds a spot in the widget tree where the service
// object is stored. Inherited Widgets provide registration so that widgets
// can be rapidly rebuilt when the service object changes.

final class _FaasProviderIW extends InheritedWidget {
  final FaasServiceAPI service;

  const _FaasProviderIW({required this.service, required super.child});

  @override
  bool updateShouldNotify(covariant _FaasProviderIW oldWidget) =>
      service != oldWidget.service;
}
