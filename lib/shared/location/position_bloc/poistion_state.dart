part of 'poistion_bloc.dart';

sealed class PoistionState extends Equatable {
  const PoistionState();

  @override
  List<Object> get props => [];
}

final class PoistionInitialState extends PoistionState {}

final class PoistionLoadingState extends PoistionState {}

final class PoistionSuccesState extends PoistionState {
  final Position position;

  const PoistionSuccesState({required this.position});
  @override
  List<Object> get props => [position];
}

final class PoistionErrorState extends PoistionState {
  final String errorMessage;

  const PoistionErrorState({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
