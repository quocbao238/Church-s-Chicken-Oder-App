part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginButtonPressed extends LoginEvent {
  String email, password;
  LoginButtonPressed({this.email, this.password});
  @override
  List<Object> get props => throw UnimplementedError();
}