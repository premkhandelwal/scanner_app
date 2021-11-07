import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'abc_event.dart';
part 'abc_state.dart';

class AbcBloc extends Bloc<AbcEvent, AbcState> {
  AbcBloc() : super(AbcInitial()) {
    on<AbcEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
