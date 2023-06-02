import 'package:exchange_emu_front/models/models.dart';
import 'package:exchange_emu_front/providers/currencies_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';

class SimpleCurrencyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final criptolist = Provider.of<CurrencyProvider>(context, listen: false);
    return ListView.builder(
      itemCount:
          criptolist.listacriptos.length, // Número de elementos en la lista
      itemBuilder: (context, index) {
        return ListTile(
          title: Text("${criptolist.listacriptos[index].name}"),
          leading: CircleAvatar(
            backgroundImage: AssetImage(
                'assets/images/${criptolist.listacriptos[index].symbol}.png'),
            backgroundColor: Colors.white,
          ),
        );
      },
    );
  }
}
