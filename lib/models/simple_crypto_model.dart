// To parse this JSON data, do
//
//     final simpleCrypto = simpleCryptoFromMap(jsonString);

import 'dart:convert';

class SimpleCrypto {
  final String name;
  final double currentPrice;
  final double priceChange;

  SimpleCrypto({
    required this.name,
    required this.currentPrice,
    required this.priceChange,
  });

  factory SimpleCrypto.fromJson(String str) =>
      SimpleCrypto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SimpleCrypto.fromMap(Map<String, dynamic> json) => SimpleCrypto(
        name: json["name"],
        currentPrice: json["current_price"]?.toDouble(),
        priceChange: json["price_change"]?.toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "current_price": currentPrice,
        "price_change": priceChange,
      };
}
