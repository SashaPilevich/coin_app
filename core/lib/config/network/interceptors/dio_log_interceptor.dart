import 'package:dio/dio.dart';

import '../../../logger/app_logger.dart';

final InterceptorsWrapper dioLoggerInterceptor = InterceptorsWrapper(
  onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
    final String headers = options.headers.entries
        .map((MapEntry<String, dynamic> entry) => '${entry.key}: ${entry.value}')
        .join('\n');
    AppLogger.debug(
      'NETWORK REQUEST: ${options.method} ${options.uri}\n'
      'Query: ${options.data}\n'
      'Headers:\n$headers',
    );
    handler.next(options);
  },
  onResponse: (Response<dynamic> response, ResponseInterceptorHandler handler) async {
    if (response.data != null || response.data != <dynamic>[]) {
      AppLogger.info(
        'NETWORK RESPONSE [code ${response.statusCode}]:\n'
        '🟢 ${response.data} 🟢',
      );
    }
    handler.next(response);
  },
  onError: (DioException exception, ErrorInterceptorHandler handler) async {
    AppLogger.error(
      'NETWORK ERROR: ${exception.error}: ${exception.response}\n'
      'path=${exception.requestOptions.path}',
    );
    handler.next(exception);
  },
);
