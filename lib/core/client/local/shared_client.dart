import 'package:shared_preferences/shared_preferences.dart';

enum SharedKeys { theme, lang, reminder }

class SharedClient {
  SharedClient(this._preferences);
  final SharedPreferences _preferences;

  Future<void> writeString(SharedKeys key, String value) async {
    await _preferences.setString(key.name, value);
  }

  String? readString(SharedKeys key) {
    return _preferences.getString(key.name);
  }

  Future<void> writeStrings(SharedKeys key, List<String> value) async {
    await _preferences.setStringList(key.name, value);
  }

  List<String>? readStrings(SharedKeys key) {
    return _preferences.getStringList(key.name);
  }

  Future<void> writeBool(SharedKeys key, {required bool value}) async {
    await _preferences.setBool(key.name, value);
  }

  bool? readBool(SharedKeys key) {
    return _preferences.getBool(key.name);
  }

  Future<void> writeDouble(SharedKeys key, double value) async {
    await _preferences.setDouble(key.name, value);
  }

  double? readDouble(SharedKeys key) {
    return _preferences.getDouble(key.name);
  }

  Future<bool> hasKey(SharedKeys key) async {
    return _preferences.containsKey(key.name);
  }

  Future<bool> delete(SharedKeys key) async {
    return _preferences.remove(key.name);
  }

  Future<bool> deleteAll() async {
    return _preferences.clear();
  }
}
