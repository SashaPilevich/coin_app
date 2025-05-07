import 'package:logger/logger.dart';

class AppLogger {
  static final Logger _log = Logger(
    printer: PrettyPrinter(),
  );

  static final AppLogger _singleton = AppLogger._internal();

  AppLogger._internal();

  factory AppLogger() => _singleton;

  /// Log a message at level [Level.trace].
  static void verbose(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _log.t(message, error: error, stackTrace: stackTrace);
  }

  /// Log a message at level [Level.debug].
  static void debug(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _log.d(message, error: error, stackTrace: stackTrace);
  }

  /// Log a message at level [Level.info].
  static void info(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _log.i(message, error: error, stackTrace: stackTrace);
  }

  /// Log a message at level [Level.warning].
  static void warning(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _log.w(message, error: error, stackTrace: stackTrace);
  }

  /// Log a message at level [Level.error].
  static void error(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _log.e(message, error: error, stackTrace: stackTrace);
  }

  /// Log a message at level [Level.fatal].
  static void wtf(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _log.f(message, error: error, stackTrace: stackTrace);
  }
}
