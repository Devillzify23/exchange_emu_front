import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _prefs;

  static int _idUser = 0;

  static String _apodo = "";

  static bool _logged = false;

  static String _ip = '192.168.0.187:8080';

  static String _symbol = "";

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

  static String get ip {
    return _prefs.getString('ip') ?? _ip;
  }

  static set ip(String ip) {
    _ip = ip;
    _prefs.setString('ip', ip);
  }

  static String get symbol {
    return _prefs.getString('symbol') ?? _symbol;
  }

  static set symbol(String symbol) {
    _symbol = symbol;
    _prefs.setString('symbol', symbol);
  }
}
