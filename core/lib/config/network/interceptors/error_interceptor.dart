part of '../dio_config.dart';

class ErrorInterceptor extends Interceptor {
  final Dio dio;

  ErrorInterceptor(this.dio);

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    switch (err.type) {
      case DioExceptionType.cancel:
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        break;
      case DioExceptionType.badResponse:
        switch (err.response?.statusCode) {
          case HttpStatus.badRequest:
            break;
          case HttpStatus.notFound:
            break;
          case HttpStatus.internalServerError:
            break;
        }
        break;
      case DioExceptionType.connectionError:
        // TODO(AleksandraBobrovich): Handle connectionError case
        break;
      case DioExceptionType.badCertificate:
        // TODO(AleksandraBobrovich): Handle badCertificate case
        break;
      case DioExceptionType.unknown:
        // TODO(AleksandraBobrovich): Handle unknown case
        break;
    }

    if (err.response?.statusCode != HttpStatus.unauthorized) {
      return handler.next(err);
    }
    final Response<dynamic> response =
        err.response ?? Response<dynamic>(requestOptions: err.requestOptions);
    return handler.resolve(response);
  }
}
