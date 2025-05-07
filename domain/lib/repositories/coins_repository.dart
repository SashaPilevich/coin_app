import '../domain.dart';

abstract class CoinsRepository {
  Future<CoinsResultModel> getCoins({
    required CoinsRequest request,
  });
}
