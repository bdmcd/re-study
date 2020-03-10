part of 'cards_bloc.dart';

abstract class CardsEvent extends Equatable {
  const CardsEvent();
}

class CardsInitEvent extends CardsEvent {

  CardsInitEvent();

  @override
  List<Object> get props => [];
}

class CardsEditSetEvent extends CardsEvent {
  @override
  List<Object> get props => [];
}

class CardsSaveSetEvent extends CardsEvent {
  @override
  List<Object> get props => [];
}

class CardsCancelSaveSetEvent extends CardsEvent {
  @override
  List<Object> get props => [];
}

class CardsDeleteSetEvent extends CardsEvent {
  @override
  List<Object> get props => [];
}

class CardsAddCardEvent extends CardsEvent {
  @override
  List<Object> get props => [];
}

class CardsSaveCardEvent extends CardsEvent {
  @override
  List<Object> get props => [];
}

class CardsStudyEvent extends CardsEvent {
  @override
  List<Object> get props => [];
}

class CardsDoneStudyingEvent extends CardsEvent {
  @override
  List<Object> get props => [];
}

class CardsEditCardEvent extends CardsEvent {
  @override
  List<Object> get props => [];
}

class CardsDeleteCardEvent extends CardsEvent {
  @override
  List<Object> get props => [];
}

class CardsDeleteCardFromEditSetEvent extends CardsEvent {
  @override
  List<Object> get props => [];
}

class CardsMoveCardEvent extends CardsEvent {
  @override
  List<Object> get props => [];
}

class CardsCancelMoveCardEvent extends CardsEvent {
  @override
  List<Object> get props => [];
}

class CardsMoveCardToSetEvent extends CardsEvent {
  @override
  List<Object> get props => [];
}

class CardsCancelAddCardEvent extends CardsEvent {
  @override
  List<Object> get props => [];
}

class CardsSaveAddCardEvent extends CardsEvent {
  @override
  List<Object> get props => [];
}