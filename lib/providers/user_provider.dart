import 'package:exchange_emu_front/models/models.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../models/user_model_send.dart';
import '../preferences/shared_preferences.dart';

class UserProvider extends ChangeNotifier {
  User usuario = User(
      id: null,
      nombre: null,
      apellido: null,
      apodo: null,
      cuenta: null,
      contra: null,
      saldo: null);

  Future<void> getUser(String cuenta, String contra) async {
    var url = Uri.http(Preferences.ip, 'users/login/$cuenta/$contra');
    final response = await http.get(url);
    usuario = User.fromJson(response.body);
    Preferences.idUser = usuario.id!;
    Preferences.apodo = usuario.apodo!;
    Preferences.logged = true;
    Preferences.cuenta = usuario.cuenta!;
    Preferences.contra = usuario.contra!;
    notifyListeners();
  }

  Future<void> registerNewUser(UserSend user) async {
    var url = Uri.http(Preferences.ip, 'users/register');
    final userJson = user.toJson();
    final response = await http.post(url,
        body: userJson, headers: {'Content-Type': 'application/json'});
    usuario = User.fromJson(response.body);
    notifyListeners();
  }
}
