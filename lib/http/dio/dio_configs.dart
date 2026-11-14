import 'package:qwys/core/core.dart';
import 'package:qwys/flavors.dart';

abstract final class DioConfigs {
  static final String baseUrl = F.apiUrl;

  static const Duration connectionTimeout = Duration(seconds: 10);
  static const Duration receiveTimeout = Duration(seconds: 10);

  static const bool printRequestHeaders = kPrintRequestHeaders;
  static const bool printResponseHeaders = kPrintResponseHeaders;
  static const bool printResponseMessage = kPrintResponseMessage;
  static const bool printRequestData = kPrintRequestData;
  static const bool printResponseData = kPrintResponseData;
}
