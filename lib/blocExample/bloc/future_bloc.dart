import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'future_event.dart';
part 'future_state.dart';

class FutureBloc extends Bloc<FutureEvent, FutureState> {
  FutureBloc() : super(FutureInitial(san: 0)) {
    on<FutureAddEvent>((event, emit) {
      emit(FutureLoaded(san: state.san + 10));
      // TODO: implement event handler
    });
  }
}
