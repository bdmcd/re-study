
import 'package:flutter_test/flutter_test.dart';
import 'package:restudy/proxy/mock_impl/mock_card_proxy.dart';
import 'package:restudy/request/create_card_request.dart';

void main() {
  final cardProxy = MockCardProxy();
  test('Should be able to create a card', () async {
    CreateCardRequest request = CreateCardRequest(
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
}