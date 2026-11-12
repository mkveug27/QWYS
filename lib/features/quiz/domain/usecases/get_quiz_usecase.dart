import 'package:qwys/features/features.dart';

class GetQuizUsecase {
  GetQuizUsecase(this.repository);

  final QuizRepository repository;

  Future<QuizEntity> call(int id) async {
    final quiz = await repository.getQuiz(id);
    return quiz;
  }
}
