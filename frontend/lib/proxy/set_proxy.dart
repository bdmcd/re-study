import 'package:restudy/model/flash_card_set.dart';
import 'package:restudy/request/create_set_request.dart';

abstract class FlashcardSetProxy {
  Future<FlashcardSet> createSet(CreateSetRequest request);
  
  // Future<FlashcardSet> updateSet(UpdateSetRequest request);
  // Future<List<Flashcard>> getCards(GetCardsRequest request);
}
