import 'package:dio/dio.dart';
import 'package:flutter_template/core/app/utility/logging_mixin.dart';

class LoggerInterceptor extends Interceptor with LogMixin {
  LoggerInterceptor({
    this.request = true,
    this.requestHeader = true,
    this.requestBody = false,
    this.responseHeader = true,
    this.responseBody = false,
    this.error = true,
  });

  /// Print request [Options]
  bool request;

  /// Print request header [Options.headers]
  bool requestHeader;

  /// Print request data [Options.balanceInfoModel]
  bool requestBody;

  /// Print [Response.data]
  bool responseBody;

  /// Print [Response.headers]
  bool responseHeader;

  /// Print error message
  bool error;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    logging.d('*** DioRequest ***');
    logging.d('uri: ${options.uri}');

    if (request) {
      logging.d('method: ${options.method}');
      logging.d('responseType: ${options.responseType.toString()}');
      logging.d('followRedirects: ${options.followRedirects}');
      logging.d('connectTimeout: ${options.connectTimeout?.inSeconds ?? 0}');
      logging.d('receiveTimeout: ${options.receiveTimeout?.inSeconds ?? 0}');
      logging.d('extra: ${options.extra}');
    }
    if (requestHeader) {
      logging.d('Headers:');
      options.headers.forEach((k, v) => logging.d('$k: $v'));
    }
    if (requestBody && options.data != null) {
      logging.d('Body:');
      logging.d(options.data);
    }
    logging.d('');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logging.d('*** DioResponse ***');
    logging.d('uri: ${response.requestOptions.uri}');
    if (responseHeader) {
      logging.d('statusCode: ${response.statusCode ?? 0}');
      if (response.isRedirect) {
        logging.d('redirect: ${response.realUri}');
      }
      logging.d('Headers:');
      response.headers.forEach((k, v) => logging.d('$k: $v'));
    }
    if (responseBody) {
      logging.d('RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
      logging.d('Body: ${response.data}');
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (error) {
      logging.e('*** DioError ***');
      logging.e('ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
      if (err.response != null) {
        logging.e('Body: ${err.response?.data}');
      }
      logging.d('');
    }
    return super.onError(err, handler);
  }
}
