import 'package:core/core.dart';

void setupNavigationDependencies() {
  appLocator.registerSingleton<AppRouter>(AppRouter());
}
