import 'dart:async';
import 'package:crypto_currency/MyHome/index.dart';
import 'package:meta/meta.dart';

@immutable
abstract class MyHomeEvent {
  Future<MyHomeState> applyAsync(
      {MyHomeState currentState, MyHomeBloc bloc});
  final MyHomeProvider _myHomeProvider = new MyHomeProvider();
}

class LoadMyHomeEvent extends MyHomeEvent {
  @override
  String toString() => 'LoadMyHomeEvent';

  @override
  Future<MyHomeState> applyAsync(
      {MyHomeState currentState, MyHomeBloc bloc}) async {
    try {
      await Future.delayed(new Duration(seconds: 2));
      //this._myHomeProvider.test();
      List<Map> res = await _myHomeProvider.getData() ;
      return new InMyHomeState(res);
    } catch (_, stackTrace) {
      print('$_ $stackTrace');
      return new ErrorMyHomeState(_?.toString());
    }
  }
}
