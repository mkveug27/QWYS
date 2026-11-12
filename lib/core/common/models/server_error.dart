import 'package:dio/dio.dart';
import 'package:qwys/core/i18n/strings.g.dart';

class ServerError implements Exception {
  const ServerError({
    required this.message,
    required this.reason,
    this.statusCode,
  });

  final String message;
  final String reason;
  final int? statusCode;

  factory ServerError.network(String message) {
    return ServerError(
      message: message,
      reason: t.error.error_default,
    );
  }

  factory ServerError.fromResponse(Response? response) {
    final statusCode = response?.statusCode;
    final data = response?.data;

    String? apiMessage;
    if (data is Map<String, dynamic>) {
      final error = data['error'];
      if (error is String) apiMessage = error;
    }

    return ServerError(
      statusCode: statusCode,
      message: apiMessage ?? response?.statusMessage ?? 'HTTP $statusCode',
      reason: t.error.error_default,
    );
  }

  @override
  String toString() => 'ServerError($statusCode): $message';
}
