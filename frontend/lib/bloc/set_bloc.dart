import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'set_event.dart';
part 'set_state.dart';

class SetBloc extends Bloc<SetEvent, SetState> {
  @override
  SetState get initialState => SetInitialState();

  @override
  Stream<SetState> mapEventToState(
    SetEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
