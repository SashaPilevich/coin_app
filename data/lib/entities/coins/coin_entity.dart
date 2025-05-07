import 'package:freezed_annotation/freezed_annotation.dart';

part 'coin_entity.freezed.dart';

part 'coin_entity.g.dart';

@freezed
class CoinEntity with _$CoinEntity {
  const factory CoinEntity({
    @Default('') String id,
    @Default('') String symbol,
    @Default('') String name,
    @Default('') String priceUsd,
  }) = _CoinEntity;

  factory CoinEntity.fromJson(Map<String, dynamic> json) => _$CoinEntityFromJson(json);
}
