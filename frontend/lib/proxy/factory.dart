
import 'package:restudy/proxy/_impl.dart';
import 'package:restudy/proxy/card_proxy.dart';
import 'package:restudy/proxy/set_proxy.dart';
import 'package:restudy/proxy/user_proxy.dart';

abstract class ProxyFactory {
  static ProxyFactory _instance;
  static ProxyFactory get instance {
    if (_instance == null) {
      _instance = ProxyImplementation.createInstance();
    }

    return _instance;
  }

  CardProxy get cardProxy;
  SetProxy get setProxy;
  UserProxy get userProxy;
}