part of 'cards_bloc.dart';

abstract class CardsState extends Equatable {
  const CardsState();
}

class CardsInitialState extends CardsState {
  final List<Flashcard> flashcards;

  CardsInitialState({@required this.flashcards});

  @override
  List<Object> get props => [flashcards];
}

class CardsEditingSetState extends CardsState {
  final List<Flashcard> cards;

  CardsEditingSetState({this.cards});
  @override
  List<Object> get props => [cards];
}

class CardsAddingCardState extends CardsState {
  @override
  List<Object> get props => [];
}

class CardsLoadingState extends CardsState {
  @override
  List<Object> get props => [];
}

class CardsStudyState extends CardsState {
  @override
  List<Object> get props => [];
}

class CardsEditingCardState extends CardsState {
  final Flashcard card;

  CardsEditingCardState({this.card});
  @override
  List<Object> get props => [];
}

class CardsStillEditingSetState extends CardsState {
  @override
  List<Object> get props => [];
}

class CardsMovingCardState extends CardsState {
  final List<FlashcardSet> setInfo;

  CardsMovingCardState({this.setInfo});
  @override
  List<Object> get props => [setInfo];
}

class CardsDeletedState extends CardsState {
  @override
  List<Object> get props => [];
}

class CardsCancelledMoveCardState extends CardsState {
  @override
  List<Object> get props => [];
}

class CardsDoneLoadingState extends CardsState {
  @override
  List<Object> get props => [];
}

class CardsCardMovedState extends CardsState {
  @override
  List<Object> get props => [];
}

class CardsErrorState extends CardsState {
  final String error;

  const CardsErrorState([this.error]);

  @override
  List<Object> get props => [error];
}
