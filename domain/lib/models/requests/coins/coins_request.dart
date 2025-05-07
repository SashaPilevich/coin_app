import 'package:core/core.dart';

class CoinsRequest {
  final int limit;
  final int offset;

  CoinsRequest({
    this.limit = AppConstants.kLimit,
    required this.offset,
  });
}
