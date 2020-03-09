import 'package:restudy/model/flash_card_set.dart';
import 'package:restudy/model/user.dart';
import 'package:restudy/proxy/user_proxy.dart';
import 'package:restudy/request/get_sets_request.dart';

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
  Future<List<FlashcardSet>> getSets(GetSetsRequest request) async {
    print("IN GET SETS MOCK");
    // TODO: implement getSets
    await Future.delayed(Duration(milliseconds: 200));

    final mockSets = [
      FlashcardSet(name: "Biology", creatorId: "1", id: "1"),
      FlashcardSet(name: "Chemistry", creatorId: "2", id: "2"),
      FlashcardSet(name: "CS 428", creatorId: "3", id: "3"),
      FlashcardSet(name: "English", creatorId: "4", id: "4"),
      FlashcardSet(name: "Spanish", creatorId: "5", id: "5"),
      FlashcardSet(name: "Book of Mormon", creatorId: "6", id: "6"),
    ];
    return mockSets;
  }
}
