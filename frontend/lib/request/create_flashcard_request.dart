// Run 'flutter pub run build_runner build' to generate the *.g.dart
import 'package:json_annotation/json_annotation.dart';

part 'create_flashcard_request.g.dart';

@JsonSerializable()
class CreateFlashcardRequest {
  
  @JsonKey(name: 'creatorGuid')
  final String creatorId;

  @JsonKey(name: 'setGuid')
  final String setId;

  final String question;
  final String answer;

  CreateFlashcardRequest({
    this.creatorId,
    this.setId,
    this.question,
    this.answer,
  });

  CreateFlashcardRequest copyWith({
    String creatorId,
    String setId,
    String question,
    String answer,
  }) => CreateFlashcardRequest(
    creatorId: creatorId ?? this.creatorId,
    setId: setId ?? this.setId,
    question: question ?? this.question,
    answer: answer ?? this.answer,
  );

  factory CreateFlashcardRequest.fromJson(Map<String, dynamic> json) => _$CreateFlashcardRequestFromJson(json);
  Map<String, dynamic> toJson() => _$CreateFlashcardRequestToJson(this);
}