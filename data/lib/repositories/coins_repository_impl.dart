import 'package:domain/domain.dart';

import '../data.dart';

class CoinsRepositoryImpl implements CoinsRepository {
  final CoinsApiProvider _coinsApiProvider;

  CoinsRepositoryImpl({
    required CoinsApiProvider coinsApiProvider,
  }) : _coinsApiProvider = coinsApiProvider;
}
