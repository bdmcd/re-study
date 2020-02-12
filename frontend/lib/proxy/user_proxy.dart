
import 'package:restudy/model/user.dart';

abstract class UserProxy {
  Future<void> registerUser(User user);
  Future<void> getCards(User user);
}