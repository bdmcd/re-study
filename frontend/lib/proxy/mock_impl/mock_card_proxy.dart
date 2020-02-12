
import 'package:restudy/model/flash_card.dart';
import 'package:restudy/proxy/card_proxy.dart';
import 'package:restudy/request/create_flashcard_request.dart';

class MockCardProxy implements CardProxy {
  @override
  Future<FlashCard> createCard(CreateFlashCardRequest cardRequest) async {
    await Future.delayed(Duration(milliseconds: 200));
    
    return FlashCard(
      id: "mock_card_id",
      setId: cardRequest.setId,
      creatorId: cardRequest.creatorId,
      question: cardRequest.question,
      answer: cardRequest.answer,
      retentionScore: 0,
    );
  }
}