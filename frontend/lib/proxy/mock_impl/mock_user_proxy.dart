import 'package:restudy/model/user.dart';
import 'package:restudy/proxy/user_proxy.dart';

class MockUserProxy implements UserProxy {
  @override
  Future<void> getCards(User user) async {
    // TODO: implement getCards
    return null;
  }

  @override
  Future<void> registerUser(User user) async {
    // TODO: implement registerUser
    return null;
  }
}