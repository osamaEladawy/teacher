import 'package:shared_preferences/shared_preferences.dart';

class PrefServices {
  PrefServices._();
  static final PrefServices _instance = PrefServices._();
  static PrefServices get instance => _instance;
  factory PrefServices() => _instance;
  static SharedPreferences? sharedPreferences;

  Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> saveData(
      {required String key, required dynamic value}) async {
    if (value is String) {
      return await sharedPreferences!.setString(key, value);
    } else if (value is int) {
      return await sharedPreferences!.setInt(key, value);
    } else if (value is double) {
      return await sharedPreferences!.setDouble(key, value);
    } else {
      return await sharedPreferences!.setBool(key, value);
    }
  }

  static dynamic getData({required String key}) {
    return sharedPreferences!.get(key);
  }

  static bool containKey({required String key}) {
    return sharedPreferences!.containsKey(key);
  }

  static Future<bool> removeValue(key) async {
    return await sharedPreferences!.remove(key);
  }

  static Future<bool> clearAllData() async {
    return await sharedPreferences!.clear();
  }
}
