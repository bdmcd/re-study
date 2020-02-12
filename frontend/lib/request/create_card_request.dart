// Run 'flutter pub run build_runner' to generate the *.g.dart
import 'package:json_annotation/json_annotation.dart';

part 'create_card_request.g.dart';

@JsonSerializable()
class CreateCardRequest {
  
  @JsonKey(name: 'creatorGuid')
  final String creatorId;

  @JsonKey(name: 'setGuid')
  final String setId;

  final String question;
  final String answer;

  CreateCardRequest({
    this.creatorId,
    this.setId,
    this.question,
    this.answer,
  });

  CreateCardRequest copyWith({
    String creatorId,
    String setId,
    String question,
    String answer,
  }) => CreateCardRequest(
    creatorId: creatorId ?? this.creatorId,
    setId: setId ?? this.setId,
    question: question ?? this.question,
    answer: answer ?? this.answer,
  );

  factory CreateCardRequest.fromJson(Map<String, dynamic> json) => _$CreateCardRequestFromJson(json);
  Map<String, dynamic> toJson() => _$CreateCardRequestToJson(this);
}