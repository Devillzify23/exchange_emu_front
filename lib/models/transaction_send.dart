// To parse this JSON data, do
//
//     final transaction = transactionFromMap(jsonString);

import 'dart:convert';

class TransactionLite {
  final int idUser;
  final String symbol;
  final double amount;
  final String opType;

  TransactionLite({
    required this.idUser,
    required this.symbol,
    required this.amount,
    required this.opType,
  });

  factory TransactionLite.fromJson(String str) =>
      TransactionLite.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TransactionLite.fromMap(Map<String, dynamic> json) => TransactionLite(
        idUser: json["idUser"],
        symbol: json["symbol"],
        amount: json["amount"]?.toDouble(),
        opType: json["opType"],
      );

  Map<String, dynamic> toMap() => {
        "idUser": idUser,
        "symbol": symbol,
        "amount": amount,
        "opType": opType,
      };
}
