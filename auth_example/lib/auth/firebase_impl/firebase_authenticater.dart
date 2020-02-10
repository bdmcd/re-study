import 'package:bloc_app/auth/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthenticater implements Authenticater {

  Future<AuthenticatedUser> get currentUser async {
    final firebaseUser = await FirebaseAuth.instance.currentUser();
    if (firebaseUser == null) {
      return null;
    }
    return _userFromFirebaseUser(firebaseUser);
  }

  Future<AuthenticatedUser> registerWithEmail({
    @required String email, 
    @required String password,
  }) async {
    final authResult = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email, 
      password: password,
    );

    return _userFromFirebaseUser(authResult.user);
  }

  Future<AuthenticatedUser> signInWithEmail({
    @required String email, 
    @required String password,
  }) async {
    final authResult = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email, 
      password: password,
    );

    return _userFromFirebaseUser(authResult.user);
  }

  Future<AuthenticatedUser> signInWithGoogle() async {
      final GoogleSignIn googleSignIn = GoogleSignIn();

      //NOTE: This will throw an exception that isn't caught if the user cancels the sign in, 
      //but only in DEBUG MODE and not in RELEASE MODE. This issue can safely be ignored
      final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
      if (googleSignInAccount == null) throw UserCancelledException();

      final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: googleSignInAuthentication.idToken, 
        accessToken: googleSignInAuthentication.accessToken,
      );

      final authResult = await FirebaseAuth.instance.signInWithCredential(credential);

      return _userFromFirebaseUser(authResult.user);
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  AuthenticatedUser _userFromFirebaseUser(FirebaseUser firebaseUser) {
    return AuthenticatedUser(
      email: firebaseUser.email,
      name: firebaseUser.displayName,
      uid: firebaseUser.uid,
      photoUrl: firebaseUser.photoUrl,
      token: () async => (await firebaseUser.getIdToken()).token,
    );
  }
}