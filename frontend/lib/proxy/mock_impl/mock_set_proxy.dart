import 'package:restudy/model/flash_card.dart';
import 'package:restudy/model/flash_card_set.dart';
import 'package:restudy/proxy/proxy.dart';
import 'package:restudy/request/get_cards_request.dart';

class MockSetProxy implements FlashcardSetProxy {
  @override
  Future<FlashcardSet> createSet(request) async {
    // TODO: implement createSet
    return null;
  }

  @override
  Future<FlashcardSet> updateSet(request) async {
    // TODO: implement updateSet
    return null;
  }

  @override
  Future<List<Flashcard>> getCards(GetCardsRequest request) async {
    // TODO: implement getCards
    await Future.delayed(Duration(milliseconds: 200));

    final mockCards = [
      Flashcard(answer: "Blue", question: "What color is the sky?", creatorId: "98h7gy23efwr", setId: "90238dj98jd", retentionScore: 90.0),
      Flashcard(answer: "Clear", question: "What color is the water?", creatorId: "98h7gy23efwr", setId: "90238dj98jd", retentionScore: 90.0),
      Flashcard(answer: "Yellow", question: "What color is the sun?", creatorId: "98h7gy23efwr", setId: "90238dj98jd", retentionScore: 90.0),
      Flashcard(answer: "Green", question: "What color is the grass?", creatorId: "98h7gy23efwr", setId: "90238dj98jd", retentionScore: 90.0),
      Flashcard(answer: "Red", question: "What color is the blood?", creatorId: "98h7gy23efwr", setId: "90238dj98jd", retentionScore: 90.0),
    ];

    return mockCards;
  }
}
