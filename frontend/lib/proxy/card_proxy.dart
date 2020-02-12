
import 'package:restudy/model/card.dart';
import 'package:restudy/request/create_card_request.dart';

abstract class CardProxy {
  Future<Card> createCard(CreateCardRequest cardRequest);
  Future<Card> updateCard(CreateCardRequest cardRequest);
}