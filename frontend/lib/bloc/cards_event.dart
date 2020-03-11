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
  final String setGuid;
  final String updatedName;

  CardsSaveSetEvent({this.setGuid, this.updatedName});
  @override
  List<Object> get props => [setGuid, updatedName];
}

class CardsCancelSaveSetEvent extends CardsEvent {
  @override
  List<Object> get props => [];
}

class CardsDeleteSetEvent extends CardsEvent {
  final String setId;
  CardsDeleteSetEvent({this.setId});

  @override
  List<Object> get props => [setId];
}

class CardsAddCardEvent extends CardsEvent {
  @override
  List<Object> get props => [];
}

class CardsSaveCardEvent extends CardsEvent {
  final String guid;
  final String question;
  final String answer;

  CardsSaveCardEvent({this.guid, this.question, this.answer});

  @override
  List<Object> get props => [guid, question, answer];
}

class CardsStudyEvent extends CardsEvent {
  @override
  List<Object> get props => [];
}

class CardsEditCardEvent extends CardsEvent {
  final Flashcard card;

  CardsEditCardEvent({this.card});
  @override
  List<Object> get props => [card];
}

class CardsDeleteCardEvent extends CardsEvent {
  final Flashcard card;

  CardsDeleteCardEvent({this.card});
  @override
  List<Object> get props => [card];
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
  final String cardGuid;
  final String setId;

  CardsMoveCardToSetEvent({this.cardGuid, this.setId});
  @override
  List<Object> get props => [cardGuid, setId];
}

class CardsCancelAddCardEvent extends CardsEvent {
  @override
  List<Object> get props => [];
}

class CardsSaveAddCardEvent extends CardsEvent {
  @override
  List<Object> get props => [];
}
