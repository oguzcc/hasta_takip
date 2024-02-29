import 'package:hive_flutter/hive_flutter.dart';

enum HiveKeys { box, user, reminder }

class HiveClient {
  HiveClient(this._box);

  final Box<dynamic> _box;

  Future<void> writeToBox(HiveKeys key, dynamic value) async {
    await _box.put(key.name, value);
  }

  dynamic readFromBox(HiveKeys key) {
    return _box.get(key.name);
  }

  Future<void> deleteFromBox(HiveKeys key) async {
    await _box.delete(key.name);
  }

  bool hasKey(HiveKeys key) {
    return _box.containsKey(key.name);
  }

  Future<void> delete() async {
    await _box.clear();
  }

  Future<void> deleteAll() async {
    await _box.deleteFromDisk();
  }

  void closeBox() {
    _box.close();
  }
}
