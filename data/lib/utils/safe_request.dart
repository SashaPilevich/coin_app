import 'package:core/core.dart';

Future<dynamic> safeRequest(Future<dynamic> Function() request) async {
  try {
    return await request();
  } on DioException {}
}
