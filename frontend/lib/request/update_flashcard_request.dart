// Run 'flutter pub run build_runner build' to generate the *.g.dart
import 'package:json_annotation/json_annotation.dart';

part 'update_flashcard_request.g.dart';

@JsonSerializable()
class UpdateFlashcardRequest {
  
  @JsonKey(name: 'guid')
  final String cardId;

  @JsonKey(name: 'setGuid')
  final String setId;

  final String question;
  final String answer;
  final bool deleted;

  UpdateFlashcardRequest({
    this.cardId,
    this.setId,
    this.question,
    this.answer,
    this.deleted,
  });

  UpdateFlashcardRequest copyWith({
    String cardId,
    String setId,
    String question,
    String answer,
    bool deleted,
  }) => UpdateFlashcardRequest(
    cardId: cardId ?? this.cardId,
    setId: setId ?? this.setId,
    question: question ?? this.question,
    answer: answer ?? this.answer,
    deleted: deleted ?? this.deleted
  );

  factory UpdateFlashcardRequest.fromJson(Map<String, dynamic> json) => _$UpdateFlashcardRequestFromJson(json);
  Map<String, dynamic> toJson() => _$UpdateFlashcardRequestToJson(this);
}