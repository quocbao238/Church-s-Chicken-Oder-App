import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_blocs/repository/user_repository.dart';

part 'userreg_event.dart';
part 'userreg_state.dart';

class UserregBloc extends Bloc<UserregEvent, UserregState> {
  UserRepository userRepository;
  UserregBloc({this.userRepository});
  
  @override
  UserregState get initialState => UserregInitial();

  @override
  Stream<UserregState> mapEventToState(
    UserregEvent event,
  ) async* {
    if (event is SignUpButtonPressed) {
      yield UserRegLoading();
      try {
        if (event.email.contains("@") &&
            event.email.contains(".") &&
            event.email != null) {
          if (event.password != null && event.password.length > 5) {
            var user = await userRepository.signUpUserWithEmailPass(
                event.email, event.password);
            print("BLoC : ${user.email}");
            yield UserRegSuccessful(user);
          }
        }
      } catch (e) {
        yield UserRegFailure(e.toString());
      }
    }
    yield UserregInitial();
  }
}
