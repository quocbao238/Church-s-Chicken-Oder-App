part of 'combo_bloc.dart';

abstract class ComboEvent extends Equatable {
  const ComboEvent();
}

class SelectContriesEvent extends ComboEvent {
  final int index;
  SelectContriesEvent({this.index});
  @override
  List<Object> get props => [];
}

class FavoriteEvent extends ComboEvent {
  final int index;
  FavoriteEvent({this.index});
  @override
  List<Object> get props => [];
}

class GotoDetailPageEvent extends ComboEvent {
  final int index;
  GotoDetailPageEvent({this.index});
  @override
  List<Object> get props => [];
}
