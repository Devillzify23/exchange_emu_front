// To parse this JSON data, do
//
//     final walletList = walletListFromMap(jsonString);

import 'dart:convert';

import 'models.dart';

class WalletList {
  final List<Wallet> walletList;

  WalletList({
    required this.walletList,
  });

  factory WalletList.fromJson(String str) =>
      WalletList.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory WalletList.fromMap(Map<String, dynamic> json) => WalletList(
        walletList:
            List<Wallet>.from(json["WalletList"].map((x) => Wallet.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "WalletList": List<dynamic>.from(walletList.map((x) => x.toMap())),
      };
}
