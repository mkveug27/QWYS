import 'package:flutter/material.dart';

import 'package:qwys/core/core.dart';
import 'package:qwys/core/i18n/strings.g.dart';
import 'package:qwys/features/features.dart';

class QuestionCard extends StatefulWidget {
  const QuestionCard({
    super.key,
    required this.question,
    required this.controller,
  });

  final QuestionEntity question;
  final AnswersController controller;

  @override
  State<QuestionCard> createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  late final TextEditingController _textController;

  QuestionEntity get _question => widget.question;
  AnswersController get _answerController => widget.controller;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(
      text: _answerController.texts.value[_question.id],
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  String? get _explanation {
    final text = _question.explanation?.trim();
    return (text == null || text.isEmpty) ? null : text;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _answerController.isChecked,
      builder: (context, isChecked, _) {
        final hasCorrect = _answerController.hasCorrectAnswer(_question);
        final hasExplanation = _explanation != null;
        final showDetails = isChecked && (hasCorrect || hasExplanation);

        return AppContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: mPadding,
            children: [
              _buildQuestion(context),
              _buildAnswers(context, isChecked: isChecked),
              if (showDetails) ...[
                const AppDivider(),
                _buildDetails(context, hasCorrect: hasCorrect),
              ],
            ],
          ),
        );
      },
    );
  }

  Widget _buildQuestion(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Text(
      _question.text,
      style: textTheme.titleMedium,
    );
  }

  Widget _buildAnswers(
    BuildContext context, {
    required bool isChecked,
  }) {
    return switch (_question.type) {
      QuestionType.multipleChoice ||
      QuestionType.trueFalse =>
        _buildSingleChoice(
          context,
          isChecked: isChecked,
        ),
      QuestionType.openEnded => _buildOpenEnded(isChecked: isChecked),
    };
  }

  Widget _buildSingleChoice(
    BuildContext context, {
    required bool isChecked,
  }) {
    return ValueListenableBuilder<Map<String, String>>(
      valueListenable: _answerController.selections,
      builder: (context, selections, _) {
        final selectedId = selections[_question.id];

        return Column(
          spacing: sPadding,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (final answer in _question.answers)
              AppRadio<String>(
                value: answer.id,
                groupValue: selectedId,
                text: _buildAnswerText(context, text: answer.text),
                onChanged: isChecked
                    ? null
                    : (id) => _answerController.select(_question.id, id),
              ),
          ],
        );
      },
    );
  }

  Widget _buildOpenEnded({required bool isChecked}) {
    return AppInput(
      controller: _textController,
      hintText: t.questions.answer_hint,
      readOnly: isChecked,
      textInputAction: TextInputAction.done,
      onChanged: (text) => _answerController.setText(_question.id, text),
    );
  }

  Widget _buildDetails(
    BuildContext context, {
    required bool hasCorrect,
  }) {
    final colors = Theme.of(context).colors;
    final textTheme = Theme.of(context).textTheme;

    final correctText = _question.answers
        .where((a) => a.isCorrect)
        .map((a) => a.text)
        .join(', ');
    final explanation = _explanation;

    return Column(
      spacing: sPadding,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (hasCorrect)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: xsPadding,
            children: [
              Text(
                t.questions.correct_answer,
                style: textTheme.labelMedium?.copyWith(
                  color: colors.textIconSecondaryDefault,
                ),
              ),
              Text(
                correctText,
                style: textTheme.bodyMedium,
              ),
            ],
          ),
        if (explanation != null)
          Column(
            spacing: xsPadding,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                t.questions.explanation,
                style: textTheme.labelMedium?.copyWith(
                  color: colors.textIconSecondaryDefault,
                ),
              ),
              Text(
                explanation,
                style: textTheme.bodyMedium,
              ),
            ],
          ),
      ],
    );
  }

  Widget _buildAnswerText(
    BuildContext context, {
    required String text,
  }) {
    final textTheme = Theme.of(context).textTheme;

    return Text(
      text,
      style: textTheme.bodyMedium,
    );
  }
}
