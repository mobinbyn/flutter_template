import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AppSecureStorage {
  static const String secureStorageKeyToken = 'SECURE_STORAGE_KEY_TOKEN';
  static const String secureStorageKeyRefreshToken =
      'SECURE_STORAGE_KEY_REFRESH_TOKEN';

  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ),
  );

  AppSecureStorage();

  Future<String?> getUserToken() async {
    return await _secureStorage.read(key: secureStorageKeyToken);
  }

  Future<void> setUserToken(String value) async {
    await _secureStorage.write(key: secureStorageKeyToken, value: value);
  }

  Future<String?> getUserRefreshToken() async {
    return await _secureStorage.read(key: secureStorageKeyRefreshToken);
  }

  Future<void> setUserRefreshToken(String value) async {
    await _secureStorage.write(key: secureStorageKeyRefreshToken, value: value);
  }
}
