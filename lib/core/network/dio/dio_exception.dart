import 'package:dio/dio.dart';
import 'package:qwys/core/core.dart';

class DioExceptions implements Exception {
  const DioExceptions._(this.serverError);

  final ServerError serverError;

  factory DioExceptions.fromDioError(DioException exception) {
    final serverError = switch (exception.type) {
      DioExceptionType.badResponse => ServerError.fromResponse(
          exception.response,
        ),
      DioExceptionType.cancel => ServerError.network(
          'CANCEL',
        ),
      DioExceptionType.connectionTimeout => ServerError.network(
          'CONNECTION TIMEOUT',
        ),
      DioExceptionType.receiveTimeout => ServerError.network(
          'RECEIVE TIMEOUT',
        ),
      DioExceptionType.sendTimeout => ServerError.network(
          'SEND TIMEOUT',
        ),
      _ => ServerError.network(
          'UNKNOWN',
        ),
    };

    return DioExceptions._(serverError);
  }
}
