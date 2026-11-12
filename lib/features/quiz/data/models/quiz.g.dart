// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Quiz _$QuizFromJson(Map<String, dynamic> json) => Quiz(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String?,
      category: json['category'] as String,
      categoryId: json['categoryId'] as String?,
      categoryName: json['categoryName'] as String,
      categorySlug: json['categorySlug'] as String?,
      topic: json['topic'] as String?,
      topicSlug: json['topicSlug'] as String?,
      difficulty: json['difficulty'] as String,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      questionCount: (json['questionCount'] as num?)?.toInt(),
      plays: (json['plays'] as num).toInt(),
    );

Map<String, dynamic> _$QuizToJson(Quiz instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'category': instance.category,
      'categoryId': instance.categoryId,
      'categoryName': instance.categoryName,
      'categorySlug': instance.categorySlug,
      'topic': instance.topic,
      'topicSlug': instance.topicSlug,
      'difficulty': instance.difficulty,
      'tags': instance.tags,
      'questionCount': instance.questionCount,
      'plays': instance.plays,
    };
