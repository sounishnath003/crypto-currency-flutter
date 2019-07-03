import 'package:flutter/material.dart';
import 'package:crypto_currency/MyHome/index.dart';

class MyHomePage extends StatelessWidget {
  static const String routeName = "/myHome";

  @override
  Widget build(BuildContext context) {
    var _myHomeBloc = new MyHomeBloc();
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("MyHome"),
      ),
      body: new MyHomeScreen(myHomeBloc: _myHomeBloc),
    );
  }
}
