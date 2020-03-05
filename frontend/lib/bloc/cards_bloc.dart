import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restudy/model/flash_card_set.dart';
import 'package:restudy/proxy/mock_impl/mock_set_proxy.dart';

part 'cards_event.dart';
part 'cards_state.dart';

class CardsBloc extends Bloc<CardsEvent, CardsState> {
  static CardsBloc of(BuildContext context) => BlocProvider.of<CardsBloc>(context);
  
  MockSetProxy _set = MockSetProxy();

  CardsBloc(setGuid) {
    init();
  }
  
  Future<void> init() async {
    this.add(CardsInitEvent());
  }

  @override
  CardsState get initialState => CardsInitialState();

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
    }
  }

  Stream<CardsState> _initialize(CardsEvent event) async* {
      final _set = FlashcardSet();
      // TODO: get set from proxy
      yield CardsInitialState();
  }

  Stream<CardsState> _flashError(CardsState errorState, CardsState afterErrorState) async* {
    yield errorState;
    yield afterErrorState;
  }

  Stream<CardsState> _saveSet(CardsEvent event) async* {
    final savedState = state;
    yield CardsLoadingState();

    await Future.delayed(Duration(milliseconds: 1000));

    // TODO: Save the set here

    try {
      yield CardsInitialState();
    } catch(e) {
      print('Unknown exception caught in CardsBloc._saveSet() $e');
      yield* _flashError(CardsErrorState("Could not save set"), savedState);
    }
  }

  Stream<CardsState> _goToMoveCard(CardsEvent event) async* {
    final savedState = state;
    yield CardsLoadingState();

    await Future.delayed(Duration(milliseconds: 1000));

    try {
      yield CardsMovingCardState();
    } catch(e) {
      print('Unknown exception caught in CardsBloc._goToMoveCard() $e');
      yield* _flashError(CardsErrorState("Could not go to move card view"), savedState);
    }
  }

  Stream<CardsState> _cancelMoveCard(CardsEvent event) async* {
    final savedState = state;
    yield CardsLoadingState();

    await Future.delayed(Duration(milliseconds: 1000));

    try {
      yield CardsCancelledMoveCardState();
    } catch(e) {
      print('Unknown exception caught in CardsBloc._cancelMoveCard() $e');
      yield* _flashError(CardsErrorState("Could not cancel move card"), savedState);
    }
  }

  Stream<CardsState> _moveCardToSet(CardsEvent event) async* {
    final savedState = state;
    yield CardsLoadingState();

    await Future.delayed(Duration(milliseconds: 1000));

    // add moving to set

    try {
      yield CardsInitialState();
    } catch(e) {
      print('Unknown exception caught in CardsBloc._moveCardToSet() $e');
      yield* _flashError(CardsErrorState("Could not move card to set"), savedState);
    }
  }

  Stream<CardsState> _editSet(CardsEvent event) async* {
    final savedState = state;
    yield CardsLoadingState();

    await Future.delayed(Duration(milliseconds: 1000));

    try {
      yield CardsEditingSetState();
    } catch(e) {
      print('Unknown exception caught in CardsBloc._editSet() $e');
      yield* _flashError(CardsErrorState("Could not edit set"), savedState);
    }
  }

  Stream<CardsState> _editCard(CardsEvent event) async* {
    final savedState = state;
    yield CardsLoadingState();

    await Future.delayed(Duration(milliseconds: 1000));

    try {
      yield CardsEditingCardState();
    } catch(e) {
      print('Unknown exception caught in CardsBloc._editCard() $e');
      yield* _flashError(CardsErrorState("Could not edit card"), savedState);
    }
  }

  Stream<CardsState> _saveCard(CardsEvent event) async* {
    final savedState = state;
    yield CardsLoadingState();

    await Future.delayed(Duration(milliseconds: 1000));

    try {
      yield CardsInitialState();
    } catch(e) {
      print('Unknown exception caught in CardsBloc._saveCard() $e');
      yield* _flashError(CardsErrorState("Could not save card"), savedState);
    }
  }

  Stream<CardsState> _goToAddCard(CardsEvent event) async* {
    final savedState = state;
    yield CardsLoadingState();

    await Future.delayed(Duration(milliseconds: 1000));

    try {
      yield CardsAddingCardState();
    } catch(e) {
      print('Unknown exception caught in CardsBloc._addCard() $e');
      yield* _flashError(CardsErrorState("Could not go to add card view"), savedState);
    }
  }

  Stream<CardsState> _cancelAddCard(CardsEvent event) async* {
    final savedState = state;
    yield CardsLoadingState();

    await Future.delayed(Duration(milliseconds: 1000));

    try {
      yield CardsInitialState();
    } catch(e) {
      print('Unknown exception caught in CardsBloc._cancelAddCard() $e'); 
      yield* _flashError(CardsErrorState("Could not cancel add card"), savedState);
    }
  }

  Stream<CardsState> _saveAddCard(CardsEvent event) async* {
    final savedState = state;
    yield CardsLoadingState();

    await Future.delayed(Duration(milliseconds: 1000));

    // TODO: save card to DB

    try {
      yield CardsInitialState();
    } catch(e) {
      print('Unknown exception caught in CardsBloc._cancelAddCard() $e');
      yield* _flashError(CardsErrorState("Could not save add card"), savedState);
    }
  }

  Stream<CardsState> _deleteCard(CardsEvent event) async* {
    final savedState = state;
    yield CardsLoadingState();

    await Future.delayed(Duration(milliseconds: 1000));

    try {
      // TODO: Add delete cards logic
      yield CardsInitialState();
    } catch(e) {
      print('Unknown exception caught in CardsBloc._deleteCard() $e');
      yield* _flashError(CardsErrorState("Could not delete card"), savedState);
    }
  }

  Stream<CardsState> _deleteSet(CardsEvent event) async* {
    final savedState = state;
    print("delete set");
    yield CardsLoadingState();

    await Future.delayed(Duration(milliseconds: 1000));

    try {
      // TODO: Add delete cards logic
      print("delete set");
      yield CardsDeletedState();
    } catch(e) {
      print('Unknown exception caught in CardsBloc._deleteSet() $e');
      yield* _flashError(CardsErrorState("Could not delete set"), savedState);
    }
  }
}