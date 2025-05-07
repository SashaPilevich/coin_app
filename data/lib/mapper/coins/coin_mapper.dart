import 'package:domain/domain.dart';

import '../../data.dart';

abstract class CoinMapper {
  static CoinModel toModel(CoinEntity entity) {
    return CoinModel(
      id: entity.id,
      symbol: entity.symbol,
      name: entity.name,
      priceUsd: entity.priceUsd,
    );
  }

  static CoinEntity toEntity(CoinModel model) {
    return CoinEntity(
      id: model.id,
      symbol: model.symbol,
      name: model.name,
      priceUsd: model.priceUsd,
    );
  }
}
