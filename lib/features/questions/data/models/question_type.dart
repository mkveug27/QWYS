import 'package:json_annotation/json_annotation.dart';

@JsonEnum()
enum QuestionType {
  @JsonValue('MULTIPLE_CHOICE')
  multipleChoice,

  @JsonValue('TRUE_FALSE')
  trueFalse,

  @JsonValue('OPEN_ENDED')
  openEnded,
}
