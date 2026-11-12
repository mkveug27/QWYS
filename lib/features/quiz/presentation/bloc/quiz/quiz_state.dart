part of 'quiz_bloc.dart';

sealed class QuizState extends Equatable {
  const QuizState();

  @override
  List<Object> get props => [];
}

final class QuizInitial extends QuizState {}

final class QuizLoading extends QuizState {}

final class QuizLoaded extends QuizState {
  const QuizLoaded(this.quiz);

  final QuizEntity quiz;

  @override
  List<Object> get props => [quiz];
}

class QuizError extends QuizState {
  const QuizError(this.error);

  final Object error;

  @override
  List<Object> get props => [error];
}
