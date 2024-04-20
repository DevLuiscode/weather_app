part of 'poistion_bloc.dart';

sealed class PoistionEvent extends Equatable {
  const PoistionEvent();

  @override
  List<Object> get props => [];
}

class FecthPosition extends PoistionEvent {}
