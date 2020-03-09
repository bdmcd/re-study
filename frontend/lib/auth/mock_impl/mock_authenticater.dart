import 'package:restudy/auth/auth.dart';

class MockAuthenticater implements Authenticater {
  AuthUser _user = AuthUser(
    email: "user1@gmail.com",
    uid: "uid_user1@gmail.com",
    token: () async => "mock_token",
  );

  Map<String, String> _mockUserMap = {
    "user1@gmail.com": "Password1",
    "user2@gmail.com": "Password2"
  };

  @override
  Future<AuthUser> get currentUser async => this._user;

  @override
  Future<bool> get signedIn async => (await currentUser) != null;

  @override
  Future<AuthUser> registerWithEmail({String email, String password}) async {
    await Future.delayed(Duration(milliseconds: 1000));

    if (_mockUserMap.containsKey(email)) {
      throw UserAlreadyExistsException();
    }

    _mockUserMap[email] = password;

    this._user = AuthUser(
      email: email,
      uid: "uid_$email",
      token: () async => "mock_token",
    );

    return this._user;
  }

  @override
  Future<AuthUser> signInWithEmail({String email, String password}) async {
    await Future.delayed(Duration(milliseconds: 1000));
    print(email + password);

    if (_mockUserMap[email] != password) {
      throw InvalidEmailOrPasswordException();
    }

    this._user = AuthUser(
        email: email, uid: "uid_$email", token: () async => "mock_token");

    return this._user;
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
