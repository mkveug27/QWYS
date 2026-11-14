import 'package:qwys/features/features.dart';

abstract interface class QuizzesRepositoryInterface {
  Future<List<QuizEntity>> getQuizzes();
}
