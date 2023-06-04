import 'package:exchange_emu_front/models/models.dart';
import 'package:exchange_emu_front/providers/currencies_provider.dart';
import 'package:exchange_emu_front/providers/wallets_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WalletListWidget extends StatelessWidget {
  const WalletListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final walletProvider = Provider.of<WalletProvider>(context, listen: true);
    final criptoProvider =
        Provider.of<CurrencyProvider>(context, listen: false);

    List<SimpleCrypto> criptos = criptoProvider.listacriptos;
    List<Wallet> wallets = walletProvider.wallets;
    return ListView.builder(
      itemCount:
          walletProvider.wallets.length, // Número de elementos en la lista
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(4),
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                color: const Color.fromARGB(255, 218, 218, 218),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(255, 74, 74, 74),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  )
                ]),
            height: size.height * 0.15,
            width: size.width * 0.8,
            child: Center(
              child: ListTile(
                title: Text(walletProvider.wallets[index].symbol,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold)),
                subtitle: Text(
                  "total €: ${calcularTotal(criptos, wallets, walletProvider.wallets[index].symbol)}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
                leading: CircleAvatar(
                  backgroundImage: AssetImage(
                      'assets/images/${walletProvider.wallets[index].symbol}.png'),
                  backgroundColor: Colors.white,
                ),
                trailing: Text(
                  "${walletProvider.wallets[index].funds} ${walletProvider.wallets[index].symbol}",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  String calcularTotal(
      List<SimpleCrypto> lista, List<Wallet> wallets, String symbol) {
    String result = "";
    double cripto = 0.0;
    double funds = 0.0;
    for (int i = 0; i < lista.length; i++) {
      if (lista[i].symbol == symbol) {
        cripto = lista[i].currentPrice;
      }
    }
    for (int j = 0; j < wallets.length; j++) {
      if (wallets[j].symbol == symbol) {
        funds = wallets[j].funds;
      }
    }
    double total = cripto * funds;
    result = total.toStringAsFixed(2);
    return "$result €";
  }
}
