import 'dart:convert';

class Pricing {
  final double currentPrice;
  final double priceChange;
  final String currency;
  final double volume24H;

  Pricing({
    required this.currentPrice,
    required this.priceChange,
    required this.currency,
    required this.volume24H,
  });

  factory Pricing.fromJson(String str) => Pricing.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Pricing.fromMap(Map<String, dynamic> json) => Pricing(
        currentPrice: json["current_price"]?.toDouble(),
        priceChange: json["price_change"]?.toDouble(),
        currency: json["currency"],
        volume24H: json["volume24h"]?.toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "current_price": currentPrice,
        "price_change": priceChange,
        "currency": currency,
        "volume24h": volume24H,
      };
}
