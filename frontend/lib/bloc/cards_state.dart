part of 'cards_bloc.dart';

abstract class CardsState extends Equatable {
  const CardsState();
}

class CardsInitialState extends CardsState {
  @override
  List<Object> get props => [];
}

class CardsEditingSetState extends CardsState {
  @override
  List<Object> get props => [];
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
  @override
  List<Object> get props => [];
}

class CardsMovingCardState extends CardsState {
  @override
  List<Object> get props => [];
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
