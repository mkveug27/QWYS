import 'package:qwys/features/features.dart';

class GetQuizzesUsecase {
  GetQuizzesUsecase(this.quizzesRepository);

  final QuizzesRepository quizzesRepository;

  Future<List<QuizEntity>> call() async {
    final quizzes = await quizzesRepository.getQuizzes();
    return quizzes;
  }
}
