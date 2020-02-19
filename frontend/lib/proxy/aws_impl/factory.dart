
import 'package:restudy/proxy/aws_impl/aws_card_proxy.dart';
import 'package:restudy/proxy/aws_impl/aws_set_proxy.dart';
import 'package:restudy/proxy/aws_impl/aws_user_proxy.dart';
import 'package:restudy/proxy/card_proxy.dart';
import 'package:restudy/proxy/factory.dart';
import 'package:restudy/proxy/set_proxy.dart';
import 'package:restudy/proxy/user_proxy.dart';

class AWSProxyFactory implements ProxyFactory {
  @override
  CardProxy get cardProxy => AWSCardProxy();

  @override
  FlashcardSetProxy get setProxy => AWSSetProxy();

  @override
  UserProxy get userProxy => AWSUserProxy();
}