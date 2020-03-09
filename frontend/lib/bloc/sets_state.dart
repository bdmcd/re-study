part of 'sets_bloc.dart';

abstract class SetsState extends Equatable {
  const SetsState();
}

class SetsInitialState extends SetsState {
  final List<FlashcardSet> flashcards;

  SetsInitialState(this.flashcards);

  @override
  List<Object> get props => [flashcards];
}

class SetsLoadingState extends SetsState {
  @override
  List<Object> get props => [];
}

class AddSetState extends SetsState {
  @override
  List<Object> get props => [];
}

class AddSetsErrorState extends SetsState {
  final String error;

  const AddSetsErrorState([this.error]);

  @override
  List<Object> get props => [error];
}
