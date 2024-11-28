import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefer {
  SharedPrefer._privateConstructor();

  static final SharedPrefer instance = SharedPrefer._privateConstructor();

  static SharedPreferences? sp;

  Future<void> init() async {
    sp = await SharedPreferences.getInstance();
  }

  bool? getBool(String key) {
    return sp?.getBool(key);
  }

  Future<void> setBool(String key, bool value) async {
    await sp?.setBool(key, value);
  }

  Future<bool> clearAllData() async {
    return await sp!.clear();
  }
}
