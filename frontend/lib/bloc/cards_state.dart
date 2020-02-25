part of 'cards_bloc.dart';

abstract class CardsState extends Equatable {
  const CardsState();
}

class SetInitialState extends CardsState {
  @override
  List<Object> get props => [];
}

class CardsEditingState extends CardsState {
  @override
  List<Object> get props => [];
}

class CardsSavedState extends CardsState {
  @override
  List<Object> get props => [];
}

class CardsAddCardState extends CardsState {
  @override
  List<Object> get props => [];
}