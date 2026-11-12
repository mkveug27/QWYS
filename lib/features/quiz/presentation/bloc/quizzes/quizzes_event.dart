part of 'quizzes_bloc.dart';

sealed class QuizzesEvent extends Equatable {
  const QuizzesEvent();

  @override
  List<Object?> get props => [];
}

class QuizzesLoad extends QuizzesEvent {
  const QuizzesLoad({this.completer});

  final Completer? completer;

  @override
  List<Object?> get props => [completer];
}
