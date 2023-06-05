import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../models/models.dart';
import '../preferences/shared_preferences.dart';

class CurrencyProvider extends ChangeNotifier {
  CryptoList cripto = CryptoList(cryptocurrencies: []);
  List<SimpleCrypto> listacriptos = [];
  FullCrypto fullcrypto = FullCrypto(
      name: "",
      symbol: "",
      description: "",
      maxSupply: "",
      pricing:
          Pricing(currentPrice: 0, priceChange: 0, currency: "", volume24H: 0));

  CurrencyProvider() {
    getCryptos();
  }
  Future<void> getCryptos() async {
    listacriptos.clear();
    var url = Uri.http(Preferences.ip, 'prices');
    final response = await http.get(url);
    cripto = CryptoList.fromMap(jsonDecode(response.body));
    for (int i = 0; i < cripto.cryptocurrencies.length; i++) {
      listacriptos.add(cripto.cryptocurrencies[i]);
    }
    notifyListeners();
  }

  Future<void> getFullCrypto(String symbol) async {
    var url = Uri.http(Preferences.ip, 'prices/${symbol}');
    final response = await http.get(url);
    fullcrypto = FullCrypto.fromJson(response.body);
    notifyListeners();
  }
}
