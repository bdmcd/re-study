// Run 'flutter pub run build_runner build' to generate the *.g.dart
import 'package:json_annotation/json_annotation.dart';

part 'create_flashcard_request.g.dart';

@JsonSerializable()
class CreateFlashCardRequest {
  
  @JsonKey(name: 'creatorGuid')
  final String creatorId;

  @JsonKey(name: 'setGuid')
  final String setId;

  final String question;
  final String answer;

  CreateFlashCardRequest({
    this.creatorId,
    this.setId,
    this.question,
    this.answer,
  });

  CreateFlashCardRequest copyWith({
    String creatorId,
    String setId,
    String question,
    String answer,
  }) => CreateFlashCardRequest(
    creatorId: creatorId ?? this.creatorId,
    setId: setId ?? this.setId,
    question: question ?? this.question,
    answer: answer ?? this.answer,
  );

  factory CreateFlashCardRequest.fromJson(Map<String, dynamic> json) => _$CreateFlashCardRequestFromJson(json);
  Map<String, dynamic> toJson() => _$CreateFlashCardRequestToJson(this);
}