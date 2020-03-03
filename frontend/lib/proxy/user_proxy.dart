import 'package:restudy/model/flash_card_set.dart';
import 'package:restudy/model/get_sets_request.dart';

abstract class UserProxy {
  // Future<User> registerUser(RegisterUserRequest request);
  Future<List<FlashcardSet>> getSets(GetSetsRequest request);
}
