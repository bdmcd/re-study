
import 'package:flutter/foundation.dart';

class AuthUser {
  final String name;
  final String email;
  final String uid;
  final String photoUrl;

  final Future<String> Function() token;

  AuthUser({
    @required this.email,
    @required this.uid,
    @required this.token,
    
    this.name,
    this.photoUrl,
  });
}