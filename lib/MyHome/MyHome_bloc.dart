import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:crypto_currency/MyHome/index.dart';

class MyHomeBloc extends Bloc<MyHomeEvent, MyHomeState> {
  static final MyHomeBloc _myHomeBlocSingleton = new MyHomeBloc._internal();
  factory MyHomeBloc() {
    return _myHomeBlocSingleton;
  }
  MyHomeBloc._internal();
  
  MyHomeState get initialState => new UnMyHomeState();

  @override
  Stream<MyHomeState> mapEventToState(
    MyHomeEvent event,
  ) async* {
    try {
      yield await event.applyAsync(currentState: currentState, bloc: this);
    } catch (_, stackTrace) {
      print('$_ $stackTrace');
      yield currentState;
    }
  }
}
