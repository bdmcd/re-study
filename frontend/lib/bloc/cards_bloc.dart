import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restudy/proxy/mock_impl/mock_set_proxy.dart';

part 'cards_event.dart';
part 'cards_state.dart';

class CardsBloc extends Bloc<CardsEvent, CardsState> {
  static CardsBloc of(BuildContext context) => BlocProvider.of<CardsBloc>(context);
  
  MockSetProxy _set = MockSetProxy();

  CardsBloc() {
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
      // yield* _initialize(event);
    } if (event is CardsEditSetEvent) {
      yield* _editSet(event);
      // add cardsSavedSetEvent && cardsSavedSetEvent
    } else if (event is CardsSaveEvent) {
      yield* _saveSet(event);
    } else if (event is CardsAddCardEvent){
      yield* _addCard(event);
    } else if (event is CardsStudyEvent) {
      // yield* _signOut(event);
    } else if (event is CardsEditCardEvent) {
      yield* _editCard(event);
    }
  }

  Stream<CardsState> _flashError(CardsState errorState, CardsState afterErrorState) async* {
    yield errorState;
    yield afterErrorState;
  }

  Stream<CardsState> _saveSet(CardsEvent event) async* {
    final savedState = state;
    yield CardsLoadingState();

    try {
      yield CardsSavedState();
    } catch(e) {
      print('Unknown exception caught in CardsBloc._initialize() $e');
      yield* _flashError(CardsErrorState("Could not load cards from set"), savedState);
    }
  }

  Stream<CardsState> _editSet(CardsEvent event) async* {
    final savedState = state;
    yield CardsLoadingState();

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

    try {
      yield CardsEditingCardState();
    } catch(e) {
      print('Unknown exception caught in CardsBloc._editCard() $e');
      yield* _flashError(CardsErrorState("Could not edit card"), savedState);
    }
  }

  Stream<CardsState> _addCard(CardsEvent event) async* {
    final savedState = state;
    yield CardsLoadingState();

    try {
      yield CardsAddingCardState();
    } catch(e) {
      print('Unknown exception caught in CardsBloc._edit() $e');
      yield* _flashError(CardsErrorState("Could not edit set"), savedState);
    }
  }
}
