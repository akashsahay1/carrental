import 'package:shared_preferences/shared_preferences.dart';

class PreferencesManager {
  static SharedPreferences? _preferences;

  static const _keyFirstTime = 'firstTime';

  static Future initializePreferences() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static bool isFirstTime() {
    return _preferences?.getBool(_keyFirstTime) ?? true;
  }

  static Future setFirstTime(bool isFirstTime) async {
    await _preferences?.setBool(_keyFirstTime, isFirstTime);
  }
}
