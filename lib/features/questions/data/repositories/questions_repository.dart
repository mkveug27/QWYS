import 'package:dio/dio.dart';
import 'package:qwys/core/network/network.dart';
import 'package:qwys/features/features.dart';

class QuestionsRepository implements QuestionsRepositoryInterface {
  const QuestionsRepository(this.questionsRemoteDatasource);

  final QuestionsRemoteDatasource questionsRemoteDatasource;

  @override
  Future<List<QuestionEntity>> getQuestions({
    required String quizId,
    bool? includeAnswers,
  }) async {
    try {
      final response = await questionsRemoteDatasource.getQuestionsApi({
        'quiz_id': quizId,
        'include_answers': includeAnswers,
      });
      final questions = (response.data['data'] as List)
          .map((e) => Question.fromJson(e).toEntity())
          .toList();
      return questions;
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
}
