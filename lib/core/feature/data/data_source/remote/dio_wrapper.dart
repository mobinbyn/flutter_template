import 'package:dio/dio.dart';

import '../../../../app/di/injector_index.dart';
import '../../../../app/res/const/app_constant.dart';
import 'token_interceptor.dart';

class DioWrapper {
  Dio getDio({bool hasToken = false}) {
    Dio dio = Dio();

    dio.options = _getBaseOption(null);

    if (hasToken) {
      dio.interceptors.add(locator<TokenInterceptor>());
    }
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
