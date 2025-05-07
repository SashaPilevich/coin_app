import 'dart:async';

import 'package:core/core.dart';
import 'package:flutter/material.dart';

import 'app.dart';

Future<void> mainCommon(Flavor flavor) async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupUnAuthScope(flavor);

  runApp(
    EasyLocalization(
      supportedLocales: AppLocalization.supportedLocales,
      fallbackLocale: AppLocalization.fallbackLocale,
      path: AppLocalization.langFolderPath,
      startLocale: const Locale('en', 'US'),
      child: const App(),
    ),
  );
}
