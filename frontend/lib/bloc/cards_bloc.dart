import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restudy/auth/auth.dart';
import 'package:restudy/model/flash_card.dart';
import 'package:restudy/model/flash_card_set.dart';
import 'package:restudy/proxy/factory.dart';
import 'package:restudy/proxy/mock_impl/mock_set_proxy.dart';
import 'package:restudy/request/get_cards_request.dart';
import 'package:restudy/request/get_sets_request.dart';
import 'package:restudy/request/update_flashcard_request.dart';
import 'package:restudy/request/update_set_request.dart';

part 'cards_event.dart';
part 'cards_state.dart';

class CardsBloc extends Bloc<CardsEvent, CardsState> {
  static CardsBloc of(BuildContext context) => BlocProvider.of<CardsBloc>(context);
  Authenticater _auth = AuthFactory.instance.authenticater;
  final String setGuid;

  CardsBloc(this.setGuid) {
    init(this.setGuid);
  }
  
  Future<void> init(setGuid) async {
    this.add(CardsInitEvent());
  }

  @override
  CardsState get initialState => CardsInitialState(flashcards: List<Flashcard>());

  @override
  Stream<CardsState> mapEventToState(
    CardsEvent event,
  ) async* {
    if (event is CardsInitEvent) {
      yield* _initialize(event);
    } if (event is CardsEditSetEvent) {
      yield* _editSet(event);
    } else if (event is CardsAddCardEvent){
      yield* _goToAddCard(event);
    } else if (event is CardsStudyEvent) {
      // TODO: make this work
      // yield* _signOut(event);
    } else if (event is CardsMoveCardEvent) {
      yield* _goToMoveCard(event);
    } else if (event is CardsCancelMoveCardEvent) {
      yield* _cancelMoveCard(event);
    } else if (event is CardsEditCardEvent) {
      yield* _editCard(event);
    } else if (event is CardsSaveCardEvent) {
      yield* _saveCard(event);
    } else if (event is CardsMoveCardToSetEvent) {
      yield* _moveCardToSet(event);
    } else if (event is CardsSaveSetEvent) {
      yield* _saveSet(event);
    } else if (event is CardsCancelAddCardEvent) {
      yield* _cancelAddCard(event);
    } else if (event is CardsSaveAddCardEvent) {
      yield* _saveAddCard(event);
    } else if (event is CardsDeleteSetEvent) {
      yield* _deleteSet(event);
    } else if (event is CardsDeleteCardEvent) {
      yield* _deleteCard(event);
    } else if (event is CardsDeleteCardFromEditSetEvent) {
      yield* _cardsDeleteCardFromEditSet(event);
    }
  }

  Future<List<Flashcard>> getCards() async {
    final request = GetCardsRequest(setGuid: this.setGuid);
    final proxy = ProxyFactory.instance.setProxy;
    print(this.setGuid);

    return await proxy.getCards(request);
  }

  Stream<CardsState> _initialize(CardsInitEvent event) async* {
      yield CardsInitialState(flashcards: await getCards());
  }

  Stream<CardsState> _flashError(CardsState errorState, CardsState afterErrorState) async* {
    yield errorState;
    yield afterErrorState;
  }

  Stream<CardsState> _saveSet(CardsSaveSetEvent event) async* {
    final savedState = state;
    yield CardsLoadingState();

    try {
      final request = UpdateSetRequest(guid: event.setGuid, name: event.updatedName);
      final proxy = ProxyFactory.instance.setProxy;
      await proxy.updateSet(request);
      yield CardsDoneLoadingState();
      yield CardsInitialState(flashcards: await getCards());
    } catch(e) {
      print('Unknown exception caught in CardsBloc._saveSet() $e');
      yield* _flashError(CardsErrorState("Could not save set"), savedState);
    }
  }

  Stream<CardsState> _goToMoveCard(CardsEvent event) async* {
    final savedState = state;
    yield CardsLoadingState();

    try {
      final authUser = await _auth.currentUser;
      final request = GetSetsRequest(userGuid: authUser.uid);
      final proxy = ProxyFactory.instance.userProxy;
      List<FlashcardSet> userSets = await proxy.getSets(request);
      yield CardsDoneLoadingState();
      yield CardsMovingCardState(setInfo: userSets);
    } catch(e) {
      print('Unknown exception caught in CardsBloc._goToMoveCard() $e');
      yield* _flashError(CardsErrorState("Could not go to move card view"), savedState);
    }
  }

  Stream<CardsState> _cancelMoveCard(CardsEvent event) async* {
    final savedState = state;
    yield CardsLoadingState();

    try {
      yield CardsDoneLoadingState();
      yield CardsCancelledMoveCardState();
    } catch(e) {
      print('Unknown exception caught in CardsBloc._cancelMoveCard() $e');
      yield* _flashError(CardsErrorState("Could not cancel move card"), savedState);
    }
  }

