import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

part 'poistion_event.dart';
part 'poistion_state.dart';

class PoistionBloc extends Bloc<PoistionEvent, PoistionState> {
  PoistionBloc() : super(PoistionInitialState()) {
    on<FecthPosition>((event, emit) async {
      emit(PoistionLoadingState());
      try {
        Position position = await _determinePosition();

        emit(PoistionSuccesState(position: position));
      } catch (e) {
        emit(PoistionErrorState(errorMessage: e.toString()));
      }
    });
  }
  Future<Position> _determinePosition() async {
    LocationPermission permission;

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      throw Exception(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }
}
