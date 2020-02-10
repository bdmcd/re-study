
import 'package:bloc_app/auth/authenticater.dart';
import 'package:bloc_app/auth/firebase_impl/firebase_authenticater.dart';

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