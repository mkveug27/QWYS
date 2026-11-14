import 'package:qwys/features/features.dart';

class GetQuestionsUsecase {
  GetQuestionsUsecase(this.questionsRepository);

  final QuestionsRepository questionsRepository;

  Future<List<QuestionEntity>> call({
    required String quizId,
    bool? includeAnswers,
  }) async {
    final questions = await questionsRepository.getQuestions(
      quizId: quizId,
      includeAnswers: includeAnswers,
    );
    return questions;
  }
}
