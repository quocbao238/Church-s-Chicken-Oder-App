part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class LoginInitial extends LoginState {
  @override
  List<Object> get props => [];
}


class LoginLoadingState extends LoginState {
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class LoginSuccessState extends LoginState {

  FirebaseUser user;
  LoginSuccessState({this.user});

  @override
  List<Object> get props => null;
}

class LoginFailState extends LoginState {

  String message;

  LoginFailState({this.message});
  @override
  List<Object> get props => null;
}