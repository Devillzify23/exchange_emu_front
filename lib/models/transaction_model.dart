import 'dart:convert';

class Transaction {
  final int id;
  final int idUser;
  final String symbol;
  final double actualPrice;
  final double amount;
  final String opType;
  final DateTime transactionTime;

  Transaction({
    required this.id,
    required this.idUser,
    required this.symbol,
    required this.actualPrice,
    required this.amount,
    required this.opType,
    required this.transactionTime,
  });

  factory Transaction.fromJson(String str) =>
      Transaction.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Transaction.fromMap(Map<String, dynamic> json) => Transaction(
        id: json["id"],
        idUser: json["idUser"],
        symbol: json["symbol"],
        actualPrice: json["actualPrice"]?.toDouble(),
        amount: json["amount"]?.toDouble(),
        opType: json["opType"],
        transactionTime: DateTime.parse(json["transactionTime"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "idUser": idUser,
        "symbol": symbol,
        "actualPrice": actualPrice,
        "amount": amount,
        "opType": opType,
        "transactionTime": transactionTime.toIso8601String(),
      };
}
