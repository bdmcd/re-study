part of 'sets_bloc.dart';

abstract class SetsState extends Equatable {
  const SetsState();
}

class SetsInitialState extends SetsState {
  @override
  List<Object> get props => [];
}

class SetsLoadingState extends SetsState {
  @override
  List<Object> get props => [];
}

class AddSetState extends SetsState {
  @override
  List<Object> get props => [];
}

class AuthErrorState extends SetsState {
  final String error;

  const AuthErrorState([this.error]);

  @override
  List<Object> get props => [error];
}
