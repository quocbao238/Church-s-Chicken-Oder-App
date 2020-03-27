import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_blocs/config/configapp.dart';
import 'package:flutter_blocs/repository/user_repository.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  // UserRepository userRepository;
  // HomeBloc({@required UserRepository userRepository}) {
  //   this.userRepository = userRepository;

  @override
  HomeState get initialState => HomeInitial();

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is LogOutEvent) {
      print("LOG out Bloc");
      userRepository.signOut();
      yield LogOutSuccessState();
    }
  }
}
