import 'package:restudy/proxy/factory.dart';
import 'package:restudy/proxy/aws_impl/factory.dart';
import 'package:restudy/proxy/mock_impl/factory.dart';

enum ProxyImpl {
  AWS,
  MOCK,
}

class ProxyImplementation {
  // Change this variable to switch between api proxy implementations
  static const ProxyImpl _impl = ProxyImpl.MOCK;

  static ProxyFactory createInstance([ProxyImpl impl = _impl]) {
    switch (impl) {
      case ProxyImpl.AWS:
        return AWSProxyFactory();
      case ProxyImpl.MOCK:
        return MockProxyFactory();
    }

    return null;
  }
}