import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AppSecureStorage {
  static const String _emailKey = 'SECURE_STORAGE_KEY_EMAIL';
  static const String _tokenKey = 'SECURE_STORAGE_KEY_TOKEN';
  static const String _refreshTokenKey = 'SECURE_STORAGE_KEY_REFRESH_TOKEN';

  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ),
  );

  AppSecureStorage();

  Future<void> persistEmailAndToken(String email, String token, String refreshToken) async {
    await _secureStorage.write(key: _emailKey, value: email);
    await _secureStorage.write(key: _tokenKey, value: token);
    await _secureStorage.write(key: _refreshTokenKey, value: refreshToken);
  }

  Future<bool> hasEmail() async {
    var value = await _secureStorage.read(key: _emailKey);
    return value != null;
  }

  Future<bool> hasToken() async {
    var value = await _secureStorage.read(key: _tokenKey);
    return value != null;
  }

  Future<bool> hasRefreshToken() async {
    var value = await _secureStorage.read(key: _refreshTokenKey);
    return value != null;
  }

  Future<void> deleteEmail() async {
    await _secureStorage.delete(key: _emailKey);
  }

  Future<void> deleteToken() async {
    await _secureStorage.delete(key: _tokenKey);
  }

  Future<void> deleteRefreshToken() async {
    await _secureStorage.delete(key: _refreshTokenKey);
  }

  Future<String?> getEmail() async {
    return await _secureStorage.read(key: _emailKey);
  }

  Future<String?> getToken() async {
    return await _secureStorage.read(key: _tokenKey);
  }

  Future<String?> getRefreshToken() async {
    return await _secureStorage.read(key: _refreshTokenKey);
  }

  Future<void> deleteAll() async {
    return await _secureStorage.deleteAll();
  }
}
