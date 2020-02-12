
import 'package:restudy/proxy/card_proxy.dart';
import 'package:restudy/proxy/factory.dart';
import 'package:restudy/proxy/mock_impl/mock_card_proxy.dart';
import 'package:restudy/proxy/mock_impl/mock_set_proxy.dart';
import 'package:restudy/proxy/mock_impl/mock_user_proxy.dart';
import 'package:restudy/proxy/proxy.dart';
import 'package:restudy/proxy/user_proxy.dart';

class MockProxyFactory implements ProxyFactory {
  @override
  CardProxy get cardProxy => MockCardProxy();

  @override
  FlashCardSetProxy get setProxy => MockSetProxy();

  @override
  UserProxy get userProxy => MockUserProxy();
}