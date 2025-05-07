import 'package:core/core.dart';
import 'package:domain/domain.dart';

part 'coins_event.dart';

part 'coins_state.dart';

class CoinsBloc extends Bloc<CoinsEvent, CoinsState> {
  final FetchCoinsUseCase _fetchCoinsUseCase;

  CoinsBloc({
    required FetchCoinsUseCase fetchCoinsUseCase,
  })  : _fetchCoinsUseCase = fetchCoinsUseCase,
        super(const CoinsState()) {
    on<LoadCoinsEvent>(_onLoadCoins);
    on<DownloadCoinsEvent>(_onDownloadCoins);

    add(LoadCoinsEvent());
  }

  Future<void> _onLoadCoins(
    LoadCoinsEvent event,
    Emitter<CoinsState> emit,
  ) async {
    emit(
      state.copyWith(
        isLoading: true,
        isError: false,
        offset: 0,
      ),
    );
    try {
      final List<CoinModel> coins = await loadCoins();
      emit(
        state.copyWith(
          coins: <CoinModel>[...coins],
          isAllCoinsDownloaded: coins.length < AppConstants.kLimit,
          offset: state.offset + AppConstants.kLimit,
          isLoading: false,
        ),
      );
    } on AppException catch (e) {
      AppLogger.error('_onLoadCoins $e');
      emit(state.copyWith(isError: true));
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> _onDownloadCoins(
    DownloadCoinsEvent event,
    Emitter<CoinsState> emit,
  ) async {
    if (state.isAllCoinsDownloaded) return;
    emit(
      state.copyWith(
        isDownloading: true,
        isError: false,
      ),
    );
    try {
      final List<CoinModel> coins = await loadCoins();
      emit(
        state.copyWith(
          coins: <CoinModel>[...state.coins, ...coins],
          isAllCoinsDownloaded: coins.length < AppConstants.kLimit,
          offset: state.offset + AppConstants.kLimit,
          isDownloading: false,
        ),
      );
    } on AppException catch (e) {
      AppLogger.error('_onLoadCoins $e');
      emit(state.copyWith(isError: true));
    } finally {
      emit(state.copyWith(isDownloading: false));
    }
  }

  Future<List<CoinModel>> loadCoins() async {
    CoinsResultModel coins = CoinsResultModel.empty();
    try {
      coins = await _fetchCoinsUseCase.execute(CoinsRequest(offset: state.offset));
    } on AppException catch (e) {
      AppLogger.error('_onLoadCoins $e');
    }
    return coins.data;
  }
}
