part of 'future_bloc.dart';

abstract class FutureState extends Equatable {

  final int san;
  
  const FutureState({ required this.san});
  
  
  @override
  List<Object> get props => [];
}

class FutureInitial extends FutureState {
  final int san;

  FutureInitial({required this.san}):super(san: san);
}
class FutureLoaded extends FutureState {
  final int san;

  FutureLoaded({required this.san}):super(san:san);
}



