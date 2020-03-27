import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blocs/config/configapp.dart';
import 'package:flutter_blocs/repository/user_repository.dart';
import 'package:meta/meta.dart';

part 'auth_bloc_event.dart';
part 'auth_bloc_state.dart';

class AuthBloc extends Bloc<AuthBlocEvent, AuthBlocState> {
  UserRepository userRepository;

  AuthBloc({@required UserRepository userRepository}) {
    this.userRepository = userRepository;
  }

  @override
  AuthBlocState get initialState => AuthBlocInitial();

  @override
  Stream<AuthBlocState> mapEventToState(AuthBlocEvent event) async* {
    if (event is AppStartedEvent) {
      try {
        var isSignedIn = await userRepository.isSignedIn();
        if (isSignedIn) {
          firebaseUser = await userRepository.getCurrentUser();
          yield AuthenticatedState();
        } else {
          yield UnauthenticatedState();
        }
      } catch (e) {
        yield UnauthenticatedState();
      }
    }
  }
}
