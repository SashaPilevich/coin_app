import 'dart:ui';

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
      final Map<int, Color> colors = _generateColorsForCoins(coins, 0);
      emit(
        state.copyWith(
          coins: <CoinModel>[...coins],
          isAllCoinsDownloaded: coins.length < AppConstants.kLimit,
          offset: state.offset + AppConstants.kLimit,
          colors: colors,
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
      final Map<int, Color> colors = Map<int, Color>.from(state.colors);
      colors.addAll(_generateColorsForCoins(coins, state.coins.length));
      emit(
        state.copyWith(
          coins: <CoinModel>[...state.coins, ...coins],
          isAllCoinsDownloaded: coins.length < AppConstants.kLimit,
          offset: state.offset + AppConstants.kLimit,
          colors: colors,
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

  /// Generates colors for a list of coins, synchronized with pagination.
  /// Colors are precomputed for all items in the batch to ensure smooth scrolling
  /// and minimal UI computations.
  Map<int, Color> _generateColorsForCoins(List<CoinModel> coins, int startIndex) {
    final Map<int, Color> colors = <int, Color>{};
    for (int i = 0; i < coins.length; i++) {
      colors[startIndex + i] = ColorGenerator.generateColor(startIndex + i);
    }
    return colors;
  }
}
