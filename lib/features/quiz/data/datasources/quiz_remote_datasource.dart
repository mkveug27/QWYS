import 'package:dio/dio.dart';
import 'package:qwys/data/data.dart';

class QuizRemoteDatasource {
  QuizRemoteDatasource({required this.dioClient});

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

  Future<Response> getQuizApi(int id) async {
    try {
      final response = await dioClient.get('${Endpoints.quizzes}/$id');
      return response;
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).serverError;
      throw errorMessage;
    }
  }
}
