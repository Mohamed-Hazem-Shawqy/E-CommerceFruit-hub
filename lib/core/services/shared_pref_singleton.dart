import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefSingleton {
  static late SharedPreferences _instance;

 static Future<void> initPref() async {
    _instance = await SharedPreferences.getInstance();
  }

 static bool? getInstance(String key) {
   return _instance.getBool(key);
  }

 static setInstance(String key, bool value) {
    _instance.setBool(key, value);
  }
}
