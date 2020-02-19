
import 'package:restudy/auth/auth.dart';
import 'package:restudy/auth/firebase_impl/firebase_authenticater.dart';

class FirebaseAuthFactory implements AuthFactory {
  @override
  Authenticater get authenticater => FirebaseAuthenticater();
}