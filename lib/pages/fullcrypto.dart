import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';
import '../providers/currencies_provider.dart';

class FullCryptoPage extends StatefulWidget {
  const FullCryptoPage({super.key});

  @override
  State<FullCryptoPage> createState() => _FullCryptoPageState();
}

class _FullCryptoPageState extends State<FullCryptoPage> {
  @override
  Widget build(BuildContext context) {
    final criptolist = Provider.of<CurrencyProvider>(context, listen: true);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          criptolist.fullcrypto.name,
          style: const TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontStyle: FontStyle.italic),
        )),
      ),
      body: Center(
        child: Container(
          color: Colors.grey,
          width: size.width,
          height: size.height,
          child: Column(
            children: [Text("FRDG")],
          ),
        ),
      ),
    );
  }
}
