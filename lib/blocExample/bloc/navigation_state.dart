part of 'navigation_bloc.dart';

// abstract class NavigationState extends Equatable {
//     final int count;

//   NavigationState({required this.count});
  
//   @override
//   List<Object> get props => [];
// }

// class NavigationInitial extends NavigationState {
//   final int count;
//   NavigationInitial(this.count) : super(count: count);
// }

 class NavigationState extends Equatable{
  final int count;

  NavigationState(this.count);

  @override
  // TODO: implement props
  List<Object?> get props => [count];

}


