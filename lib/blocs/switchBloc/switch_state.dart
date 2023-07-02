part of 'switch_bloc.dart';

class SwitchState extends Equatable {
  final bool switchVal;
  const SwitchState({ required this.switchVal});
  
  @override
  List<Object> get props => [switchVal];
}

class SwitchInitial extends SwitchState {
  SwitchInitial({required super.switchVal});
}
