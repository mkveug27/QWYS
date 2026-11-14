import 'package:dio/dio.dart';
import 'package:qwys/http/data.dart';
import 'package:qwys/features/features.dart';

class QuizzesRepository implements QuizzesRepositoryInterface {
  const QuizzesRepository(this.quizzesRemoteDatasource);

  final QuizzesRemoteDatasource quizzesRemoteDatasource;

  @override
  Future<List<QuizEntity>> getQuizzes() async {
    try {
      final response = await quizzesRemoteDatasource.getQuizzesApi();
      final quizzes = (response.data['data'] as List)
          .map((e) => Quiz.fromJson(e).toEntity())
          .toList();
      return quizzes;
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
}
