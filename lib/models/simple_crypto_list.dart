import 'dart:convert';

import 'simple_crypto_model.dart';

class CryptoList {
  final List<SimpleCrypto> cryptocurrencies;

  CryptoList({
    required this.cryptocurrencies,
  });

  factory CryptoList.fromJson(String str) =>
      CryptoList.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CryptoList.fromMap(Map<String, dynamic> json) => CryptoList(
        cryptocurrencies: List<SimpleCrypto>.from(
            json["cryptocurrencies"].map((x) => SimpleCrypto.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "cryptocurrencies":
            List<dynamic>.from(cryptocurrencies.map((x) => x.toMap())),
      };
}
