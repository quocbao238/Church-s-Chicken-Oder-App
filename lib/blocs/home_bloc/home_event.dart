part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class LogOutEvent extends HomeEvent {
  @override
  List<Object> get props => null;
}

class ChangePageEvent extends HomeEvent {
  final int index;
   ChangePageEvent({this.index});
  @override
  List<Object> get props => null;
}
