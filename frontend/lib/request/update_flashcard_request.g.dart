// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_flashcard_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateFlashcardRequest _$UpdateFlashcardRequestFromJson(
    Map<String, dynamic> json) {
  return UpdateFlashcardRequest(
    cardId: json['guid'] as String,
    setId: json['setGuid'] as String,
    question: json['question'] as String,
    answer: json['answer'] as String,
    deleted: json['deleted'] as bool,
  );
}

Map<String, dynamic> _$UpdateFlashcardRequestToJson(
        UpdateFlashcardRequest instance) =>
    <String, dynamic>{
      'guid': instance.cardId,
      'setGuid': instance.setId,
      'question': instance.question,
      'answer': instance.answer,
      'deleted': instance.deleted,
    };
