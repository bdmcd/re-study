
import 'package:restudy/model/flash_card.dart';
import 'package:restudy/proxy/card_proxy.dart';
import 'package:restudy/request/create_flashcard_request.dart';


class AWSCardProxy implements CardProxy {
  @override
  Future<Flashcard> createCard(CreateFlashcardRequest request) async {
    // TODO: implement createCard
    return null;
  }
}