  Stream<CardsState> _moveCardToSet(CardsMoveCardToSetEvent event) async* {
    final savedState = state;
    yield CardsLoadingState();

    try {
      final request = UpdateFlashcardRequest(cardId: event.cardGuid, setId: event.setId);
      final proxy = ProxyFactory.instance.cardProxy;
      await proxy.updateCard(request);
      yield CardsDoneLoadingState();
      yield CardsCardMovedState();
    } catch(e) {
      print('Unknown exception caught in CardsBloc._moveCardToSet() $e');
      yield* _flashError(CardsErrorState("Could not move card to set"), savedState);
    }
  }

  Stream<CardsState> _editSet(CardsEditSetEvent event) async* {
    final savedState = state;
    yield CardsLoadingState();

    try {
      List<Flashcard> flashCards = await getCards();
      yield CardsDoneLoadingState();
      yield CardsEditingSetState(cards: flashCards);
    } catch(e) {
      print('Unknown exception caught in CardsBloc._editSet() $e');
      yield* _flashError(CardsErrorState("Could not edit set"), savedState);
    }
  }

  Stream<CardsState> _editCard(CardsEditCardEvent event) async* {
    final savedState = state;
    yield CardsLoadingState();
    try {
      yield CardsDoneLoadingState();
      yield CardsEditingCardState(card: event.card);
    } catch(e) {
      print('Unknown exception caught in CardsBloc._editCard() $e');
      yield* _flashError(CardsErrorState("Could not edit card"), savedState);
    }
  }

  Stream<CardsState> _saveCard(CardsSaveCardEvent event) async* {
    final savedState = state;
    yield CardsLoadingState();

    try {
      final request = UpdateFlashcardRequest(question: event.question, answer: event.answer, cardId: event.guid);
      final proxy = ProxyFactory.instance.cardProxy;
      await proxy.updateCard(request);
      yield CardsDoneLoadingState();
      yield CardsInitialState(flashcards: await getCards());
    } catch(e) {
      print('Unknown exception caught in CardsBloc._saveCard() $e');
      yield* _flashError(CardsErrorState("Could not save card"), savedState);
    }
  }

  Stream<CardsState> _goToAddCard(CardsEvent event) async* {
    final savedState = state;
    yield CardsLoadingState();

    try {
      yield CardsDoneLoadingState();
      yield CardsAddingCardState();
    } catch(e) {
      print('Unknown exception caught in CardsBloc._addCard() $e');
      yield* _flashError(CardsErrorState("Could not go to add card view"), savedState);
    }
  }

  Stream<CardsState> _cancelAddCard(CardsEvent event) async* {
    final savedState = state;
    yield CardsLoadingState();

    try {
      yield CardsDoneLoadingState();
      yield CardsInitialState(flashcards: await getCards());
    } catch(e) {
      print('Unknown exception caught in CardsBloc._cancelAddCard() $e'); 
      yield* _flashError(CardsErrorState("Could not cancel add card"), savedState);
    }
  }

  Stream<CardsState> _saveAddCard(CardsSaveAddCardEvent event) async* {
    final savedState = state;
    yield CardsLoadingState();

    // TODO: save card to DB


    try {
      yield CardsDoneLoadingState();
      yield CardsInitialState(flashcards: await getCards());
    } catch(e) {
      print('Unknown exception caught in CardsBloc._cancelAddCard() $e');
      yield* _flashError(CardsErrorState("Could not save add card"), savedState);
    }
  }

  Stream<CardsState> _deleteCard(CardsDeleteCardEvent event) async* {
    final savedState = state;
    yield CardsLoadingState();

    try {
      final request = UpdateFlashcardRequest(cardId: event.card.id, deleted: true);
      final proxy = ProxyFactory.instance.cardProxy;
      await proxy.updateCard(request);
      yield CardsDoneLoadingState();
      yield CardsInitialState(flashcards: await getCards());
    } catch(e) {
      print('Unknown exception caught in CardsBloc._deleteCard() $e');
      yield* _flashError(CardsErrorState("Could not delete card"), savedState);
    }
  }

  Stream<CardsState> _cardsDeleteCardFromEditSet(CardsEvent event) async* {
    final savedState = state;
    yield CardsLoadingState();

    try {
      yield CardsDoneLoadingState();
      yield CardsEditingSetState(cards: await getCards()); // What should I yield so view doesnt change?
    } catch(e) {
      print('Unknown exception caught in CardsBloc._deleteCard() $e');
      yield* _flashError(CardsErrorState("Could not delete card"), savedState);
    }
  }

  Stream<CardsState> _deleteSet(CardsDeleteSetEvent event) async* {
    final savedState = state;
    print("delete set");
    yield CardsLoadingState();

    try {
      final request = UpdateSetRequest(guid: this.setGuid, deleted: true);
      final proxy = ProxyFactory.instance.setProxy;
      await proxy.updateSet(request);
      print("delete set");
      yield CardsDoneLoadingState();
      yield CardsDeletedState();
    } catch(e) {
      print('Unknown exception caught in CardsBloc._deleteSet() $e');
      yield* _flashError(CardsErrorState("Could not delete set"), savedState);
    }
  }
}
