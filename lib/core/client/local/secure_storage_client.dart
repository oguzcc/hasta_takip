import 'package:flutter_secure_storage/flutter_secure_storage.dart';

enum SecureKeys { token }

// Flutter secure storage
class SecureStorageClient {
  SecureStorageClient(this._storage);

  final FlutterSecureStorage _storage;

  Future<void> write(SecureKeys key, String value) async {
    await _storage.write(key: key.name, value: value);
  }

  Future<String?> read(SecureKeys key) async {
    return _storage.read(key: key.name);
  }

  Future<Map<String, String>?> readAll() async {
    return _storage.readAll();
  }

  Future<bool> hasKey(SecureKeys key) async {
    return _storage.containsKey(key: key.name);
  }

  Future<void> delete(SecureKeys key) async {
    await _storage.delete(key: key.name);
  }

  Future<void> deleteAll() async {
    await _storage.deleteAll();
  }
}
