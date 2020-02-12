// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_card_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateCardRequest _$CreateCardRequestFromJson(Map<String, dynamic> json) {
  return CreateCardRequest(
    creatorId: json['creatorGuid'] as String,
    setId: json['setGuid'] as String,
    question: json['question'] as String,
    answer: json['answer'] as String,
  );
}

Map<String, dynamic> _$CreateCardRequestToJson(CreateCardRequest instance) =>
    <String, dynamic>{
      'creatorGuid': instance.creatorId,
      'setGuid': instance.setId,
      'question': instance.question,
      'answer': instance.answer,
    };
