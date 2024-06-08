// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// class AppSecureStorage {
//   static const String _secureStorageKeyToken = 'SECURE_STORAGE_KEY_TOKEN';
//   static const String _secureStorageKeyRefreshToken =
//       'SECURE_STORAGE_KEY_REFRESH_TOKEN';

//   final FlutterSecureStorage _secureStorage =
//       FlutterSecureStorage(aOptions: _getAndroidOptions());

//   AppSecureStorage(this._secureStorage);

//   Future<String?> getUserToken() async {
//     return await _secureStorage.read(key: _secureStorageKeyToken);
//   }

//   Future<void> setUserToken(String value) async {
//     await _secureStorage.write(key: _secureStorageKeyToken, value: value);
//   }

//   Future<String?> getUserRefreshToken() async {
//     return await _secureStorage.read(key: _secureStorageKeyRefreshToken);
//   }

//   Future<void> setUserRefreshToken(String value) async {
//     await _secureStorage.write(
//         key: _secureStorageKeyRefreshToken, value: value);
//   }

//   AndroidOptions _getAndroidOptions() => const AndroidOptions(
//         encryptedSharedPreferences: true,
//       );
// }
