import 'package:crypto_currency/MyHomePage.dart';
import 'package:flutter/material.dart';

void main () => runApp(new MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Crypto Currency App',
      theme: new ThemeData(
        accentColor: Colors.tealAccent,
        primaryColor: Colors.white,
        primaryIconTheme: IconThemeData(color: Colors.black)
        //fontFamily: 
      ),
      home: MyHomePage(),
    );
  }
}