import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _prefs;

  static int _idUser = 0;
  static String _apodo = "";
  static bool _logged = false;
  static String _ip = '192.168.1.76:8080';
  static String _symbol = '';
  static String _cuenta = "";
  static String _contra = "";
  static String _opType = "";
  static double _lastPrice = 0.0;
  static double _saldoRestante = 0.0;

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

  static String get cuenta {
    return _prefs.getString('cuenta') ?? _cuenta;
  }

  static set cuenta(String cuenta) {
    _cuenta = cuenta;
    _prefs.setString('cuenta', cuenta);
  }

  static String get contra {
    return _prefs.getString('contra') ?? _contra;
  }

  static set contra(String contra) {
    _contra = contra;
    _prefs.setString('contra', contra);
  }

  static String get optype {
    return _prefs.getString('optype') ?? _opType;
  }

  static set optype(String optype) {
    _opType = optype;
    _prefs.setString('optype', optype);
  }

  static double get lastPrice {
    return _prefs.getDouble("lastPrice") ?? _lastPrice;
  }

  static set lastPrice(double lastPrice) {
    _lastPrice = lastPrice;
    _prefs.setDouble('lastPrice', lastPrice);
  }

  static double get saldo {
    return _prefs.getDouble("saldoRestante") ?? _saldoRestante;
  }

  static set saldo(double saldo) {
    _saldoRestante = saldo;
    _prefs.setDouble('saldoRestante', saldo);
  }
}
