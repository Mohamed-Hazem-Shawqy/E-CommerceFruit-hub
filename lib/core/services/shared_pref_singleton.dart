import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefSingleton {
  static late SharedPreferences _instance;

  static Future<void> initPref() async {
    _instance = await SharedPreferences.getInstance();
  }

  static bool? getBool(String key) {
    return _instance.getBool(key);
  }
  static String getString(String key) {
    return _instance.getString(key)??'';
  }

  static setBool(String key, bool value) {
    _instance.setBool(key, value);
  }

  static setString(String key, String value) async {
   await _instance.setString(key, value);
  }
}
