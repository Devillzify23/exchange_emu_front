import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _prefs;

  static int _idUser = 0;

  static String _apodo = "";

  static bool _logged = true;

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static int get idUser {
    return _prefs.getInt("idUser") ?? _idUser;
  }

  static set idUser(int idUser) {
    _idUser = idUser;
    _prefs.setInt('idUser', idUser);
  }

  static bool get logged {
    return _prefs.getBool('logged') ?? _logged;
  }

  static set logged(bool logged) {
    _logged = logged;
    _prefs.setBool('logged', _logged);
  }

  static String get apodo {
    return _prefs.getString('apodo') ?? _apodo;
  }

  static set apodo(String apodo) {
    _apodo = apodo;
    _prefs.setString('apodo', apodo);
  }
}
