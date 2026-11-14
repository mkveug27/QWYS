import 'package:equatable/equatable.dart';
import 'package:qwys/features/features.dart';

class QuestionEntity extends Equatable {
  final String id;
  final String quizId;
  final String text;
  final QuestionType type;
  final String difficulty;
  final String? category;
  final String? explanation;
  final List<AnswerEntity> answers;

  const QuestionEntity({
    required this.id,
    required this.quizId,
    required this.text,
    required this.type,
    required this.difficulty,
    this.category,
    this.explanation,
    required this.answers,
  });

  QuestionEntity copyWith({
    String? id,
    String? quizId,
    String? text,
    QuestionType? type,
    String? difficulty,
    String? category,
    String? explanation,
    List<AnswerEntity>? answers,
  }) {
    return QuestionEntity(
      id: id ?? this.id,
      quizId: quizId ?? this.quizId,
      text: text ?? this.text,
      type: type ?? this.type,
      difficulty: difficulty ?? this.difficulty,
      category: category ?? this.category,
      explanation: explanation ?? this.explanation,
      answers: answers ?? this.answers,
    );
  }

  @override
  List<Object?> get props => [
        id,
        quizId,
        text,
        type,
        difficulty,
        category,
        explanation,
        answers,
      ];
}
