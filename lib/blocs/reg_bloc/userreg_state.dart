part of 'userreg_bloc.dart';

abstract class UserregState extends Equatable {
  const UserregState();
}

class UserregInitial extends UserregState {
  @override
  List<Object> get props => [];
}

class UserRegLoading extends UserregState {
  @override
  List<Object> get props => throw UnimplementedError();
}

class UserRegSuccessful extends UserregState {

  FirebaseUser user;
  UserRegSuccessful(this.user);
  @override
  List<Object> get props => throw UnimplementedError();
}

class UserRegFailure extends UserregState {

  String message;
  UserRegFailure(this.message);
  @override
  List<Object> get props => throw UnimplementedError();
}