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
            new IconButton(
              icon: Icon(
                Icons.search,
                size: 30.0,
              ),
              onPressed: _pushSaved,
            ),
            new SizedBox(
              width: 5.0,
            ),
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
  List data;

  @override
  void initState() {
    super.initState();
    this.getJsonData();
  }

  Future<String> getJsonData() async {
    http.Response response = await http
        .get(Uri.encodeFull(_apiUrl), headers: {"Accept": "applicaiton/json"});
    print(response.body);

    // rebuilding UI widget
    setState(() {
      var _convertDataToJson = jsonDecode(response.body);
      data = _convertDataToJson;
    });

    return "Success";
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: getJsonData,
          child: SafeArea(
        child: new Container(
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
                              child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: new ExpansionTile(
                              leading: new CircleAvatar(
                                backgroundColor: Colors.indigoAccent,
                                child: new Text(
                                  data[index]['name'][0],
                                  style: new TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                foregroundColor: Colors.white,
                              ),
                              title: new Text(data[index]['name']),
                              trailing: new Text(
                                "\$ " + data[index]['price_usd'],
                                style: new TextStyle(fontWeight: FontWeight.bold),
                              ),
                              children: <Widget>[
                                new ListTileTheme(
                                  style: ListTileStyle.list,
                                  selectedColor: Colors.yellow,
                                  child: new Column(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 12.0),
                                        child: new Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            new Text(
                                              'Rank: ' + data[index]['rank'],
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17),
                                            ),
                                            SizedBox(height: 11.0),
                                            new Text(
                                              'Symbol: ' + data[index]['symbol'],
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17),
                                            ),
                                            SizedBox(height: 11.0),
                                            new Text(
                                              'Price btc: ' +
                                                  data[index]['price_btc'],
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17),
                                            ),
                                            SizedBox(height: 11.0),
                                            new Text(
                                              'Price btc: ' +
                                                  data[index]['price_btc'],
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17),
                                            ),
                                            SizedBox(height: 11.0),
                                            new Text(
                                              'total_supply: ' +
                                                  data[index]['total_supply'],
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17),
                                            ),
                                            SizedBox(height: 11.0),
                                            new Text(
                                              'percent_change_24h: ' +
                                                  data[index]
                                                      ['percent_change_24h'],
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17),
                                            ),
                                            SizedBox(height: 11.0),
                                            new Text(
                                              'last_updated: ' +
                                                  data[index]['last_updated'],
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ))
                        ],
                      ),
                    ),
              )),
        ),
      ),
    );
  }
}

class AnswerWidget extends StatefulWidget {
  final List data;
  final int index;
  final String m;

  AnswerWidget({this.data, this.index, this.m});

  _AnswerWidgetState createState() => _AnswerWidgetState();
}

class _AnswerWidgetState extends State<AnswerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: new ListTile(
            title: new Text(
      widget.data[widget.index][widget.m],
    )));
  }
}
