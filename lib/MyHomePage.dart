import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Cryptos.dart';
import 'package:http/http.dart' as http;

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
  Cryptos crypto;
  List crytoLists;

  Future<void> _getCryptos() async {
    const _apiUrl = "https://api.coinmarketcap.com/v1/ticker/";
    final url = await http.get(_apiUrl);
    if (url.statusCode == 200) {
      var decodeJson = jsonDecode(url.body);
      print(decodeJson);
      crypto = Cryptos.fromJson(decodeJson);
      crytoLists = crypto as List;
    } else {
      throw ("error happened...");
    }
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      child: new FutureBuilder(
        future: _getCryptos(),
        initialData: 56,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return new Text("Press Button to start");
              break;

            case ConnectionState.active:
              return new Text("In progess...");
              break;

            case ConnectionState.waiting:
              return new Center(child: new CircularProgressIndicator());
              break;

            case ConnectionState.done:
              if (snapshot.hasError) {
                return Container(
                    child: new Center(
                        child: new Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                      new Padding(
                        child: new Text("Error Happen : '${snapshot.error}'"),
                        padding: EdgeInsets.all(40.0),
                      )
                    ])));
              } else {
                return new SafeArea(
                  child: new ListView.builder(
                      itemCount: crytoLists.length,
                      itemBuilder: (BuildContext context, int index) =>
                          new ListTile(
                            leading: new Text(crytoLists[index].name),
                          )),
                );
              }
              break;
            default:
          }
        },
      ),
      onRefresh: _getCryptos,
    );
  }
}
