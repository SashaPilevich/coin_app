import 'dart:async';

import 'package:data/data.dart';
import 'package:get_it/get_it.dart';

import '../core.dart';

final GetIt appLocator = GetIt.instance;
const String unauthScope = 'unauthScope';
const String authScope = 'authScope';

Future<void> setupUnAuthScope(Flavor flavor) async {
  final Completer<void> completer = Completer<void>();

  appLocator.pushNewScope(
    scopeName: unauthScope,
    init: (_) async {
      appLocator.registerSingleton<AppConfig>(
        AppConfig.fromFlavor(flavor),
      );

      await dataDI.preLoginScope();

      dataDI.postLoginScope();
      setupNavigationDependencies();
      completer.complete();
    },
  );

  return completer.future;
}

Future<void> goToAuthScope() async {
  appLocator.pushNewScope(
    scopeName: authScope,
    init: (_) {
      dataDI.postLoginScope();
    },
  );
}
