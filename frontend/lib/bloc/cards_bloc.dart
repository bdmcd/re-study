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
    } if (event is CardsEditEvent) {
      yield* _edit(event);
    } else if (event is CardsSaveEvent) {
      yield* _saveSet(event);
    } else if (event is CardsAddCardEvent){
      // yield* _signInWithGoogle(event);
    } else if (event is CardsStudyEvent) {
      // yield* _signOut(event);
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

  Stream<CardsState> _edit(CardsEvent event) async* {
    final savedState = state;
    yield CardsLoadingState();

    try {
      yield CardsEditingState();
    } catch(e) {
      print('Unknown exception caught in CardsBloc._edit() $e');
      yield* _flashError(CardsErrorState("Could not edit set"), savedState);
    }
  }
}
