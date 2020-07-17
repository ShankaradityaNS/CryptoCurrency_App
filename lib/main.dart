import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'home_page.dart';
import 'dart:convert' show json;

void main() async {
  final List currencies = await getCurrencies();
  print(currencies);
  runApp(MyApp(currencies));
}

class MyApp extends StatelessWidget {
  final List _currencies;
  MyApp(this._currencies);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: new HomePage(_currencies),
    );
  }
}

Future<List> getCurrencies() async {
  String cryptourl = "https://pro-api.coinmarketcap.com//latest/?limit=50";
  http.Response response = await http.get(cryptourl);
  return json.decode(response.body);
}
