import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class RequestInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    final apiKey = dotenv.get('API_KEY');

    options.headers['Authorization'] = 'Bearer $apiKey';

    handler.next(options);
  }
}
