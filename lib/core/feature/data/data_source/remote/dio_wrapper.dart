import 'package:dio/dio.dart';

import '../../../../app/di/index.dart';
import '../../../../app/di/injector.dart';

class DioWrapper {
  Dio getDio({bool hasToken = false}) {
    Dio dio = Dio();

    dio.options = getBaseOption(null);

    if (hasToken) {
      dio.interceptors.add(locator<RefreshTokenInterceptor>());
    }
    return dio;
  }

  BaseOptions getBaseOption(Map<String, dynamic>? headers) {
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
