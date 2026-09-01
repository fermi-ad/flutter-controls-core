import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_controls_core/flutter_controls_core.dart'
    show NonAuthRouterApp, StandardApp;
import 'package:go_router/go_router.dart' show GoRoute, GoRouter;

/// A minimal [ChangeNotifier] used to exercise [StandardApp]'s global state.
class _CounterModel extends ChangeNotifier {
  int value = 0;
}

/// A widget that reads the global state via [StandardApp.getGlobalState] and
/// renders its value. Used to prove the [_GlobalStateProvider] is planted in
/// the tree with the *concrete* model type (not erased to [ChangeNotifier]).
class _GlobalStateReader extends StatelessWidget {
  const _GlobalStateReader();

  @override
  Widget build(BuildContext context) {
    final model = StandardApp.getGlobalState<_CounterModel>(context);

    return Text(
      model == null ? 'no-model' : 'value=${model.value}',
      textDirection: TextDirection.ltr,
    );
  }
}

void main() {
  group('App scaffolds (smoke)', () {
    testWidgets('StandardApp builds (no auth)', (tester) async {
      await tester.pumpWidget(
        StandardApp(
          title: 'Test App',
          body: const Center(child: Text('Hello')),
        ),
      );

      expect(find.text('Hello'), findsOneWidget);
    });

    testWidgets('NonAuthRouterApp builds', (tester) async {
      final router = GoRouter(
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) =>
                const Scaffold(body: Center(child: Text('Home'))),
          ),
        ],
      );

      await tester.pumpWidget(
        MaterialApp(
          home: NonAuthRouterApp(title: 'Router App', router: router),
        ),
      );

      // Let router settle.
      await tester.pumpAndSettle();

      expect(find.text('Home'), findsOneWidget);
    });
  });

  group('StandardApp global state typing', () {
    // Case 1: No type parameter supplied. `T` defaults to its bound
    // (`ChangeNotifier`), no model is passed, and no `_GlobalStateProvider`
    // is planted. This must compile and render normally.
    testWidgets('compiles and builds with no type parameter', (tester) async {
      // Deliberately no `<...>` and no `model:` argument.
      await tester.pumpWidget(
        StandardApp(
          title: 'No Global State',
          body: const Center(child: Text('stateless-ok')),
        ),
      );

      expect(find.text('stateless-ok'), findsOneWidget);
    });

    // Case 2: A concrete type parameter that extends `ChangeNotifier`. The
    // provider must be planted as `_GlobalStateProvider<_CounterModel>` so that
    // `getGlobalState<_CounterModel>()` finds it by exact type and returns the
    // model instead of null.
    testWidgets(
      'compiles and exposes the model with a ChangeNotifier type parameter',
      (tester) async {
        final model = _CounterModel()..value = 42;

        // Explicit type argument documents intent; inference would pick it up
        // from `model:` regardless.
        await tester.pumpWidget(
          StandardApp<_CounterModel>(
            title: 'With Global State',
            model: model,
            body: const _GlobalStateReader(),
          ),
        );

        // Proves the concrete type survived: the reader found the model.
        expect(find.text('value=42'), findsOneWidget);
        expect(find.text('no-model'), findsNothing);

        model.dispose();
      },
    );

    // Sanity check for the negative path: when no model is provided the reader
    // correctly observes a null global state (nothing planted in the tree).
    testWidgets('reports null global state when no model is supplied', (
      tester,
    ) async {
      await tester.pumpWidget(
        StandardApp(title: 'No Global State', body: const _GlobalStateReader()),
      );

      expect(find.text('no-model'), findsOneWidget);
    });
  });
}
