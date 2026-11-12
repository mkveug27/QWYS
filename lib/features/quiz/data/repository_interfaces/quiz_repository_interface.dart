import 'package:qwys/features/features.dart';

abstract interface class QuizRepositoryInterface {
  Future<List<QuizEntity>> getQuizzes();
  Future<QuizEntity> getQuiz(int id);
}
