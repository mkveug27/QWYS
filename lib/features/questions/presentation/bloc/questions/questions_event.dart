part of 'questions_bloc.dart';

sealed class QuestionsEvent extends Equatable {
  const QuestionsEvent();

  @override
  List<Object?> get props => [];
}

class QuestionsLoad extends QuestionsEvent {
  const QuestionsLoad({
    this.completer,
    required this.quizId,
    this.includeAnswers,
  });

  final Completer? completer;

  final String quizId;
  final bool? includeAnswers;

  @override
  List<Object?> get props => [completer, quizId, includeAnswers];
}
