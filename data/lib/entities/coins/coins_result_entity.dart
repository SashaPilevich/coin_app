import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data.dart';

part 'coins_result_entity.freezed.dart';

part 'coins_result_entity.g.dart';

@freezed
class CoinsResultEntity with _$CoinsResultEntity {
  const factory CoinsResultEntity({
    @Default(<CoinEntity>[]) List<CoinEntity> data,
  }) = _CoinsResultEntity;

  factory CoinsResultEntity.fromJson(Map<String, dynamic> json) =>
      _$CoinsResultEntityFromJson(json);
}
