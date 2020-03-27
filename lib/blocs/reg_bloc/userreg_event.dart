part of 'userreg_bloc.dart';

abstract class UserregEvent extends Equatable {
  const UserregEvent();
}

class SignUpButtonPressed extends UserregEvent {
  String email, password;
  SignUpButtonPressed({this.email, this.password});
  @override
  List<Object> get props => throw UnimplementedError();
}
