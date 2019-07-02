import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as  http;

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

void _pushSaved() {}

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
      title: new Text("CryptoList"),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 3.0,
      actions: <Widget>[
        new IconButton(
          icon: Icon(
            Icons.list,
            size: 30.0,
          ),
          onPressed: _pushSaved,
        ),
        new SizedBox(
          width: 16.0,
        )
      ]),
      body: AppBody(),
    );
  }
}


class AppBody extends StatefulWidget {
  AppBody({Key key}) : super(key: key);

  _AppBodyState createState() => _AppBodyState();
}

class _AppBodyState extends State<AppBody> {
List _cryptoList ;

Future<void> getCryptoPrices() async {
  print("getting: crypto prices") ;
  String _apiUrl = "https://api.coinmarketcap.com/v1/ticker/";
  http.Response response = await http.get(_apiUrl);

  if(response.statusCode == 200) {
    jsonDecode(response.body);
  } else {
    throw("Error Unexpectedly Occurs...");
  }

  setState(() {
      this._cryptoList =
          jsonDecode(response.body); //sets the state of our widget
      print(_cryptoList); //prints the list
    });
    return ;
}

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10.0),
        child: Expanded(

        )
    );
  }
}
