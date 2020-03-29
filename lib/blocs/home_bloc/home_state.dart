part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}

class LogOutSuccessState extends HomeState {
  final UserRepository userRepository;

  LogOutSuccessState(this.userRepository);

  @override
  // TODO: implement props
  List<Object> get props => null;
}
