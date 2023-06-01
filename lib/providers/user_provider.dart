import 'package:exchange_emu_front/models/models.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

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
    var url = Uri.http('192.168.1.76:8080', 'users/login/$cuenta/$contra');
    final response = await http.get(url);
    usuario = User.fromJson(response.body);
    notifyListeners();
  }
}
