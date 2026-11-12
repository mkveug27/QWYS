import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:qwys/core/core.dart';
import 'package:qwys/core/i18n/strings.g.dart';
import 'package:qwys/di/di.dart';
import 'package:qwys/features/features.dart';
import 'package:qwys/features/quiz/presentation/widgets/quiz_card.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final _quizzesBloc = getIt<QuizzesBloc>();
  void _loadQuizzes() => _quizzesBloc.add(QuizzesLoad());

  @override
  void initState() {
    super.initState();
    _loadQuizzes();
  }

  @override
  void dispose() {
    _quizzesBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppbar(
        title: Text(t.screens.quiz_screen),
      ),
      body: SafeArea(
        bottom: false,
        child: BlocBuilder<QuizzesBloc, QuizzesState>(
          bloc: _quizzesBloc,
          builder: (_, state) {
            return switch (state) {
              QuizzesLoading() => _buildQiozzesLoading(),
              QuizzesLoaded() => _buildQuizzesLoaded(state),
              QuizzesError() => _buildQuizesError(state),
              _ => SizedBox.shrink(),
            };
          },
        ),
      ),
    );
  }

  Widget _buildQiozzesLoading() {
    return FadeAnimation(child: AppProgressIndicator());
  }

  Widget _buildQuizzesLoaded(QuizzesLoaded state) {
    final quizzes = state.quizzes;

    return FadeAnimation(
      child: ListView.separated(
        padding: const EdgeInsets.all(sPadding),
        itemCount: quizzes.length,
        itemBuilder: (_, index) => QuizCard(
          quiz: quizzes[index],
        ),
        separatorBuilder: (_, __) => 16.ph,
      ),
    );
  }

  Widget _buildQuizesError(QuizzesError state) {
    return FadeAnimation(
      child: AppError(
        text: state.error.errorMessage,
        button: AppButton(
          onPressed: _loadQuizzes,
          title: Text(t.action.refresh),
          buttonColor: ButtonColor.inv,
          fullWidth: false,
        ),
      ),
    );
  }
}
