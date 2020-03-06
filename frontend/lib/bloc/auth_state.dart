part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthInitialState extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthLoadingState extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthDoneLoadingState extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthAuthenticatedState extends AuthState {
  final Future<String> Function() getToken;
  final User user;

  AuthAuthenticatedState({
    @required this.getToken,
    @required this.user,
  });

  get token async => await getToken();

  @override
  List<Object> get props => [];
}

class AuthUnauthenticatedState extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthErrorState extends AuthState {
  final String error;

  const AuthErrorState([this.error]);

  @override
  List<Object> get props => [error];
}
