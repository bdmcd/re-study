
import 'package:restudy/model/flash_card.dart';
import 'package:restudy/proxy/card_proxy.dart';
import 'package:restudy/request/create_flashcard_request.dart';
import 'package:restudy/request/update_flashcard_request.dart';

class MockCardProxy implements CardProxy {
  @override
  Future<Flashcard> createCard(CreateFlashcardRequest request) async {
    await Future.delayed(Duration(milliseconds: 200));
    
    return Flashcard(
      id: "mock_card_id",
      setId: request.setId,
      creatorId: request.creatorId,
      question: request.question,
      answer: request.answer,
      retentionScore: 0,
    );
  }

  @override
  Future<Flashcard> updateCard(UpdateFlashcardRequest request) async {
    await Future.delayed(Duration(milliseconds: 200));
    
    return Flashcard(
      id: request.cardId,
      creatorId: "mock_creator_id",
      setId: request.setId,
      question: request.question,
      answer: request.answer,
    );
  }
}