import 'dart:async';

import 'package:restudy/auth/auth.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restudy/model/flash_card_set.dart';
import 'package:restudy/proxy/factory.dart';
import 'package:restudy/model/create_set_request.dart';
import 'package:restudy/model/get_sets_request.dart';

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
      yield* _createSet(event);
    }
  }

  Stream<SetsState> _initialize(SetsInitEvent event) async* {
    final authUser = await _auth.currentUser;

    // get sets
    final proxy = ProxyFactory.instance.userProxy;
    final request = GetSetsRequest(userGuid: authUser.uid);
    List<FlashcardSet> flashcards = await proxy.getSets(request);
    print("In init sets");
    yield SetsInitialState(flashcards);
  }

  Stream<SetsState> _createSet(SaveSetEvent event) async* {
    print("In save set:" + event.setTitle);
    // save set into database
    final proxy = ProxyFactory.instance.setProxy;
    final request =
        CreateSetRequest(creatorGuid: event.creatorId, name: event.setTitle);
    FlashcardSet flashcardSet = await proxy.createSet(request);
    final authUser = await _auth.currentUser;

    // get sets
    final userProxy = ProxyFactory.instance.userProxy;
    final getSetsRequest = GetSetsRequest(userGuid: authUser.uid);
    List<FlashcardSet> flashcards = await userProxy.getSets(getSetsRequest);
    print("In init sets");
    yield SetsInitialState(flashcards);
  }

  Stream<SetsState> _addSet(AddSetEvent event) async* {
    print("In add set");
    yield AddSetState();
  }
}
