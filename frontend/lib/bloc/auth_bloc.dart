import 'dart:async';
import 'dart:math';

import 'package:restudy/auth/auth.dart';
import 'package:restudy/model/user.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  static AuthBloc of(BuildContext context) => BlocProvider.of<AuthBloc>(context);

  Authenticater _authenticater = AuthenticatorFactory.create();

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
    final authUser = await _authenticater.currentUser;
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
      final firebaseUser = await _authenticater.registerWithEmail(
        email: event.email,
        password: event.password,
      );
      yield _stateFromAuthUser(firebaseUser);

    } on PlatformException catch(e) {
      switch(e.code) {
        case "ERROR_EMAIL_ALREADY_IN_USE":
        yield* _flashError(AuthErrorState("This email is already in use"), savedState);
          break;
        default:
          yield* _flashError(AuthErrorState("Error registering user"), savedState);
          break;
      }
    } catch(e) {
      yield* _flashError(AuthErrorState("Error registering user"), savedState);
    }
  }

  Stream<AuthState> _signIn(AuthSignInEvent event) async* {
    final savedState = state;
    yield AuthLoadingState();

    try {
      final firebaseUser = await _authenticater.signInWithEmail(
        email: event.email,
        password: event.password,
      );
      yield _stateFromAuthUser(firebaseUser);

    } on PlatformException catch(e) {
      switch(e.code) {
        case "ERROR_WRONG_PASSWORD":
          yield* _flashError(AuthErrorState("Incorrect Email or Password"), savedState);
          break;
        default:
          yield*  _flashError(AuthErrorState("Error signing in"), savedState);
          break;
      }
    } catch(e) {
      yield* _flashError(AuthErrorState("Error signing in"), savedState);
    }
  }

  Stream<AuthState> _signInWithGoogle(AuthSignInWithGoogleEvent event) async* {
    final savedState = state;
    yield AuthLoadingState();

    try {
      final firebaseUser = await _authenticater.signInWithGoogle();
      yield _stateFromAuthUser(firebaseUser);

    } on UserCancelledException {
      yield savedState;
    } catch(e) {
      print(e.toString());
      yield* _flashError(AuthErrorState("Error signing in with Google"), savedState);
    }
  }

  Stream<AuthState> _signOut(AuthSignOutEvent event) async* {
    final savedState = state;
    yield AuthLoadingState();

    try {
      await _authenticater.signOut();
    } catch(e) {
      yield* _flashError(AuthErrorState("Could not sign out the user"), savedState);
    }
  }

  Stream<AuthState> _flashError(AuthState errorState, AuthState afterErrorState) async* {
    yield errorState;
    yield afterErrorState;
  }

  AuthState _stateFromAuthUser(AuthenticatedUser authUser) {
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
