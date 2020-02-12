// Run 'flutter pub run build_runner build' to generate the *.g.dart
import 'package:json_annotation/json_annotation.dart';

part 'flash_card.g.dart';

@JsonSerializable()
class Flashcard {

  @JsonKey(name: 'guid')
  final String id;

  @JsonKey(name: 'creatorGuid')
  final String creatorId;

  @JsonKey(name: 'setGuid')
  final String setId;

  final String question;
  final String answer;
  final double retentionScore;

  Flashcard({
    this.id,
    this.creatorId,
    this.setId,
    this.question,
    this.answer,
    this.retentionScore,
  });

  Flashcard copyWith({
    String id,
    String creatorId,
    String setId,
    String question,
    String answer,
    double retentionScore,
  }) => Flashcard(
    id: id ?? this.id,
    creatorId: creatorId ?? this.creatorId,
    setId: setId ?? this.setId,
    question: question ?? this.question,
    answer: answer ?? this.answer,
    retentionScore: retentionScore ?? this.retentionScore,
  );

  factory Flashcard.fromJson(Map<String, dynamic> json) => _$FlashcardFromJson(json);
  Map<String, dynamic> toJson() => _$FlashcardToJson(this);
}