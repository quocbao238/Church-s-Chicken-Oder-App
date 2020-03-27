part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}

class LogOutSuccessState extends HomeState {
  @override
  // TODO: implement props
  List<Object> get props => null;
}