part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class AuthInitEvent extends AuthEvent {
  @override
  List<Object> get props => [];
}

class AuthRegisterEvent extends AuthEvent {
  final String email;
  final String password;

  AuthRegisterEvent({
    @required this.email,
    @required this.password,
  });

  @override
  List<Object> get props => [email, password];
}

class AuthSignInEvent extends AuthEvent {
  final String email;
  final String password;

  AuthSignInEvent({
    @required this.email,
    @required this.password,
  });

  @override
  List<Object> get props => [email, password];
}

class AuthSignInWithGoogleEvent extends AuthEvent {
  @override
  List<Object> get props => [];
}

class AuthSignOutEvent extends AuthEvent {
  @override
  List<Object> get props => [];
}