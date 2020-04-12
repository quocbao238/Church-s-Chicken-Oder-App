part of 'combo_bloc.dart';

abstract class ComboState extends Equatable {
  const ComboState();
}

class ComboInitial extends ComboState {
  @override
  List<Object> get props => [];
}

class SelectContriesState extends ComboState {
  final int index;
  SelectContriesState({this.index});
  @override
  List<Object> get props => [];
}

class FavoriteState extends ComboState {
  final int index;
  FavoriteState({this.index});
  @override
  List<Object> get props => [];
}

class GotoDetailPageState extends ComboState {
  final int index;
  GotoDetailPageState({this.index});
  @override
  List<Object> get props => [];
}
