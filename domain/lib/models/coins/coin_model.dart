import 'package:freezed_annotation/freezed_annotation.dart';

part 'coin_model.freezed.dart';

@freezed
class CoinModel with _$CoinModel {
  const factory CoinModel({
    required String id,
    required String symbol,
    required String name,
    required String priceUsd,
  }) = _CoinModel;

  factory CoinModel.empty() => const CoinModel(
        id: '',
        symbol: '',
        name: '',
        priceUsd: '',
      );
}
