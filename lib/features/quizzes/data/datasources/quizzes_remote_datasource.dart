import 'package:dio/dio.dart';
import 'package:qwys/core/network/network.dart';

class QuizzesRemoteDatasource {
  QuizzesRemoteDatasource({required this.dioClient});

  final DioClient dioClient;

  Future<Response> getQuizzesApi() async {
    try {
      final response = await dioClient.get(Endpoints.quizzes);
      return response;
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).serverError;
      throw errorMessage;
    }
  }
}
