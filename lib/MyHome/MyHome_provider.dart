import 'dart:convert';

import 'package:crypto_currency/MyHome/MyHome_model.dart';
import 'package:crypto_currency/MyHome/index.dart';
import 'package:http/http.dart' as http ;

class MyHomeProvider {
  final MyHomeRepository _myHomeRepository = new MyHomeRepository();

  MyHomeProvider();

   Future<List<Map>> getData() async {
    http.Response response = await http.get("https://api.coinmarketcap.com/v1/ticker/");
    var crypoList = new Cryptos() as List ;
    if (response.statusCode == 200) {
      var decodedJson = jsonDecode(response.body);
      for (var json in decodedJson) {
        crypoList.add(Cryptos.fromJson(json)) ;
      }
    }
    return crypoList;
  }
  
}
