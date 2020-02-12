
import 'package:restudy/auth/auth.dart';
import 'package:restudy/auth/mock_impl/mock_authenticater.dart';

class MockAuthFactory implements AuthFactory {
  @override
  Authenticater get authenticater => MockAuthenticater();
}