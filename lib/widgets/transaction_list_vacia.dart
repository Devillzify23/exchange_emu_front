import 'package:exchange_emu_front/providers/transaction_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransactionListVacia extends StatelessWidget {
  const TransactionListVacia({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final transactionProvider =
        Provider.of<TransactionProvider>(context, listen: true);
    return Container(
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
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.white,
          ),
          width: size.width,
          height: size.height * 0.2,
          child: const Center(
              child: Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              "Aun no se han realizado transacciones, prueba a realizar una compra desde la pagina principal",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          )),
        ),
      ),
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
