import 'package:exchange_emu_front/models/models.dart';
import 'package:exchange_emu_front/providers/currencies_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';

class SimpleCurrencyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final criptolist = Provider.of<CurrencyProvider>(context, listen: false);
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
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 74, 74, 74),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  )
                ]),
            height: size.height * 0.15,
            width: size.width * 0.8,
            child: Center(
              child: ListTile(
                title: Text("${criptolist.listacriptos[index].name}",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                subtitle: Text(
                  "${criptolist.listacriptos[index].priceChange}% " +
                      flechita(criptolist.listacriptos[index].priceChange),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                leading: CircleAvatar(
                  backgroundImage: AssetImage(
                      'assets/images/${criptolist.listacriptos[index].symbol}.png'),
                  backgroundColor: Colors.white,
                ),
                trailing: Text(
                  "${criptolist.listacriptos[index].symbol}",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                onTap: () => print("hola"),
              ),
            ),
          ),
        );
      },
    );
  }

  Color calcularColor(double cantidad) {
    if (cantidad > 0) {
      return Color.fromARGB(255, 152, 255, 155);
    } else {
      return Color.fromARGB(255, 255, 106, 95);
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
