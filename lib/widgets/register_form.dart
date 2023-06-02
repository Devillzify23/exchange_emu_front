import 'package:exchange_emu_front/models/user_model_send.dart';
import 'package:exchange_emu_front/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  String _nombre = '';
  String _apellido = '';
  String _cuenta = '';
  String _contra = '';
  String _apodo = '';

  void _submitForm() async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
    }
    if (_nombre != '' &&
        _apellido != '' &&
        _cuenta != '' &&
        _contra != '' &&
        _apodo != '') {
      UserSend nuevoUser = UserSend(
          nombre: _nombre,
          apellido: _apellido,
          cuenta: _cuenta,
          contra: _contra,
          apodo: _apodo);

      await userProvider.registerNewUser(nuevoUser);
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Usuario creado correctamente")));
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Introduce los datos necesarios")));
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
                      labelText: 'nombre',
                      suffixIcon: Icon(
                        Icons.person,
                        color: Colors.black,
                      )),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Introduce el nombre';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    _nombre = value!;
                  },
                ),
              ),
              SizedBox(
                height: size.height * 0.05,
                width: size.width,
              ),
              Container(
                width: size.width * 0.8,
                child: TextFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'apellido',
                      suffixIcon: Icon(
                        Icons.person_outline,
                        color: Colors.black,
                      )),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Introduce el apellido';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    _apellido = value!;
                  },
                ),
              ),
              SizedBox(
                height: size.height * 0.05,
                width: size.width,
              ),
              Container(
                width: size.width * 0.8,
                child: TextFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Cuenta',
                      suffixIcon: Icon(
                        Icons.admin_panel_settings_rounded,
                        color: Colors.black,
                      )),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Ingresa el nombre de cuenta';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    _cuenta = value!;
                  },
                ),
              ),
              SizedBox(
                height: size.height * 0.05,
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
                  onChanged: (value) {
                    _contra = value!;
                  },
                  obscureText: true, // Oculta el texto ingresado
                ),
              ),
              SizedBox(
                height: size.height * 0.05,
                width: size.width,
              ),
              Container(
                width: size.width * 0.8,
                child: TextFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'apodo',
                      suffixIcon: Icon(
                        Icons.person_add,
                        color: Colors.black,
                      )),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, introduce un apodo';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    _apodo = value!;
                  },
                ),
              ),
              SizedBox(
                height: size.height * 0.05,
                width: size.width,
              ),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Envia'),
              )
            ],
          ),
        ),
      ),
    ]);
  }
}
