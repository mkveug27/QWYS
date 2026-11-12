import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageService {
  const StorageService({required this.secureStorage});

  final FlutterSecureStorage secureStorage;

  Future<void> write({
    required String key,
    required String value,
  }) {
    return secureStorage.write(key: key, value: value);
  }

  Future<String?> read(String key) {
    return secureStorage.read(key: key);
  }

  Future<void> delete(String key) {
    return secureStorage.delete(key: key);
  }

  Future<void> clear() {
    return secureStorage.deleteAll();
  }
}
