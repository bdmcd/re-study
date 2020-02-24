part of 'set_bloc.dart';

abstract class SetState extends Equatable {
  const SetState();
}

class SetInitial extends SetState {
  @override
  List<Object> get props => [];
}
