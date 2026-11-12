import 'package:qwys/features/features.dart';

class GetQuizzesUsecase {
  GetQuizzesUsecase(this.repository);

  final QuizRepository repository;

  Future<List<QuizEntity>> call() async {
    final quizzes = await repository.getQuizzes();
    return quizzes;
  }
}
