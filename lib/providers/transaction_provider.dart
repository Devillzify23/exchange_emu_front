import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/models.dart';
import '../preferences/shared_preferences.dart';

class TransactionProvider extends ChangeNotifier {
  BigTransaction bigTransaction = BigTransaction(transaction: []);
  List<Transaction> transactions = [];

  TransactionProvider() {
    getTransactions();
  }

  Future<void> getTransactions() async {
    print("transacciones nuevas");
    transactions.clear();
    var url = Uri.http(Preferences.ip, 'transactions/${Preferences.idUser}');
    final response = await http.get(url);
    String result = "{\"BigTransaction\":${response.body}}";
    bigTransaction = BigTransaction.fromMap(jsonDecode(result));
    for (int i = 0; i < bigTransaction.transaction.length; i++) {
      transactions.add(bigTransaction.transaction[i]);
    }
    notifyListeners();
  }

  Future<void> newOperation(TransactionLite lite, BuildContext context) async {
    print("enviando operacion");
    var url = Uri.http(Preferences.ip, 'transactions/operation');
    final transaction = lite.toJson();
    final response = await http.post(url,
        body: transaction, headers: {'Content-Type': 'application/json'});
    notifyListeners();
  }
}
