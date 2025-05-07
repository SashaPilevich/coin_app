part of '../dio_config.dart';

class RequestInterceptor extends Interceptor {
  final Dio dio;

  RequestInterceptor(this.dio);

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.headers['Authorization'] = 'Bearer ${AppConstants.authorizationApiKey}';
    return handler.next(options);
  }
}
