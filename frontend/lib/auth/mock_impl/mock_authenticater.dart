
import 'package:restudy/auth/auth.dart';

class MockAuthenticater implements Authenticater {
  AuthUser _user;

  Map<String, String> _mockUserMap = {
    "user1@gmail.com": "Password1",
    "user2@gmail.com": "Password2"
  };

  @override
  Future<AuthUser> get currentUser async => _user;

  @override
  Future<bool> get signedIn async => (await currentUser) != null;

  @override
  Future<AuthUser> registerWithEmail({String email, String password}) async {
    await Future.delayed(Duration(milliseconds: 1000));

    if (_mockUserMap.containsKey(email)) {
      throw UserAlreadyExistsException();
    }

    _mockUserMap[email] = password;

    _user = AuthUser(
      email: email,
      uid: "uid_$email",
      token: () async => "mock_token",
    );

    return _user;
  }

  @override
  Future<AuthUser> signInWithEmail({String email, String password}) async {
    await Future.delayed(Duration(milliseconds: 1000));

    if (_mockUserMap[email] != password) {
      throw InvalidEmailOrPasswordException();
    }

    _user = AuthUser(
      email: email,
      uid: "uid_$email",
      token: () async => "mock_token"
    );

    return _user;
  }

  @override
  Future<AuthUser> signInWithGoogle() async {
    await Future.delayed(Duration(milliseconds: 1000));

    final email = "google_user@gmail.com";
    _user = AuthUser(
      email: email,
      uid: "uid_$email",
      token: () async => "mock_token",
    );

    return _user;
  }

  @override
  Future<void> signOut() async {
    await Future.delayed(Duration(milliseconds: 100));
    _user = null;
  }
}