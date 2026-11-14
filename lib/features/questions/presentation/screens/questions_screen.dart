import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:qwys/core/core.dart';
import 'package:qwys/core/i18n/strings.g.dart';
import 'package:qwys/features/features.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({
    super.key,
    required this.quizId,
    required this.quizTitle,
  });

  final String quizId;
  final String quizTitle;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  final _questionsBloc = getIt<QuestionsBloc>();
  final _answersController = AnswersController();

  void _loadQuestions() {
    _questionsBloc.add(QuestionsLoad(
      quizId: widget.quizId,
      includeAnswers: true,
    ));
  }

  Future<void> _showResult(List<QuestionEntity> questions) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        return ResultsDialog(
          answersController: _answersController,
          questions: questions,
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _loadQuestions();
  }

  @override
  void dispose() {
    _questionsBloc.close();
    _answersController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppbar(
        title: Text(widget.quizTitle),
      ),
      body: SafeArea(
        child: BlocBuilder<QuestionsBloc, QuestionsState>(
          bloc: _questionsBloc,
          builder: (_, state) {
            return switch (state) {
              QuestionsLoading() => _buildQuestionsLoading(),
              QuestionsLoaded() => _buildQuestionsLoaded(state),
              QuestionsError() => _buildQuestionsError(state),
              _ => const SizedBox.shrink(),
            };
          },
        ),
      ),
    );
  }

  Widget _buildQuestionsLoading() {
    return FadeAnimation(child: QuestionsShimmer());
  }

  Widget _buildQuestionsLoaded(QuestionsLoaded state) {
    final questions = state.questions;

    return questions.isNotEmpty
        ? FadeAnimation(
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(sPadding),
                    itemCount: questions.length,
                    itemBuilder: (_, index) => QuestionCard(
                      question: questions[index],
                      controller: _answersController,
                    ),
                    separatorBuilder: (_, __) => 16.ph,
                  ),
                ),
                _buildFooter(questions),
              ],
            ),
          )
        : FadeAnimation(
            child: AppEmpty(
              text: t.other.empty,
              onPressed: () => context.pop(),
              buttonText: t.action.go_home,
              isScrollable: true,
            ),
          );
  }

  Widget _buildFooter(List<QuestionEntity> questions) {
    return Padding(
      padding: const EdgeInsets.all(sPadding),
      child: ListenableBuilder(
        listenable: _answersController.changes,
        builder: (context, _) {
          if (_answersController.isChecked.value) {
            return AppButton(
              title: Text(t.action.go_home),
              onPressed: () => context.go('/home'),
            );
          }

          final canCheck = _answersController.allAnswered(questions);

          return AppButton(
            title: Text(t.questions.check_answers),
            onPressed: () => _showResult(questions),
            disabled: !canCheck,
          );
        },
      ),
    );
  }

  Widget _buildQuestionsError(QuestionsError state) {
    return FadeAnimation(
      child: AppError(
        text: state.error.errorMessage,
        onPressed: _loadQuestions,
        buttonText: t.action.refresh,
      ),
    );
  }
}
