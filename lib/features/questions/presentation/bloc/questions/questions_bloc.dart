import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qwys/features/features.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'questions_event.dart';
part 'questions_state.dart';

class QuestionsBloc extends Bloc<QuestionsEvent, QuestionsState> {
  final GetQuestionsUsecase getQuestionsUsecase;
  final Talker talker;

  QuestionsBloc({
    required this.getQuestionsUsecase,
    required this.talker,
  }) : super(QuestionsInitial()) {
    on<QuestionsLoad>(_load);
  }

  FutureOr<void> _load(QuestionsLoad event, emit) async {
    try {
      emit(QuestionsLoading());
      final questions = await getQuestionsUsecase(
        quizId: event.quizId,
        includeAnswers: event.includeAnswers,
      );
      emit(QuestionsLoaded(questions));
    } catch (e, stack) {
      talker.handle(e, stack);
      emit(QuestionsError(e));
    } finally {
      event.completer?.complete();
    }
  }
}
