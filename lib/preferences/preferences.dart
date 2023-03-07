import 'package:shared_preferences/shared_preferences.dart';

/* Sirve para la funcionalidad del login,
si se marca el checkbox se queda guardado,
de lo contrario no guarda nada y se queda el ultimo
valor guardado*/
class Preferencias {
  // shared preferences para guardar el usuario, contrasenya y el checkbox
  static late SharedPreferences _prefs;

  static String _nom = '';
  static String _pass = '';
  static String _email = '';
  static int _character = 1;
  static bool _diablo = false;

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static bool get diablo {
    return _prefs.getBool('diablo') ?? _diablo;
  }

  static int get character {
    return _prefs.getInt('character') ?? _character;
  }

  static String get nom {
    return _prefs.getString('nom') ?? _nom;
  }

  static set setnom(String value) {
    _nom = value;
    _prefs.setString('nom', value);
  }

  static String get pass {
    return _prefs.getString('pass') ?? _pass;
  }

  static set setdiablo(bool value) {
    _diablo = value;
    _prefs.setBool('diablo', value);
  }

  static set setcharacter(int value) {
    _character = value;
    _prefs.setInt('character', value);
  }

  static set setpass(String value) {
    _pass = value;
    _prefs.setString('pass', value);
  }

  static String get email {
    return _prefs.getString('email') ?? _email;
  }

  static set setemail(String value) {
    _email = value;
    _prefs.setString('email', value);
  }
}
