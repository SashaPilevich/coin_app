import 'package:domain/domain.dart';

import '../../data.dart';

abstract class CoinsResultMapper {
  static CoinsResultModel toModel(CoinsResultEntity entity) {
    return CoinsResultModel(
      data: entity.data.map(CoinMapper.toModel).toList(),
    );
  }

  static CoinsResultEntity toEntity(CoinsResultModel model) {
    return CoinsResultEntity(
      data: model.data.map(CoinMapper.toEntity).toList(),
    );
  }
}
