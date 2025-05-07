import 'package:core/core.dart';
import 'package:retrofit/http.dart';

part 'coins_api_provider.g.dart';

@RestApi()
abstract class CoinsApiProvider {
  factory CoinsApiProvider(Dio dio, {String baseUrl}) = _CoinsApiProvider;
}
