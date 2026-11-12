part of 'quiz_bloc.dart';

sealed class QuizEvent extends Equatable {
  const QuizEvent();

  @override
  List<Object?> get props => [];
}

class QuizLoad extends QuizEvent {
  const QuizLoad({this.completer, required this.id});

  final Completer? completer;
  final int id;

  @override
  List<Object?> get props => [completer, id];
}
