import 'dart:convert';

class SimpleCrypto {
  final String name;
  final String symbol;
  final double currentPrice;
  final double priceChange;

  SimpleCrypto(
      {required this.name,
      required this.currentPrice,
      required this.priceChange,
      required this.symbol});

  factory SimpleCrypto.fromJson(String str) =>
      SimpleCrypto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SimpleCrypto.fromMap(Map<String, dynamic> json) => SimpleCrypto(
      name: json["name"],
      currentPrice: json["current_price"]?.toDouble(),
      priceChange: json["price_change"]?.toDouble(),
      symbol: json["symbol"]);

  Map<String, dynamic> toMap() => {
        "name": name,
        "current_price": currentPrice,
        "price_change": priceChange,
        "symbol": symbol
      };
}
