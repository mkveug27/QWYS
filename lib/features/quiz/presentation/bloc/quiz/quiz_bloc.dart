import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qwys/features/features.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'quiz_event.dart';
part 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  final GetQuizUsecase getQuizUsecase;
  final Talker talker;

  QuizBloc({
    required this.getQuizUsecase,
    required this.talker,
  }) : super(QuizInitial()) {
    on<QuizLoad>(_loadById);
  }

  FutureOr<void> _loadById(QuizLoad event, emit) async {
    try {
      emit(QuizLoading());
      final quiz = await getQuizUsecase(event.id);
      emit(QuizLoaded(quiz));
    } catch (e, stack) {
      talker.handle(e, stack);
      emit(QuizError(e));
    } finally {
      event.completer?.complete();
    }
  }
}
