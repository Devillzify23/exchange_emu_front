import 'package:exchange_emu_front/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../preferences/shared_preferences.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  String _cuenta = '';
  String _contra = '';
  String _nombre = '';
  String _apelido = '';
  String _apodo = '';

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
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
                height: size.width * 0.2,
                width: size.width,
              ),
              Container(
                width: size.width * 0.8,
                child: TextFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Nombre',
                      suffixIcon: Icon(
                        Icons.person,
                        color: Colors.black,
                      )),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, introduce tu nombre';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _nombre = value!;
                  },
                ),
              ),
              Container(
                width: size.width * 0.8,
                child: TextFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Apellido',
                      suffixIcon: Icon(
                        Icons.person,
                        color: Colors.black,
                      )),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, introduce tu apellido';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _apelido = value!;
                  },
                ),
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
              Container(
                width: size.width * 0.8,
                child: TextFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Apodo',
                      suffixIcon: Icon(
                        Icons.person,
                        color: Colors.black,
                      )),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, introduce tu apodo';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _apodo = value!;
                  },
                ),
              ),
              SizedBox(
                height: size.width * 0.2,
                width: size.width,
              ),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Registrarse'),
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}
