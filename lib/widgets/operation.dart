import 'package:exchange_emu_front/models/transaction_send.dart';
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
  @override
  void dispose() {
    _numberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final transactionProvider =
        Provider.of<TransactionProvider>(context, listen: false);

    return AlertDialog(
      title: Text('Cantidad a ${verOpeacion()}'),
      content: Form(
        key: _formKey,
        child: TextFormField(
          controller: _numberController,
          keyboardType: TextInputType.numberWithOptions(decimal: true),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Por favor, ingrese un número';
            }
            return null;
          },
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
              transactionProvider.newOperation(TransactionLite(
                  idUser: Preferences.idUser,
                  symbol: Preferences.symbol,
                  amount: enteredNumber,
                  opType: Preferences.optype));
              Navigator.pop(context);
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
}
