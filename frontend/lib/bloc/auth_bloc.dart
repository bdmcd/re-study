import 'dart:async';

import 'package:restudy/auth/auth.dart';
import 'package:restudy/auth/mock_impl/mock_authenticater.dart';
import 'package:restudy/model/user.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  static AuthBloc of(BuildContext context) => BlocProvider.of<AuthBloc>(context);

  MockAuthenticater _auth = AuthFactory.instance.authenticater;
  // final _auth = AuthFactory.instance.authenticater;

  AuthBloc() {
    init();
  }

  Future<void> init() async {
    this.add(AuthInitEvent());
  }

  @override
  AuthState get initialState => AuthLoadingState();

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is AuthInitEvent) {
      yield* _initialize(event);
    } if (event is AuthRegisterEvent) {
      yield* _register(event);
    } else if (event is AuthSignInEvent) {
      yield* _signIn(event);
    } else if (event is AuthSignInWithGoogleEvent){
      yield* _signInWithGoogle(event);
    } else if (event is AuthSignOutEvent) {
      yield* _signOut(event);
    }
  }

  Stream<AuthState> _initialize(AuthInitEvent event) async* {
    final authUser = await _auth.currentUser;
    if (authUser == null) {
      yield AuthUnauthenticatedState();
    } else {
      yield _stateFromAuthUser(authUser);
    }
  }
  
  Stream<AuthState> _register(AuthRegisterEvent event) async* {
    final savedState = state;
    yield AuthLoadingState();

    try {
      final firebaseUser = await _auth.registerWithEmail(
        email: event.email,
        password: event.password,
      );
      yield AuthDoneLoadingState();
      yield _stateFromAuthUser(firebaseUser);

    } on UserAlreadyExistsException {
      yield AuthDoneLoadingState();
      yield* _flashError(AuthErrorState("This email is already in use"), savedState);
    } catch(e) {
      print('Unknown exception caught in AuthBloc._register() $e');
      yield* _flashError(AuthErrorState("Error registering user"), savedState);
    }
  }

  Stream<AuthState> _signIn(AuthSignInEvent event) async* {
    final savedState = state;
    yield AuthLoadingState();

    try {
      final firebaseUser = await _auth.signInWithEmail(
        email: event.email,
        password: event.password,
      );
      yield AuthDoneLoadingState();
      yield _stateFromAuthUser(firebaseUser);

    } on InvalidEmailOrPasswordException {
      yield AuthDoneLoadingState();
      yield* _flashError(AuthErrorState("Incorrect Email or Password"), savedState);
    } catch(e) {
      print('Unknown exception caught in AuthBloc._signIn() $e');
      yield* _flashError(AuthErrorState("Error signing in"), savedState);
    }
  }

  Stream<AuthState> _signInWithGoogle(AuthSignInWithGoogleEvent event) async* {
    final savedState = state;
    yield AuthLoadingState();

    try {
      final firebaseUser = await _auth.signInWithGoogle();
      yield AuthDoneLoadingState();
      yield _stateFromAuthUser(firebaseUser);

    } on UserCancelledException {
      yield AuthDoneLoadingState();
      yield savedState;
    } catch(e) {
      print('Unknown exception caught in AuthBloc._signInWithGoogle() $e');
      yield* _flashError(AuthErrorState("Error signing in with Google"), savedState);
    }
  }

  Stream<AuthState> _signOut(AuthSignOutEvent event) async* {
    final savedState = state;
    yield AuthLoadingState();

    try {
      await _auth.signOut();
      yield AuthDoneLoadingState();
      yield AuthUnauthenticatedState();
    } catch(e) {
      print('Unknown exception caught in AuthBloc._signOut() $e');
      yield* _flashError(AuthErrorState("Could not sign out the user"), savedState);
    }
  }

  Stream<AuthState> _flashError(AuthState errorState, AuthState afterErrorState) async* {
    yield errorState;
    yield afterErrorState;
  }

  AuthState _stateFromAuthUser(AuthUser authUser) {
    if (authUser == null) {
      return AuthUnauthenticatedState();
    }
    
    return AuthAuthenticatedState(
      getToken: authUser.token,
      user: User(
        id: authUser.uid,
        email: authUser.email,
        name: authUser.name,
        photoUrl: authUser.photoUrl,
      )
    );
  }
}
