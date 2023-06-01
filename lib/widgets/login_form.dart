import 'dart:io';

import 'package:exchange_emu_front/pages/pages.dart';
import 'package:exchange_emu_front/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../preferences/shared_preferences.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  String _cuenta = '';
  String _contra = '';

  void _submitForm() async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      await userProvider.getUser(_cuenta, _contra);
    }
    if (userProvider.usuario.id != null) {
      Preferences.idUser = userProvider.usuario.id!;
      Preferences.apodo = userProvider.usuario.apodo!;
      Preferences.logged = true;
      print("estas son las preferences");
      print(Preferences.apodo);
      print(Preferences.idUser);
      print(Preferences.logged);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              "No se ha encontrado ningun usuario con esas credenciales")));
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListView(children: [
      Form(
        key: _formKey,
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.1,
                width: size.width,
              ),
              Container(
                width: size.width * 0.8,
                child: TextFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Cuenta',
                      suffixIcon: Icon(
                        Icons.person,
                        color: Colors.black,
                      )),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, ingresa tu cuenta';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _cuenta = value!;
                  },
                ),
              ),
              SizedBox(
                height: size.width * 0.2,
                width: size.width,
              ),
              Container(
                width: size.width * 0.8,
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Contraseña',
                    suffixIcon: Icon(
                      Icons.lock,
                      color: Colors.black,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, ingresa tu contraseña';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _contra = value!;
                  },
                  obscureText: true, // Oculta el texto ingresado
                ),
              ),
              SizedBox(
                height: size.width * 0.2,
                width: size.width,
              ),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Login'),
              ),
              SizedBox(
                width: size.width,
                height: size.height * 0.1,
              ),
              Container(
                width: size.width * 0.8,
                height: size.height * 0.2,
                child: Column(
                  children: [
                    const Text("No tienes cuenta?"),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    GestureDetector(
                      child: Container(
                        height: size.height * 0.1,
                        width: size.width,
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.5)),
                            color: Colors.cyan,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3),
                              )
                            ]),
                        child: const Center(
                          child: Text(
                            "Registrate",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, '/register');
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ]);
  }
}
