
import 'package:restudy/model/flash_card_set.dart';
import 'package:restudy/proxy/set_proxy.dart';
import 'package:restudy/model/create_set_request.dart';

class AWSSetProxy implements FlashcardSetProxy {
  @override
  Future<FlashcardSet> createSet(CreateSetRequest request) {
    return null;
  }
}