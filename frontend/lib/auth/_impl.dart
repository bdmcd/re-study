import 'package:restudy/auth/auth.dart';
import 'package:restudy/auth/firebase_impl/factory.dart';
import 'package:restudy/auth/mock_impl/factory.dart';

enum AuthImpl {
  FIREBASE,
  MOCK,
}

class AuthImplementation {
  // Change this variable to switch between auth implementations
  static const AuthImpl _impl = AuthImpl.FIREBASE;

  static AuthFactory createInstance() {
    switch(_impl) {
      case AuthImpl.FIREBASE:
        return FirebaseAuthFactory();
      case AuthImpl.MOCK:
        return MockAuthFactory();
    }

    return null;
  }
}