import 'package:dio/dio.dart';
import 'package:qwys/data/data.dart';
import 'package:qwys/features/features.dart';

class QuizRepository implements QuizRepositoryInterface {
  const QuizRepository(this.quizRemoteDatasource);

  final QuizRemoteDatasource quizRemoteDatasource;

  @override
  Future<List<QuizEntity>> getQuizzes() async {
    try {
      final response = await quizRemoteDatasource.getQuizzesApi();
      final quizzes = (response.data['data'] as List)
          .map((e) => Quiz.fromJson(e).toEntity())
          .toList();
      return quizzes;
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  @override
  Future<QuizEntity> getQuiz(int id) async {
    try {
      final response = await quizRemoteDatasource.getQuizApi(id);
      final quiz = Quiz.fromJson(response.data['data']).toEntity();
      return quiz;
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
}
