import 'package:exchange_emu_front/providers/transaction_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final transactionProvider =
        Provider.of<TransactionProvider>(context, listen: true);
    return ListView.builder(
      itemCount: transactionProvider
          .transactions.length, // Número de elementos en la lista
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(4),
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                color: Colors.grey,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(255, 74, 74, 74),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  )
                ]),
            height: size.height * 0.1,
            width: size.width * 0.8,
            child: Center(
              child: ListTile(
                title: Text(
                    "${transactionProvider.transactions[index].symbol} ${transactionProvider.transactions[index].actualPrice} €",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold)),
                subtitle: Text(
                  "${transactionProvider.transactions[index].amount} ${transactionProvider.transactions[index].symbol} ${transactionProvider.transactions[index].transactionTime.toLocal()}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 15),
                ),
                leading: CircleAvatar(
                  backgroundImage: AssetImage(
                      'assets/images/${transactionProvider.transactions[index].symbol}.png'),
                  backgroundColor: Colors.white,
                ),
                trailing: Text(
                  tipoOperacion(transactionProvider.transactions[index].opType),
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

  String tipoOperacion(String letra) {
    if (letra == 'C') {
      return "Compra";
    } else {
      return "Venta";
    }
  }
}
