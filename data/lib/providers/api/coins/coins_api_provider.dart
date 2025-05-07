import 'package:core/core.dart';
import 'package:retrofit/http.dart';

import '../../../data.dart';

part 'coins_api_provider.g.dart';

@RestApi()
abstract class CoinsApiProvider {
  factory CoinsApiProvider(Dio dio, {String baseUrl}) = _CoinsApiProvider;

  @GET(ApiConstants.getCoins)
  Future<CoinsResultEntity> getCoins({
    @Query('limit') int? limit,
    @Query('offset') int? offset,
  });
}
