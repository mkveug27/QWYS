import 'package:json_annotation/json_annotation.dart';
import 'package:qwys/features/features.dart';

part 'question.g.dart';

@JsonSerializable()
class Question {
  final String id;
  final String quizId;
  final String text;
  final QuestionType type;
  final String difficulty;
  final String? category;
  final String? explanation;
  final List<Answer> answers;

  const Question({
    required this.id,
    required this.quizId,
    required this.text,
    required this.type,
    required this.difficulty,
    this.category,
    this.explanation,
    required this.answers,
  });

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionToJson(this);

  QuestionEntity toEntity() => QuestionEntity(
        id: id,
        quizId: quizId,
        text: text,
        type: type,
        difficulty: difficulty,
        category: category,
        explanation: explanation,
        answers: _toAnswerEntity(answers),
      );
}

List<AnswerEntity> _toAnswerEntity(List<Answer> answers) {
  return answers.map((answer) => answer.toEntity()).toList();
}
