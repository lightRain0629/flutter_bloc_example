part of 'future_bloc.dart';

abstract class FutureEvent extends Equatable {
  const FutureEvent();

  @override
  List<Object> get props => [];
}

class FutureAddEvent extends FutureEvent{}
