import 'package:json_annotation/json_annotation.dart';
import 'package:qwys/features/quizzes/domain/domain.dart';

part 'quiz.g.dart';

@JsonSerializable()
class Quiz {
  final String id;
  final String title;
  final String? description;
  final String category;
  final String? categoryId;
  final String categoryName;
  final String? categorySlug;
  final String? topic;
  final String? topicSlug;
  final String difficulty;
  final List<String> tags;
  final int? questionCount;
  final int plays;

  const Quiz({
    required this.id,
    required this.title,
    this.description,
    required this.category,
    this.categoryId,
    required this.categoryName,
    this.categorySlug,
    this.topic,
    this.topicSlug,
    required this.difficulty,
    required this.tags,
    this.questionCount,
    required this.plays,
  });

  factory Quiz.fromJson(Map<String, dynamic> json) => _$QuizFromJson(json);

  Map<String, dynamic> toJson() => _$QuizToJson(this);

  QuizEntity toEntity() => QuizEntity(
        id: id,
        title: title,
        description: description,
        category: category,
        categoryId: categoryId,
        categoryName: categoryName,
        categorySlug: categorySlug,
        topic: topic,
        topicSlug: topicSlug,
        difficulty: difficulty,
        tags: tags,
        questionCount: questionCount,
        plays: plays,
      );
}
