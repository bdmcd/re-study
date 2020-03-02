import 'dart:async';

import 'package:restudy/auth/auth.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sets_event.dart';
part 'sets_state.dart';

class SetsBloc extends Bloc<SetsEvent, SetsState> {
  static SetsBloc of(BuildContext context) =>
      BlocProvider.of<SetsBloc>(context);

  Authenticater _auth = AuthFactory.instance.authenticater;

  SetsBloc() {
    init();
  }

  Future<void> init() async {
    this.add(SetsInitEvent());
  }

  @override
  SetsState get initialState => SetsLoadingState();

  @override
  Stream<SetsState> mapEventToState(
    SetsEvent event,
  ) async* {
    if (event is SetsInitEvent) {
      yield* _initialize(event);
    }
    if (event is AddSetEvent) {
      yield* _addSet(event);
    }
    if (event is SaveSetEvent) {
      yield* _saveSet(event);
    }
  }

  Stream<SetsState> _initialize(SetsInitEvent event) async* {
    final authUser = await _auth.currentUser;
    print("In init sets");
    yield SetsInitialState();
  }

  Stream<SetsState> _saveSet(SaveSetEvent event) async* {
    print("In save set:" + event.setTitle);
    yield SetsInitialState();
  }

  Stream<SetsState> _addSet(AddSetEvent event) async* {
    final savedState = state;
    print("In add set");
    yield AddSetState();
    // yield AuthLoadingState();

    // try {
    //   final firebaseUser = await _auth.registerWithEmail(
    //     email: event.email,
    //     password: event.password,
    //   );
    //   yield _stateFromAuthUser(firebaseUser);

    // } on UserAlreadyExistsException {
    //   yield* _flashError(AuthErrorState("This email is already in use"), savedState);
    // } catch(e) {
    //   print('Unknown exception caught in AuthBloc._register() $e');
    //   yield* _flashError(AuthErrorState("Error registering user"), savedState);
    // }
  }

  // Stream<AuthState> _signIn(AuthSignInEvent event) async* {
  //   final savedState = state;
  //   yield AuthLoadingState();

  //   try {
  //     final firebaseUser = await _auth.signInWithEmail(
  //       email: event.email,
  //       password: event.password,
  //     );
  //     yield _stateFromAuthUser(firebaseUser);

  //   } on InvalidEmailOrPasswordException {
  //     yield* _flashError(AuthErrorState("Incorrect Email or Password"), savedState);
  //   } catch(e) {
  //     print('Unknown exception caught in AuthBloc._signIn() $e');
  //     yield* _flashError(AuthErrorState("Error signing in"), savedState);
  //   }
  // }

  // Stream<AuthState> _signInWithGoogle(AuthSignInWithGoogleEvent event) async* {
  //   final savedState = state;
  //   yield AuthLoadingState();

  //   try {
  //     final firebaseUser = await _auth.signInWithGoogle();
  //     yield _stateFromAuthUser(firebaseUser);

  //   } on UserCancelledException {
  //     yield savedState;
  //   } catch(e) {
  //     print('Unknown exception caught in AuthBloc._signInWithGoogle() $e');
  //     yield* _flashError(AuthErrorState("Error signing in with Google"), savedState);
  //   }
  // }

  // Stream<AuthState> _signOut(AuthSignOutEvent event) async* {
  //   final savedState = state;
  //   yield AuthLoadingState();

  //   try {
  //     await _auth.signOut();
  //     yield AuthUnauthenticatedState();
  //   } catch(e) {
  //     print('Unknown exception caught in AuthBloc._signOut() $e');
  //     yield* _flashError(AuthErrorState("Could not sign out the user"), savedState);
  //   }
  // }

  // Stream<AuthState> _flashError(AuthState errorState, AuthState afterErrorState) async* {
  //   yield errorState;
  //   yield afterErrorState;
  // }

  // AuthState _stateFromAuthUser(AuthUser authUser) {
  //   if (authUser == null) {
  //     return AuthUnauthenticatedState();
  //   }

  //   return AuthAuthenticatedState(
  //     getToken: authUser.token,
  //     user: User(
  //       id: authUser.uid,
  //       email: authUser.email,
  //       name: authUser.name,
  //       photoUrl: authUser.photoUrl,
  //     )
  //   );
  // }
}
