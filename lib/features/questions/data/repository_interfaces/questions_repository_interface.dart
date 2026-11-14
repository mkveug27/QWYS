import 'package:qwys/features/features.dart';

abstract interface class QuestionsRepositoryInterface {
  Future<List<QuestionEntity>> getQuestions({
    required String quizId,
    bool? includeAnswers,
  });
}
