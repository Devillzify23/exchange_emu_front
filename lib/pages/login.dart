import 'package:exchange_emu_front/widgets/login_form.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});
  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          "ExchangeEmu",
          style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontStyle: FontStyle.italic),
        )),
      ),
      body: LoginForm(),
    );
  }
}
