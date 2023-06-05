import 'dart:convert';

import 'models.dart';

class FullCrypto {
  final String name;
  final String symbol;
  final String description;
  final String maxSupply;
  final Pricing pricing;

  FullCrypto({
    required this.name,
    required this.symbol,
    required this.description,
    required this.maxSupply,
    required this.pricing,
  });

  factory FullCrypto.fromJson(String str) =>
      FullCrypto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FullCrypto.fromMap(Map<String, dynamic> json) => FullCrypto(
        name: json["name"],
        symbol: json["symbol"],
        description: json["description"],
        maxSupply: json["max_supply"],
        pricing: Pricing.fromMap(json["pricing"]),
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "symbol": symbol,
        "description": description,
        "max_supply": maxSupply,
        "pricing": pricing!.toMap(),
      };
}
