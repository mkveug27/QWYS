part of 'quizzes_bloc.dart';

sealed class QuizzesState extends Equatable {
  const QuizzesState();

  @override
  List<Object> get props => [];
}

final class QuizzesInitial extends QuizzesState {}

final class QuizzesLoading extends QuizzesState {}

final class QuizzesLoaded extends QuizzesState {
  const QuizzesLoaded(this.quizzes);

  final List<QuizEntity> quizzes;

  @override
  List<Object> get props => [quizzes];
}

class QuizzesError extends QuizzesState {
  const QuizzesError(this.error);

  final Object error;

  @override
  List<Object> get props => [error];
}
