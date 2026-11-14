import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:qwys/core/core.dart';
import 'package:qwys/core/i18n/strings.g.dart';
import 'package:qwys/features/features.dart';

class QuizzesScreen extends StatefulWidget {
  const QuizzesScreen({super.key});

  @override
  State<QuizzesScreen> createState() => _QuizzesScreenState();
}

class _QuizzesScreenState extends State<QuizzesScreen> {
  final _quizzesBloc = getIt<QuizzesBloc>();
  void _loadQuizzes({Completer? completer}) {
    _quizzesBloc.add(QuizzesLoad(completer: completer));
  }

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

  Future<void> _onRefresh() {
    final completer = Completer();
    _loadQuizzes(completer: completer);
    return completer.future;
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
              QuizzesLoading() => _buildQuizzesLoading(),
              QuizzesLoaded() => _buildQuizzesLoaded(state),
              QuizzesError() => _buildQuizzesError(state),
              _ => SizedBox.shrink(),
            };
          },
        ),
      ),
    );
  }

  Widget _buildQuizzesLoading() {
    return FadeAnimation(child: QuizzesShimmer());
  }

  Widget _buildQuizzesLoaded(QuizzesLoaded state) {
    final quizzes = state.quizzes;

    return AppRefreshIndicator(
      onRefresh: () => _onRefresh(),
      child: quizzes.isNotEmpty
          ? FadeAnimation(
              child: ListView.separated(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(sPadding),
                itemCount: quizzes.length,
                itemBuilder: (_, index) => QuizCard(
                  quiz: quizzes[index],
                ),
                separatorBuilder: (_, __) => 16.ph,
              ),
            )
          : FadeAnimation(
              child: AppEmpty(
                text: t.other.empty,
                onPressed: () => context.go('/home'),
                buttonText: t.action.go_home,
                isScrollable: true,
              ),
            ),
    );
  }

  Widget _buildQuizzesError(QuizzesError state) {
    return FadeAnimation(
      child: AppError(
        text: state.error.errorMessage,
        onPressed: _loadQuizzes,
        buttonText: t.action.refresh,
      ),
    );
  }
}
