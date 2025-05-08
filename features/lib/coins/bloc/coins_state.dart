part of 'coins_bloc.dart';

class CoinsState extends Equatable {
  final List<CoinModel> coins;
  final bool isLoading;
  final bool isDownloading;
  final bool isAllCoinsDownloaded;
  final int offset;
  final bool isError;
  final Map<int, Color> colors;

  const CoinsState({
    this.coins = const <CoinModel>[],
    this.isLoading = false,
    this.isDownloading = false,
    this.isAllCoinsDownloaded = false,
    this.offset = 0,
    this.isError = false,
    this.colors = const <int, Color>{},
  });

  CoinsState copyWith({
    List<CoinModel>? coins,
    bool? isLoading,
    bool? isDownloading,
    bool? isAllCoinsDownloaded,
    int? offset,
    bool? isError,
    Map<int, Color>? colors,
  }) {
    return CoinsState(
      coins: coins ?? this.coins,
      isLoading: isLoading ?? this.isLoading,
      isDownloading: isDownloading ?? this.isDownloading,
      isAllCoinsDownloaded: isAllCoinsDownloaded ?? this.isAllCoinsDownloaded,
      offset: offset ?? this.offset,
      isError: isError ?? this.isError,
      colors: colors ?? this.colors,
    );
  }

  @override
  List<Object?> get props => <Object?>[
        coins,
        isLoading,
        isDownloading,
        isAllCoinsDownloaded,
        offset,
        isError,
        colors,
      ];
}
