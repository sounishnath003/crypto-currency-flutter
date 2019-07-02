import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: _myAppBar()
    );
  }
}

AppBar _myAppBar() {
  return new AppBar(
     title: new Text("CryptoList"),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 3.0,
          actions: <Widget>[
            new Icon(Icons.list,
            size: 30.0,
            ),
            new SizedBox(width: 16.0,)
          ]
  );
}