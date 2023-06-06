import 'package:exchange_emu_front/models/transaction_send.dart';
import 'package:exchange_emu_front/providers/currencies_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../preferences/shared_preferences.dart';
import '../providers/transaction_provider.dart';
import '../providers/user_provider.dart';
import '../providers/wallets_provider.dart';

class Operation extends StatefulWidget {
  @override
  _OperationState createState() => _OperationState();
}

class _OperationState extends State<Operation> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _numberController = TextEditingController();
  double enteredNumber = 0.0;
  String resultado = "Total de la operacion:";

  @override
  void dispose() {
    _numberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final transactionProvider =
        Provider.of<TransactionProvider>(context, listen: false);
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final size = MediaQuery.of(context).size;
    return AlertDialog(
      title: Center(child: Text('Cantidad a ${verOpeacion()}')),
      content: Form(
        key: _formKey,
        child: Container(
          height: size.height * 0.3,
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(157, 157, 157, 1), boxShadow: []),
                height: size.height * 0.1,
                child: Center(
                  child: TextFormField(
                    decoration: const InputDecoration(
                        labelText: "Cantidad de monedas",
                        suffixIcon: Icon(Icons.currency_bitcoin_outlined)),
                    controller: _numberController,
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, ingrese un número';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        enteredNumber =
                            double.parse(_numberController.value.text);
                        resultado =
                            "Total de la operacion: ${(enteredNumber * Preferences.lastPrice).toStringAsFixed(2)} €";
                      });
                    },
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20.5)),
                    color: Color.fromRGBO(0, 188, 212, 1),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      )
                    ]),
                height: size.height * 0.1,
                child: Center(
                  child: Text(resultado),
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Center(
                child: Text(calcularResultado()),
              )
            ],
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancelar'),
        ),
        ElevatedButton(
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              enteredNumber = double.tryParse(_numberController.text)!;
              if (enteredNumber * Preferences.lastPrice >= 5) {
                transactionProvider.newOperation(
                    TransactionLite(
                        idUser: Preferences.idUser,
                        symbol: Preferences.symbol,
                        amount: enteredNumber,
                        opType: Preferences.optype),
                    context);
                Navigator.pop(context);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("El minimo de compras es de 5 €")));
              }
            }
          },
          child: const Text('Aceptar'),
        ),
      ],
    );
  }

  String verOpeacion() {
    if (Preferences.optype == 'C') {
      return "Comprar";
    } else {
      return "Vender";
    }
  }

  String calcularResultado() {
    if (Preferences.optype == 'C') {
      return "Saldo restante: ${(Preferences.saldo - (enteredNumber * Preferences.lastPrice)).toStringAsFixed(2)} €";
    } else {
      return "Saldo restante: ${(Preferences.saldo + (enteredNumber * Preferences.lastPrice)).toStringAsFixed(2)} €";
    }
  }
}
