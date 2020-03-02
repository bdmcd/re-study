import 'dart:async';

import 'package:restudy/auth/auth.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sets_event.dart';
part 'sets_state.dart';

class SetsBloc extends Bloc<SetsEvent, SetsState> {
  static SetsBloc of(BuildContext context) =>
      BlocProvider.of<SetsBloc>(context);

  Authenticater _auth = AuthFactory.instance.authenticater;

  SetsBloc() {
    init();
  }

  Future<void> init() async {
    this.add(SetsInitEvent());
  }

  @override
  SetsState get initialState => SetsLoadingState();

  @override
  Stream<SetsState> mapEventToState(
    SetsEvent event,
  ) async* {
    if (event is SetsInitEvent) {
      yield* _initialize(event);
    }
    if (event is AddSetEvent) {
      yield* _addSet(event);
    }
    if (event is SaveSetEvent) {
      yield* _saveSet(event);
    }
  }

  Stream<SetsState> _initialize(SetsInitEvent event) async* {
    final authUser = await _auth.currentUser;
    print("In init sets");
    yield SetsInitialState();
  }

  Stream<SetsState> _saveSet(SaveSetEvent event) async* {
    print("In save set:" + event.setTitle);
    // save set into database
    yield SetsInitialState();
  }

  Stream<SetsState> _addSet(AddSetEvent event) async* {
    print("In add set");
    yield AddSetState();
  }
}
