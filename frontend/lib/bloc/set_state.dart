part of 'set_bloc.dart';

abstract class SetState extends Equatable {
  const SetState();
}

class SetInitialState extends SetState {
  @override
  List<Object> get props => [];
}

class SetEditingState extends SetState {
  @override
  List<Object> get props => [];
}

class SetSavedState extends SetState {
  @override
  List<Object> get props => [];
}

class SetAddCardState extends SetState {
  @override
  List<Object> get props => [];
}