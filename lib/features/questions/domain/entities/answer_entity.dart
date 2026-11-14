import 'package:equatable/equatable.dart';

class AnswerEntity extends Equatable {
  final String id;
  final String text;
  final bool isCorrect;

  const AnswerEntity({
    required this.id,
    required this.text,
    required this.isCorrect,
  });

  AnswerEntity copyWith({
    String? id,
    String? text,
    bool? isCorrect,
  }) {
    return AnswerEntity(
      id: id ?? this.id,
      text: text ?? this.text,
      isCorrect: isCorrect ?? this.isCorrect,
    );
  }

  @override
  List<Object?> get props => [
        id,
        text,
        isCorrect,
      ];
}
