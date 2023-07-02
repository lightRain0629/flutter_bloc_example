part of 'navigation_bloc.dart';

abstract class NavigationEvent extends Equatable {
  const NavigationEvent();

  @override
  List<Object> get props => [];
}

class OnTapEvent extends NavigationEvent{
  final int index;

  OnTapEvent( {required this.index});

}
