import 'package:restudy/model/flash_card_set.dart';
import 'package:restudy/proxy/proxy.dart';
import 'package:restudy/model/create_set_request.dart';

class MockSetProxy implements FlashcardSetProxy {
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
}
