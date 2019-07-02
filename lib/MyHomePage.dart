import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("CryptoList"),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 3.0,
          actions: <Widget>[
            new Icon(Icons.line_style)
          ],
      ),
    );
  }
}