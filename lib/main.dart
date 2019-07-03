import 'package:crypto_currency/_MyHomePage.dart';
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
        accentColor: Colors.blue,
        primaryColor: Colors.white,
        fontFamily: "Product",
        primaryIconTheme: IconThemeData(color: Colors.black)
        //fontFamily: 
      ),
      home: MyHomePage(),
    );
  }
}