part of 'abc_bloc.dart';

abstract class AbcState extends Equatable {
  const AbcState();
  
  @override
  List<Object> get props => [];
}

class AbcInitial extends AbcState {}
