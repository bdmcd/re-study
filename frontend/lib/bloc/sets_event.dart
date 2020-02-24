part of 'sets_bloc.dart';

// import 'package:flutter/cupertino.dart';

abstract class SetsEvent extends Equatable {
  const SetsEvent();
}

class SetsInitEvent extends SetsEvent {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class AddSetEvent extends SetsEvent {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class SaveSetEvent extends SetsEvent {
  final String setTitle;

  SaveSetEvent({
    @required this.setTitle,
  });

  @override
  // TODO: implement props
  List<Object> get props => [setTitle];
}