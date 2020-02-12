// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_flashcard_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateFlashCardRequest _$CreateFlashCardRequestFromJson(Map<String, dynamic> json) {
  return CreateFlashCardRequest(
    creatorId: json['creatorGuid'] as String,
    setId: json['setGuid'] as String,
    question: json['question'] as String,
    answer: json['answer'] as String,
  );
}

Map<String, dynamic> _$CreateFlashCardRequestToJson(CreateFlashCardRequest instance) =>
    <String, dynamic>{
      'creatorGuid': instance.creatorId,
      'setGuid': instance.setId,
      'question': instance.question,
      'answer': instance.answer,
    };
