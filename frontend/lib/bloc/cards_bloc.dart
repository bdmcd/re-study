import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'cards_event.dart';
part 'cards_state.dart';

class CardsBloc extends Bloc<CardsEvent, CardsState> {
  @override
  CardsState get initialState => SetInitialState();

  @override
  Stream<CardsState> mapEventToState(
    CardsEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
