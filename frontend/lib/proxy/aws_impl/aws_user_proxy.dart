import 'package:restudy/model/flash_card_set.dart';
import 'package:restudy/model/get_sets_request.dart';
import 'package:restudy/model/user.dart';
import 'package:restudy/proxy/user_proxy.dart';

class AWSUserProxy implements UserProxy {
  @override
  Future<List<FlashcardSet>> getSets(GetSetsRequest request) {
    // TODO: implement getSets
    return null;
  }
}
