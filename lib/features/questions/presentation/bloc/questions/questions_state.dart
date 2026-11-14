part of 'questions_bloc.dart';

sealed class QuestionsState extends Equatable {
  const QuestionsState();

  @override
  List<Object> get props => [];
}

final class QuestionsInitial extends QuestionsState {}

final class QuestionsLoading extends QuestionsState {}

final class QuestionsLoaded extends QuestionsState {
  const QuestionsLoaded(this.questions);

  final List<QuestionEntity> questions;

  @override
  List<Object> get props => [questions];
}

class QuestionsError extends QuestionsState {
  const QuestionsError(this.error);

  final Object error;

  @override
  List<Object> get props => [error];
}
