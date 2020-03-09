
import 'package:restudy/model/flash_card.dart';
import 'package:restudy/model/flash_card_set.dart';
import 'package:restudy/proxy/set_proxy.dart';
import 'package:restudy/request/get_cards_request.dart';

class AWSSetProxy implements FlashcardSetProxy {
  @override
  Future<FlashcardSet> createSet(request) {
    // TODO: implement createSet
    return null;
  }

  @override
  Future<FlashcardSet> updateSet(request) {
    // TODO: implement updateSet
    return null;
  }

  @override
  Future<List<Flashcard>> getCards(GetCardsRequest request) {
    // TODO: implement getCards
    return null;
  }

}