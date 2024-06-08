import 'dart:async';

import 'package:dio/dio.dart';

import '../../../../app/di/index.dart';

class DioFactory {
  // final AppSecureStorage _secureStorage;
  // final AppPreferences _preferences;

  // DioFactory(this._preferences, this._secureStorage);

  static const String _authorization = 'authorization';
  static const String _authorizationType = 'Bearer';

  Future<Dio> getDio({String? token}) async {
    Map<String, dynamic>? headers;
    Dio dio = Dio();

    // String token = await _secureStorage.getUserToken();
    // String language = await _preferences.getAppLanguage();

    if (token != null) {
      headers = {
        _authorization: '$_authorizationType $token',
      };
    }

    dio.options = _getBaseOption(headers);

    return dio;
  }

  BaseOptions _getBaseOption(Map<String, dynamic>? headers) {
    int timeOut = 60 * 1000; // 1 min
    return BaseOptions(
      baseUrl: AppConstant.baseUrl,
      contentType: Headers.jsonContentType,
      connectTimeout: Duration(seconds: timeOut),
      receiveTimeout: Duration(seconds: timeOut),
      headers: headers,
    );
  }
}
