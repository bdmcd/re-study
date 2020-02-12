
import 'package:restudy/auth/authenticater.dart';

import '_impl.dart';

abstract class AuthFactory {
  static AuthFactory _instance;
  static AuthFactory get instance {
    if (_instance == null) {
      _instance = AuthImplementation.createInstance();
    }

    return _instance;
  }
  Authenticater get authenticater;
}