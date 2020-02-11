
import 'package:restudy/auth/authenticater.dart';
import 'package:restudy/auth/firebase_impl/firebase_authenticater.dart';

import 'impl.dart';

class AuthenticatorFactory {
  static Authenticater create() {
    switch(impl) {
      case AuthenticaterImpl.FIREBASE:
        return FirebaseAuthenticater();
    }

    return null;
  }
}