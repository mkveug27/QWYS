import 'package:flutter/foundation.dart';
import 'package:qwys/features/features.dart';

class AnswersController {
  final selections = ValueNotifier<Map<String, String>>(const {});

  final texts = ValueNotifier<Map<String, String>>(const {});

  final isChecked = ValueNotifier<bool>(false);

  late final Listenable changes = Listenable.merge([
    selections,
    texts,
    isChecked,
  ]);

  void select(String questionId, String answerId) {
    selections.value = {...selections.value, questionId: answerId};
  }

  void setText(String questionId, String text) {
    texts.value = {...texts.value, questionId: text};
  }

  void showCorrect() => isChecked.value = true;

  bool hasCorrectAnswer(QuestionEntity question) =>
      question.answers.any((a) => a.isCorrect);

  bool isAutoCheckable(QuestionEntity question) => hasCorrectAnswer(question);

  bool isAnswered(QuestionEntity question) {
    return switch (question.type) {
      QuestionType.openEnded =>
        (texts.value[question.id] ?? '').trim().isNotEmpty,
      _ => selections.value.containsKey(question.id),
    };
  }

  bool allAnswered(List<QuestionEntity> questions) =>
      questions.every(isAnswered);

  bool isCorrect(QuestionEntity question) {
    if (!isAutoCheckable(question)) return false;

    if (question.type == QuestionType.openEnded) {
      final input = _normalize(texts.value[question.id] ?? '');
      return question.answers
          .where((a) => a.isCorrect)
          .any((a) => _normalize(a.text) == input);
    }

    final selectedId = selections.value[question.id];
    return question.answers.any((a) => a.id == selectedId && a.isCorrect);
  }

  int autoCheckableCount(List<QuestionEntity> questions) =>
      questions.where(isAutoCheckable).length;

  int correctCount(List<QuestionEntity> questions) =>
      questions.where(isCorrect).length;

  String _normalize(String value) => value.trim().toLowerCase();

  void dispose() {
    selections.dispose();
    texts.dispose();
    isChecked.dispose();
  }
}
