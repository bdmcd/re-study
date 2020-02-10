

import 'package:bloc_app/auth/authenticated_user.dart';
import 'package:flutter/foundation.dart';

abstract class Authenticater {
  Future<AuthenticatedUser> get currentUser;

  Future<AuthenticatedUser> registerWithEmail({
    @required String email, 
    @required String password,
  });

  Future<AuthenticatedUser> signInWithEmail({
    @required String email, 
    @required String password,
  });

  Future<AuthenticatedUser> signInWithGoogle();

  Future<void> signOut();
}