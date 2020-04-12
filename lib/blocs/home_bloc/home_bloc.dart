import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_blocs/repository/user_repository.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  UserRepository userRepository;
  HomeBloc({this.userRepository});

  @override
  HomeState get initialState => HomeInitial();

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is LogOutEvent) {
      userRepository.signOut();
      yield LogOutSuccessState(userRepository);
    } else if (event is ChangePageEvent) {
      yield ChangePageState(index: event.index);
    }
    yield HomeInitial();
  }
}
