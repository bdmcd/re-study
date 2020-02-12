
import 'package:restudy/model/flash_card.dart';
import 'package:restudy/request/create_flashcard_request.dart';

abstract class CardProxy {
  Future<FlashCard> createCard(CreateFlashCardRequest cardRequest);
}