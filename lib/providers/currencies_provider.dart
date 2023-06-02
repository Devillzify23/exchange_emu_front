import 'dart:convert';

import 'package:exchange_emu_front/models/models.dart';
import 'package:exchange_emu_front/models/simple_crypto_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class CurrencyProvider extends ChangeNotifier {
  CryptoList cripto = CryptoList(cryptocurrencies: []);
  List<SimpleCrypto> listacriptos = [];
  CurrencyProvider() {
    getCryptos();
  }
  Future<void> getCryptos() async {
    var url = Uri.http('192.168.1.76:8080', 'prices');
    final response = await http.get(url);
    print(response.body);
    cripto = CryptoList.fromMap(jsonDecode(response.body));
    print("ahora la cripto tocha");
    for (int i = 0; i < cripto.cryptocurrencies.length; i++) {
      listacriptos.add(cripto.cryptocurrencies[i]);
    }
    notifyListeners();
  }
}
