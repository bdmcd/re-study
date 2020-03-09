
import 'package:flutter_test/flutter_test.dart';
import 'package:restudy/model/flash_card.dart';
import 'package:restudy/proxy/mock_impl/mock_card_proxy.dart';
import 'package:restudy/request/create_flashcard_request.dart';
import 'package:restudy/request/update_flashcard_request.dart';

void main() {
  final cardProxy = MockCardProxy();
  
  test('Should be able to create a card', () async {
    final request = CreateFlashcardRequest(
      creatorId: "creator",
      setId: "set",
      question: "What is the square root of -1?",
      answer: "i",
    );

    final card = await cardProxy.createCard(request);
    
    expect(card.setId, request.setId);
    expect(card.creatorId, request.creatorId);
    expect(card.question, request.question);
    expect(card.answer, request.answer);
    expect(card.retentionScore, 0);
  });

  test('Should be able to update a card', () async {
    Flashcard original = Flashcard(
      id: "card_id",
      setId: "set_id",
      creatorId: "creator_id",
      question: "The question",
      answer: "The answer",
      retentionScore: 0,
    );

    final request = UpdateFlashcardRequest(
      cardId: original.id,
      setId: original.setId,
      question: original.question,
      answer: "The NEW answer",
      deleted: false,
    );

    final card = await cardProxy.updateCard(request);
    
    expect(card.id, original.id);
    expect(card.setId, original.setId);
    expect(card.question, original.question);
    expect(card.answer, request.answer);
  });
}