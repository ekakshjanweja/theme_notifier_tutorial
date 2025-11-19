import "package:shared_preferences/shared_preferences.dart";

class LocalStorage {
  static SharedPreferences? _prefs;
  static SharedPreferences? get prefs => _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<void> set(String key, dynamic value) async {
    if (prefs == null) await init();

    if (value is String) {
      await _prefs?.setString(key, value);
    } else if (value is int) {
      await _prefs?.setInt(key, value);
    } else if (value is bool) {
      await _prefs?.setBool(key, value);
    } else if (value is double) {
      await _prefs?.setDouble(key, value);
    } else if (value is List<String>) {
      await _prefs?.setStringList(key, value);
    } else {
      throw Exception("Unsupported value type");
    }
  }

  static T? get<T>(String key, {T? defaultValue}) {
    if (prefs == null) return defaultValue;

    if (T == String) {
      return _prefs?.getString(key) as T? ?? defaultValue;
    } else if (T == int) {
      return _prefs?.getInt(key) as T? ?? defaultValue;
    } else if (T == bool) {
      return _prefs?.getBool(key) as T? ?? defaultValue;
    } else if (T == double) {
      return _prefs?.getDouble(key) as T? ?? defaultValue;
    } else if (T == List<String>) {
      return _prefs?.getStringList(key) as T? ?? defaultValue;
    } else {
      throw Exception("Unsupported value type");
    }
  }

  static Future<void> remove(String key) async {
    if (prefs == null) await init();
    await _prefs?.remove(key);
  }

  static Future<void> clear() async {
    if (prefs == null) await init();
    await _prefs?.clear();
  }
}
