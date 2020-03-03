import 'package:restudy/model/flash_card_set.dart';
import 'package:restudy/model/get_sets_request.dart';
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

  @override
  Future<List<FlashcardSet>> getSets(GetSetsRequest request) {
    // TODO: implement getSets
    // final mockSets = [
    //   SetInfo(setTitle: "Biology", accuracy: 10.3, numCards: 17, guid: "1"),
    //   SetInfo(setTitle: "Chemistry", accuracy: 5.7, numCards: 20, guid: "2"),
    //   SetInfo(setTitle: "CS 428", accuracy: 80.9, numCards: 13, guid: "3"),
    //   SetInfo(setTitle: "English", accuracy: 12.4, numCards: 8, guid: "4"),
    //   SetInfo(setTitle: "Spanish", accuracy: 33.0, numCards: 42, guid: "5"),
    //   SetInfo(
    //       setTitle: "Book of Mormon", accuracy: 46.2, numCards: 14, guid: "6"),
    // ];
    return null;
  }
}
