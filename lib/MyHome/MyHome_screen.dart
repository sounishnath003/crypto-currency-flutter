import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crypto_currency/MyHome/index.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({
    Key key,
    @required MyHomeBloc myHomeBloc,
  })  : _myHomeBloc = myHomeBloc,
        super(key: key);

  final MyHomeBloc _myHomeBloc;

  @override
  MyHomeScreenState createState() {
    return new MyHomeScreenState(_myHomeBloc);
  }
}

class MyHomeScreenState extends State<MyHomeScreen> {
  final MyHomeBloc _myHomeBloc;
  MyHomeScreenState(this._myHomeBloc);

  @override
  void initState() {
    super.initState();
    this._myHomeBloc.dispatch(LoadMyHomeEvent());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyHomeEvent, MyHomeState>(
        bloc: widget._myHomeBloc,
        builder: (
          BuildContext context,
          MyHomeState currentState,
        ) {
          if (currentState is UnMyHomeState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (currentState is ErrorMyHomeState) {
            return new Container(
              child: new Center(
              child: new Text(currentState.errorMessage ?? 'Error' ),
            ));
          }
          return new Container(
              child: new Center(
            child: new Text("В разработке"),
          ));
        });
  }
}
