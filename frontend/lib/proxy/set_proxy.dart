import 'package:restudy/model/cart_set.dart';

abstract class SetProxy {
  Future<void> createSet(CardSet cardSet);
  Future<void> updateSet(CardSet cardSet);
  Future<void> getCards(CardSet cardSet);
}