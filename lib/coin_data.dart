import 'dart:convert';
import 'dart:async';

import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];
const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = ' 614DFBFF-9AEE-4ED5-A84E-E73A2A4FF235 ';
int i=0;

class CoinData {
  Future getCoinData(String selectedCurrency,int i) async{

    String requestURL = '$coinAPIURL/${cryptoList[i]}/$selectedCurrency?apikey=$apiKey';
    http.Response response = await http.get(requestURL);
    //  final response= await http.get('https://rest.coinapi.io/v1/exchangerate/BTC/USD');
    if(response.statusCode==200){
      var decodedData = jsonDecode(response.body);
      var lastPrice = decodedData['rate'];
      return lastPrice;
    } else
    {
      print(response.statusCode);
      throw Exception('fail');
    }
  }
//  String time;
//  String assetIDBase;
//  String assetIDQuote;
//  double rate;
//
//  CoinData({this.assetIDBase,this.assetIDQuote,this.rate,this.time});
//  factory CoinData.fromJson(Map<String,dynamic> json){
//    return CoinData(
//      time: json['time'],
//      assetIDBase: json['asset_id_base'],
//      assetIDQuote: json['asset_id_quote'],
//      rate:  json['rate'],
//    );
//  }
}
