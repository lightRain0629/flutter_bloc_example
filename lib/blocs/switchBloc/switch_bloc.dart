import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'switch_event.dart';
part 'switch_state.dart';

class SwitchBloc extends Bloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(SwitchInitial(switchVal: false)) {
    on<SwitchOnEvent>((event, emit) {
      emit(SwitchState(switchVal: true));
    });
    on<SwitchOffEvent>((event, emit) {
      emit(SwitchState(switchVal: false));
    });
  }
}
