import 'package:core/core.dart';
import 'package:flutter/widgets.dart';

class RouterLogger extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    AppLogger.info('RouterLogger: didPush: ${route.settings.name}, '
        // 'path: [${route.data?.parent?.path}] [${route.data?.path}]',
        );
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    AppLogger.info('RouterLogger: didPop: ${route.settings.name}');
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    AppLogger.info('RouterLogger: didRemove: ${route.settings.name}');
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    AppLogger.info('RouterLogger: didReplace: ${newRoute?.settings.name}');
  }
}
