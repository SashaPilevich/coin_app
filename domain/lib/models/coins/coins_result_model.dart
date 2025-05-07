import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain.dart';

part 'coins_result_model.freezed.dart';

@freezed
class CoinsResultModel with _$CoinsResultModel {
  const factory CoinsResultModel({
    required List<CoinModel> data,
  }) = _CoinsResultModel;

  factory CoinsResultModel.empty() => const CoinsResultModel(
        data: <CoinModel>[],
      );
}
