// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_flashcard_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateFlashcardRequest _$CreateFlashcardRequestFromJson(Map<String, dynamic> json) {
  return CreateFlashcardRequest(
    creatorId: json['creatorGuid'] as String,
    setId: json['setGuid'] as String,
    question: json['question'] as String,
    answer: json['answer'] as String,
  );
}

Map<String, dynamic> _$CreateFlashcardRequestToJson(CreateFlashcardRequest instance) =>
    <String, dynamic>{
      'creatorGuid': instance.creatorId,
      'setGuid': instance.setId,
      'question': instance.question,
      'answer': instance.answer,
    };
