/*TODO: complete the class following the layout in user.dart with the following properties:

  id: string (json property => guid)
  creatorId: string (json property => creatorGuid)
  name: string
*/

// Run 'flutter pub run build_runner build' to generate the *.g.dart
import 'package:json_annotation/json_annotation.dart';

part 'flash_card_set.g.dart';

@JsonSerializable()
class FlashcardSet {

  @JsonKey(name: 'guid')
  final String id;

  @JsonKey(name: 'creatorGuid')
  final String creatorId;

  final String name;

  FlashcardSet({
    this.id,
    this.creatorId,
    this.name,
  });

  FlashcardSet copyWith({
    String id,
    String creatorId,
    String name,
  }) => FlashcardSet(
    id: id ?? this.id,
    creatorId: creatorId ?? this.creatorId,
    name: name ?? this.name,
  );

  factory FlashcardSet.fromJson(Map<String, dynamic> json) => _$FlashcardSetFromJson(json);
  Map<String, dynamic> toJson() => _$FlashcardSetToJson(this);
}