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
  var _apiUrl = "https://api.coinmarketcap.com/v1/ticker/";
  List data ;

  @override
  void initState() { 
    super.initState();
    this.getJsonData();
  }  

  Future<String> getJsonData() async {
    http.Response response = await http.get(
      Uri.encodeFull(_apiUrl),
      headers: {"Accept": "applicaiton/json"}
    );
    print(response.body);

  // rebuilding UI widget
  setState(() {
   var _convertDataToJson = jsonDecode(response.body) ;
   data = _convertDataToJson;
  });

  return "Success" ;

  }


  @override
  Widget build(BuildContext context) {
    return new Container(
      child: Card(
        elevation: 3.0,
        child: new ListView.builder(
          itemCount: data == null ? 0 : data.length,
          itemBuilder: (BuildContext context, int index) => new Container(
            //padding: const EdgeInsets.all(12.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                new Card(
                  child:  new ExpansionTile(
                    //leading: data[index]['name'],
                    title: new Text(data[index]['name']),
                                      )
                )
              ],
            ),
          ) ,
        )
      ),
    );
  }
}
