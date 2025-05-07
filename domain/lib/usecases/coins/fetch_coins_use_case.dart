import '../../domain.dart';

class FetchCoinsUseCase implements FutureUseCase<CoinsRequest, CoinsResultModel> {
  final CoinsRepository _coinsRepository;

  FetchCoinsUseCase({
    required CoinsRepository coinsRepository,
  }) : _coinsRepository = coinsRepository;

  @override
  Future<CoinsResultModel> execute(CoinsRequest request) async {
    return _coinsRepository.getCoins(request: request);
  }
}
