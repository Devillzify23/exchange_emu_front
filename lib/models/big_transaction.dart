// To parse this JSON data, do
//
//     final bigTransaction = bigTransactionFromMap(jsonString);

import 'dart:convert';

import 'models.dart';

class BigTransaction {
  final List<Transaction> transaction;

  BigTransaction({
    required this.transaction,
  });

  factory BigTransaction.fromJson(String str) =>
      BigTransaction.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BigTransaction.fromMap(Map<String, dynamic> json) => BigTransaction(
        transaction: List<Transaction>.from(
            json["BigTransaction"].map((x) => Transaction.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "Transaction": List<dynamic>.from(transaction.map((x) => x.toMap())),
      };
}
