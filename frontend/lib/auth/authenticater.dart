

import 'package:restudy/auth/auth_user.dart';
import 'package:flutter/foundation.dart';

abstract class Authenticater {
  Future<AuthUser> get currentUser;
  Future<bool> get signedIn;

  Future<AuthUser> registerWithEmail({
    @required String email, 
    @required String password,
  });

  Future<AuthUser> signInWithEmail({
    @required String email, 
    @required String password,
  });

  Future<AuthUser> signInWithGoogle();

  Future<void> signOut();
}