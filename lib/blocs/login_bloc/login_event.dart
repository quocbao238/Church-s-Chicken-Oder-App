part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginButtonPressedEvent extends LoginEvent {
  final String email;
  final String password;
  LoginButtonPressedEvent({this.email, this.password});
  @override
  List<Object> get props => null;
  
}