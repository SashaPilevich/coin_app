import 'dart:async';
import 'dart:io';

import '../../core.dart';
import 'interceptors/dio_log_interceptor.dart';

part 'interceptors/error_interceptor.dart';

part 'interceptors/request_interceptor.dart';

part 'interceptors/response_interceptor.dart';

class DioConfig {
  final AppConfig appConfig;
  static const Duration timeout = Duration(seconds: 10);

  final Dio _dio = Dio();

  Dio get dio => _dio;

  DioConfig({required this.appConfig}) {
    _dio
      ..options.baseUrl = appConfig.baseUrl
      ..options.connectTimeout = timeout
      ..options.connectTimeout = timeout
      ..interceptors.addAll(<Interceptor>[
        RequestInterceptor(_dio),
        ErrorInterceptor(_dio),
        ResponseInterceptor(_dio),
        dioLoggerInterceptor,
      ]);
  }
}
