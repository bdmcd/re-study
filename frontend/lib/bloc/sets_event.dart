part of 'sets_bloc.dart';

// import 'package:flutter/cupertino.dart';

abstract class SetsEvent extends Equatable {
  const SetsEvent();
}

class SetsInitEvent extends SetsEvent {
  @override
  List<Object> get props => [];
}

class AddSetEvent extends SetsEvent {
  @override
  List<Object> get props => [];
}

class SaveSetEvent extends SetsEvent {
  final String setTitle;
  final String creatorId;

  SaveSetEvent({
    @required this.setTitle,
    @required this.creatorId,
  });

  @override
  List<Object> get props => [setTitle];
}
