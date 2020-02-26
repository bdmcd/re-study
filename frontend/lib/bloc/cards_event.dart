part of 'cards_bloc.dart';

abstract class CardsEvent extends Equatable {
  const CardsEvent();
}

class CardsInitEvent extends CardsEvent {
  @override
  List<Object> get props => [];
}

class CardsEditEvent extends CardsEvent {
  @override
  List<Object> get props => [];
}

class CardsSaveEvent extends CardsEvent {
  @override
  List<Object> get props => [];
}

class CardsAddCardEvent extends CardsEvent {
  @override
  List<Object> get props => [];
}

class CardsStudyEvent extends CardsEvent {
  @override
  List<Object> get props => [];
}