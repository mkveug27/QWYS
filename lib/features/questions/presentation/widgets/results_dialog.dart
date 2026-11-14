import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:qwys/core/core.dart';
import 'package:qwys/core/i18n/strings.g.dart';
import 'package:qwys/features/features.dart';

class ResultsDialog extends StatelessWidget {
  const ResultsDialog({
    super.key,
    required this.answersController,
    required this.questions,
  });

  final AnswersController answersController;
  final List<QuestionEntity> questions;

  @override
  Widget build(BuildContext context) {
    final autoCheckableCount = answersController.autoCheckableCount(questions);
    final hasNonAutoCheckable = autoCheckableCount < questions.length;

    return AlertDialog(
      title: Text(
        t.questions.result_title,
        textAlign: TextAlign.center,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: sPadding,
        children: [
          if (autoCheckableCount > 0)
            Text(
              t.questions.correct_answers_count(
                correctCount: answersController.correctCount(questions),
                questionsNum: autoCheckableCount,
              ),
              textAlign: TextAlign.center,
            ),
          if (hasNonAutoCheckable)
            Text(
              t.questions.auto_check_note,
              textAlign: TextAlign.center,
            ),
        ],
      ),
      actions: [
        Column(
          spacing: sPadding,
          children: [
            AppButton(
              title: Text(t.questions.show_correct_answers),
              onPressed: () {
                context.pop();
                answersController.showCorrect();
              },
            ),
            AppButton(
              title: Text(t.action.go_home),
              buttonColor: ButtonColor.def,
              onPressed: () {
                context.pop();
                context.go('/home');
              },
            ),
          ],
        ),
      ],
    );
  }
}
