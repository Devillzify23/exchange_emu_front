import 'dart:convert';

import 'package:exchange_emu_front/models/wallet_list_model.dart';
import 'package:flutter/material.dart';
import '../models/models.dart';
import '../preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class WalletProvider extends ChangeNotifier {
  WalletList walletTocho = WalletList(walletList: []);
  List<Wallet> wallets = [];

  WalletProvider() {
    getWallets();
  }

  Future<void> getWallets() async {
    var url = Uri.http(Preferences.ip, 'wallets/${Preferences.idUser}');
    final response = await http.get(url);
    String result = "{\"WalletList\":${response.body}}";
    walletTocho = WalletList.fromMap(jsonDecode(result));
    for (int i = 0; i < walletTocho.walletList.length; i++) {
      wallets.add(walletTocho.walletList[i]);
    }
    notifyListeners();
  }
}
