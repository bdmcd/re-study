import 'package:restudy/model/flash_card_set.dart';
import 'package:restudy/model/user.dart';
import 'package:restudy/proxy/user_proxy.dart';
import 'package:restudy/request/get_sets_request.dart';

class AWSUserProxy implements UserProxy {
  @override
  Future<List<FlashcardSet>> getSets(GetSetsRequest request) async {
    // TODO: implement getSets
    return null;
  }
}
