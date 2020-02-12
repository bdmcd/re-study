// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flash_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Flashcard _$FlashcardFromJson(Map<String, dynamic> json) {
  return Flashcard(
    id: json['guid'] as String,
    creatorId: json['creatorGuid'] as String,
    setId: json['setGuid'] as String,
    question: json['question'] as String,
    answer: json['answer'] as String,
    retentionScore: (json['retentionScore'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$FlashcardToJson(Flashcard instance) => <String, dynamic>{
      'guid': instance.id,
      'creatorGuid': instance.creatorId,
      'setGuid': instance.setId,
      'question': instance.question,
      'answer': instance.answer,
      'retentionScore': instance.retentionScore,
    };
