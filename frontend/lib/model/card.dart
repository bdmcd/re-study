// Run 'flutter pub run build_runner' to generate the *.g.dart
import 'package:json_annotation/json_annotation.dart';

part 'card.g.dart';

@JsonSerializable()
class Card {

  @JsonKey(name: 'guid')
  final String id;

  @JsonKey(name: 'creatorGuid')
  final String creatorId;

  @JsonKey(name: 'setGuid')
  final String setId;

  final String question;
  final String answer;
  final double retentionScore;

  Card({
    this.id,
    this.creatorId,
    this.setId,
    this.question,
    this.answer,
    this.retentionScore,
  });

  Card copyWith({
    String id,
    String creatorId,
    String setId,
    String question,
    String answer,
    double retentionScore,
  }) => Card(
    id: id ?? this.id,
    creatorId: creatorId ?? this.creatorId,
    setId: setId ?? this.setId,
    question: question ?? this.question,
    answer: answer ?? this.answer,
    retentionScore: retentionScore ?? this.retentionScore,
  );

  factory Card.fromJson(Map<String, dynamic> json) => _$CardFromJson(json);
  Map<String, dynamic> toJson() => _$CardToJson(this);
}