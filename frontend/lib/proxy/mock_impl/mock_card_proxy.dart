
import 'package:restudy/model/card.dart';
import 'package:restudy/proxy/card_proxy.dart';
import 'package:restudy/request/create_card_request.dart';

class MockCardProxy implements CardProxy {
  @override
  Future<Card> createCard(CreateCardRequest cardRequest) async {
    await Future.delayed(Duration(milliseconds: 200));
    
    return Card(
      id: "mock_card_id",
      setId: cardRequest.setId,
      creatorId: cardRequest.creatorId,
      question: cardRequest.question,
      answer: cardRequest.answer,
      retentionScore: 0,
    );
  }

  @override
  Future<Card> updateCard(CreateCardRequest cardRequest) async {
    // TODO: implement updateCard
    return null;
  }
}