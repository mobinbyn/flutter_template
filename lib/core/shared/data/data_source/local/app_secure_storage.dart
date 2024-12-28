import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../../app/service/interface/i_authentication_service.dart';

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

  Future<void> saveTokenPair(TokenPair tokenPair) async {
    await _secureStorage.write(key: _tokenKey, value: tokenPair.accessToken);
    await _secureStorage.write(key: _refreshTokenKey, value: tokenPair.refreshToken);
  }

  Future<TokenPair?> getTokenPair() async {
    var accessToken = await _secureStorage.read(key: _tokenKey);
    var refreshToken = await _secureStorage.read(key: _refreshTokenKey);

    if (accessToken != null) {
      return (accessToken: accessToken, refreshToken: refreshToken);
    }
    return null;
  }

  Future<void> clearTokenPair() async {
    await _secureStorage.delete(key: _tokenKey);
    await _secureStorage.delete(key: _refreshTokenKey);
  }

  Future<void> saveEmail(String email) async {
    await _secureStorage.write(key: _emailKey, value: email);
  }

  Future<String?> getEmail() async {
    return await _secureStorage.read(key: _emailKey);
  }

  Future<void> clearEmail() async {
    await _secureStorage.delete(key: _emailKey);
  }

  Future<bool> hasEmail() async {
    var value = await _secureStorage.read(key: _emailKey);
    return value != null;
  }

  Future<void> clearAll() async {
    return await _secureStorage.deleteAll();
  }
}
