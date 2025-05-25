import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageManager {
  static late final SharedPreferences _instance;

  static Future<void> initialize() async {
    _instance = await SharedPreferences.getInstance();
  }

  static bool? getBool(String key) {
    return _instance.getBool(key);
  }

  static Future<void> setBool(String key, bool value) async {
    await _instance.setBool(key, value);
  }
}
