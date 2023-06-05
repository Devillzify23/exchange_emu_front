import 'dart:async';

import 'package:exchange_emu_front/providers/currencies_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../preferences/shared_preferences.dart';

class SimpleCurrencyList extends StatefulWidget {
  const SimpleCurrencyList({super.key});

  @override
  State<SimpleCurrencyList> createState() => _SimpleCurrencyListState();
}

class _SimpleCurrencyListState extends State<SimpleCurrencyList> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final criptolist = Provider.of<CurrencyProvider>(context, listen: true);
    Timer.periodic(Duration(seconds: 15), (timer) {
      criptolist.getCryptos();
    });
    return ListView.builder(
      itemCount:
          criptolist.listacriptos.length, // Número de elementos en la lista
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(4),
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                color:
                    calcularColor(criptolist.listacriptos[index].priceChange),
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
                title: Text(criptolist.listacriptos[index].name,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold)),
                subtitle: Text(
                  "${criptolist.listacriptos[index].priceChange}% ${flechita(criptolist.listacriptos[index].priceChange)}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
                leading: CircleAvatar(
                  backgroundImage: AssetImage(
                      'assets/images/${criptolist.listacriptos[index].symbol}.png'),
                  backgroundColor: Colors.white,
                ),
                trailing: Text(
                  "${criptolist.listacriptos[index].currentPrice} €",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Preferences.symbol = criptolist.listacriptos[index].symbol;
                  criptolist
                      .getFullCrypto(criptolist.listacriptos[index].symbol);
                  Navigator.pushNamed(context, '/crypto');
                },
              ),
            ),
          ),
        );
      },
    );
  }

  Color calcularColor(double cantidad) {
    if (cantidad > 0) {
      return const Color.fromARGB(255, 152, 255, 155);
    } else {
      return const Color.fromARGB(255, 255, 106, 95);
    }
  }

  String flechita(double cantidad) {
    if (cantidad > 0) {
      return "↑";
    } else {
      return "↓";
    }
  }
}
