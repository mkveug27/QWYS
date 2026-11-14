import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qwys/features/features.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'quizzes_event.dart';
part 'quizzes_state.dart';

class QuizzesBloc extends Bloc<QuizzesEvent, QuizzesState> {
  final GetQuizzesUsecase getQuizzesUsecase;
  final Talker talker;

  QuizzesBloc({
    required this.getQuizzesUsecase,
    required this.talker,
  }) : super(QuizzesInitial()) {
    on<QuizzesLoad>(_load);
  }

  FutureOr<void> _load(QuizzesLoad event, emit) async {
    try {
      emit(QuizzesLoading());
      final quizzes = await getQuizzesUsecase();
      emit(QuizzesLoaded(quizzes));
    } catch (e, stack) {
      talker.handle(e, stack);
      emit(QuizzesError(e));
    } finally {
      event.completer?.complete();
    }
  }
}
