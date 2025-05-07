import 'package:core/core.dart';
import 'package:features/features.dart';
import 'package:flutter/material.dart';

import 'services/route_logger.dart';

final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  RouterLogger get logger => RouterLogger();

  GoRouter get router => _router;

  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  final GoRouter _router = GoRouter(
    navigatorKey: _navigatorKey,
    observers: <NavigatorObserver>[RouterLogger()],
    initialLocation: RouterConstants.mainRoute,
    routes: <RouteBase>[
      GoRoute(
        path: RouterConstants.mainRoute,
        name: RouterConstants.mainRoute,
        builder: (BuildContext context, GoRouterState state) => const MainScreen(),
      ),
    ],
  );
}
