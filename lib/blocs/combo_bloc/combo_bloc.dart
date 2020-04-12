import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'combo_event.dart';
part 'combo_state.dart';

class ComboBloc extends Bloc<ComboEvent, ComboState> {
  @override
  ComboState get initialState => ComboInitial();

  @override
  Stream<ComboState> mapEventToState(
    ComboEvent event,
  ) async* {
    if (event is FavoriteEvent) {
      yield FavoriteState(index: event.index);
    } else if (event is SelectContriesEvent) {
      yield SelectContriesState(index: event.index);
    } else if(event is GotoDetailPageEvent){
      yield GotoDetailPageState(index: event.index);
    }
    yield ComboInitial();
  }
}
