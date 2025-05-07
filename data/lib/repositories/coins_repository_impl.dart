import 'package:domain/domain.dart';

import '../data.dart';
import '../providers/safe_request.dart';

class CoinsRepositoryImpl implements CoinsRepository {
  final CoinsApiProvider _coinsApiProvider;

  CoinsRepositoryImpl({
    required CoinsApiProvider coinsApiProvider,
  }) : _coinsApiProvider = coinsApiProvider;

  @override
  Future<CoinsResultModel> getCoins({
    required CoinsRequest request,
  }) async {
    final CoinsResultEntity coins = await safeRequest(
      () => _coinsApiProvider.getCoins(
        limit: request.limit,
        offset: request.offset,
      ),
    );

    return CoinsResultMapper.toModel(coins);
  }
}
