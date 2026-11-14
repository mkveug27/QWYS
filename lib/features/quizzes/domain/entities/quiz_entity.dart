import 'package:equatable/equatable.dart';

class QuizEntity extends Equatable {
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

  const QuizEntity({
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

  QuizEntity copyWith({
    String? id,
    String? title,
    String? description,
    String? category,
    String? categoryId,
    String? categoryName,
    String? categorySlug,
    String? topic,
    String? topicSlug,
    String? difficulty,
    List<String>? tags,
    int? questionCount,
    int? plays,
  }) {
    return QuizEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      category: category ?? this.category,
      categoryId: categoryId ?? this.categoryId,
      categoryName: categoryName ?? this.categoryName,
      categorySlug: categorySlug ?? this.categorySlug,
      topic: topic ?? this.topic,
      topicSlug: topicSlug ?? this.topicSlug,
      difficulty: difficulty ?? this.difficulty,
      tags: tags ?? this.tags,
      questionCount: questionCount ?? this.questionCount,
      plays: plays ?? this.plays,
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        category,
        categoryId,
        categoryName,
        categorySlug,
        topic,
        topicSlug,
        difficulty,
        tags,
        questionCount,
        plays,
      ];
}
