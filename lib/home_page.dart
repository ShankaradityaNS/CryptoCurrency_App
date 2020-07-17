import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  final List currencies;
  HomePage(this.currencies);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List currencies;
  final List<MaterialColor> _colors = [
    Colors.white,
    Colors.yellow,
    Colors.indigo
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "CryptoCurrency App",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
        ),
        elevation: 10.0,
      ),
      body: _cryptoWidget(),
    );
  }

  Widget _cryptoWidget() {
    return Container(
      child: Column(children: <Widget>[
        Flexible(
          child: ListView.builder(
            itemCount: widget.currencies.length,
            itemBuilder: (BuildContext context, int index) {
              final Map currency = widget.currencies[index];
              final MaterialColor color = _colors[index % _colors.length];
              return _getListItemUI(currency, color);
            },
          ),
        ),
      ]),
    );
  }

  ListTile _getListItemUI(Map currency, MaterialColor color) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: color,
        child: Text(currency['name'][0]),
      ),
      title: Text(
        currency['name'],
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: _getSubTitleText(
          currency['price_usd'], currency['percent_change_ih']),
      isThreeLine: true,
    );
  }

  Widget _getSubTitleText(String priceUSD, String percentageChange) {
    TextSpan priceTextEWidget = new TextSpan(
        text: "\$$priceUSD\n", style: TextStyle(fontWeight: FontWeight.bold));
    String percentageChangeText = "1 hour: $percentageChange%";
    TextSpan percentageChangeTextWidget;
    if (double.parse(percentageChange) > 0) {
      percentageChangeTextWidget = new TextSpan(
          text: percentageChangeText, style: TextStyle(color: Colors.green));
    } else {
      percentageChangeTextWidget = new TextSpan(
          text: percentageChangeText, style: TextStyle(color: Colors.red));
    }
    return RichText(
        text:
            TextSpan(children: [priceTextEWidget, percentageChangeTextWidget]));
  }
}
