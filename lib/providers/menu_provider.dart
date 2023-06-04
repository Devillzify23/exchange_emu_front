import 'package:exchange_emu_front/widgets/transaction_list.dart';
import 'package:exchange_emu_front/widgets/transaction_list_vacia.dart';
import 'package:exchange_emu_front/widgets/wallet_list.dart';
import 'package:flutter/material.dart';

import '../widgets/simple_list.dart';

class MenuProvider extends ChangeNotifier {
  String nombreMenu = "Cryptomonedas";
  Widget widget = const SimpleCurrencyList();
  void cambiarOpt(int opt) {
    if (opt == 1) {
      nombreMenu = "Cryptomonedas";
      widget = const SimpleCurrencyList();
    }
    if (opt == 2) {
      nombreMenu = "Wallets";
      widget = const WalletListWidget();
    }
    if (opt == 3) {
      nombreMenu = "Historial";
      widget = const TransactionList();
    }
    if (opt == 4) {
      nombreMenu = "Historial";
      widget = const TransactionListVacia();
    }
  }
}
