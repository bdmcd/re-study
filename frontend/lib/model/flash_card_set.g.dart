// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flash_card_set.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FlashcardSet _$FlashcardSetFromJson(Map<String, dynamic> json) {
  return FlashcardSet(
    id: json['guid'] as String,
    creatorId: json['creatorGuid'] as String,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$FlashcardSetToJson(FlashcardSet instance) =>
    <String, dynamic>{
      'guid': instance.id,
      'creatorGuid': instance.creatorId,
      'name': instance.name,
    };
