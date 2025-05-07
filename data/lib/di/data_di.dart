import 'package:core/core.dart';
import 'package:domain/domain.dart';

import '../providers/api/api_providers.dart';
import '../repositories/repositories.dart';

final DataDI dataDI = DataDI();

class DataDI {
  Future<void> preLoginScope() async {
    _initDio();
    _initApi();
    _initCoins();
  }

  void postLoginScope() {}

  void _initDio() {
    appLocator.registerLazySingleton<DioConfig>(
      () => DioConfig(
        appConfig: appLocator<AppConfig>(),
      ),
    );
  }

  void _initApi() {
    appLocator.registerLazySingleton<CoinsApiProvider>(
      () => CoinsApiProvider(
        appLocator<DioConfig>().dio,
      ),
    );
  }

  void _initCoins() {
    appLocator.registerLazySingleton<CoinsRepository>(
        () => CoinsRepositoryImpl(
              coinsApiProvider: appLocator<CoinsApiProvider>(),
            )
    );
  }

}
