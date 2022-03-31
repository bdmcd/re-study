import 'package:restudy/model/flash_card.dart';
import 'package:restudy/model/flash_card_set.dart';
import 'package:restudy/request/create_set_request.dart';
import 'package:restudy/request/get_cards_request.dart';
import 'package:restudy/request/update_set_request.dart';

abstract class FlashcardSetProxy {
  Future<FlashcardSet> createSet(CreateSetRequest request);
  Future<List<Flashcard>> getCards(GetCardsRequest request);

  Future<FlashcardSet> updateSet(UpdateSetRequest request);
}
