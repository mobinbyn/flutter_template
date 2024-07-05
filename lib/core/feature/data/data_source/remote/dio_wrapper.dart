import 'package:dio/dio.dart';

import '../../../../app/di/injector_index.dart';
import '../../../../app/res/const/app_constant.dart';
import 'token_interceptor.dart';

class DioWrapper {
  Dio getDio({
    bool hasToken = false,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? extra,
    Map<String, dynamic>? headers,
    ResponseType? responseType = ResponseType.json,
    String? contentType,
    bool? persistentConnection,
  }) {
    Dio dio = Dio();

    dio.options = _getBaseOption(
      queryParameters: queryParameters,
      contentType: contentType,
      extra: extra,
      headers: headers,
      responseType: responseType,
      persistentConnection: persistentConnection,
    );

    if (hasToken) {
      dio.interceptors.add(locator<TokenInterceptor>());
    }
    return dio;
  }

  BaseOptions _getBaseOption({
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? extra,
    Map<String, dynamic>? headers,
    ResponseType? responseType = ResponseType.json,
    String? contentType,
    bool? persistentConnection,
  }) {
    int timeOut = 60 * 1000; // 1 min
    return BaseOptions(
      baseUrl: AppConstant.baseUrl,
      contentType: contentType ?? Headers.jsonContentType,
      responseType: responseType,
      headers: headers,
      extra: extra,
      queryParameters: queryParameters,
      persistentConnection: persistentConnection,
      connectTimeout: Duration(seconds: timeOut),
      receiveTimeout: Duration(seconds: timeOut),
    );
  }
}
