import 'package:dio/dio.dart';
import 'package:qwys/http/data.dart';

class QuestionsRemoteDatasource {
  QuestionsRemoteDatasource({required this.dioClient});

  final DioClient dioClient;

  Future<Response> getQuestionsApi(dynamic data) async {
    try {
      final response = await dioClient.get(
        Endpoints.questions,
        queryParameters: data,
      );
      return response;
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).serverError;
      throw errorMessage;
    }
  }
}
