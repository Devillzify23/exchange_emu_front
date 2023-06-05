import 'dart:convert';

class Wallet {
  final int idUser;
  final String symbol;
  final double funds;

  Wallet({
    required this.idUser,
    required this.symbol,
    required this.funds,
  });

  factory Wallet.fromJson(String str) => Wallet.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Wallet.fromMap(Map<String, dynamic> json) => Wallet(
        idUser: json["idUser"],
        symbol: json["symbol"],
        funds: json["funds"]?.toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "idUser": idUser,
        "symbol": symbol,
        "funds": funds,
      };
}
