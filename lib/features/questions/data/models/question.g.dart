// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Question _$QuestionFromJson(Map<String, dynamic> json) => Question(
      id: json['id'] as String,
      quizId: json['quizId'] as String,
      text: json['text'] as String,
      type: $enumDecode(_$QuestionTypeEnumMap, json['type']),
      difficulty: json['difficulty'] as String,
      category: json['category'] as String?,
      explanation: json['explanation'] as String?,
      answers: (json['answers'] as List<dynamic>)
          .map((e) => Answer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QuestionToJson(Question instance) => <String, dynamic>{
      'id': instance.id,
      'quizId': instance.quizId,
      'text': instance.text,
      'type': _$QuestionTypeEnumMap[instance.type]!,
      'difficulty': instance.difficulty,
      'category': instance.category,
      'explanation': instance.explanation,
      'answers': instance.answers,
    };

const _$QuestionTypeEnumMap = {
  QuestionType.multipleChoice: 'MULTIPLE_CHOICE',
  QuestionType.trueFalse: 'TRUE_FALSE',
  QuestionType.openEnded: 'OPEN_ENDED',
};
