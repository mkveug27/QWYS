import 'package:json_annotation/json_annotation.dart';
import 'package:qwys/features/features.dart';

part 'answer.g.dart';

@JsonSerializable()
class Answer {
  final String id;
  final String text;
  final bool isCorrect;

  const Answer({
    required this.id,
    required this.text,
    required this.isCorrect,
  });

  factory Answer.fromJson(Map<String, dynamic> json) => _$AnswerFromJson(json);

  Map<String, dynamic> toJson() => _$AnswerToJson(this);

  AnswerEntity toEntity() => AnswerEntity(
        id: id,
        text: text,
        isCorrect: isCorrect,
      );
}
