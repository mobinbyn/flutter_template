import 'package:dio/dio.dart';
import 'package:flutter_template/core/shared/data/data_source/remote/logger_interceptor.dart';

import '../../../../app/di/injector_index.dart';
import '../../../../app/res/const/app_constant.dart';
import 'jwt_interceptor.dart';

/// A wrapper class for configuring Dio instances with predefined options.
class DioWrapper {
  /// Creates a Dio instance with the specified options.
  Dio getDio({
    bool hasToken = false, // Flag to indicate if the Dio instance should include an authentication token.
    bool logger = false, // Flag to enable/disable logging.
    Map<String, dynamic>? queryParameters, // Query parameters for the request.
    Map<String, dynamic>? extra, // Extra options for the request.
    Map<String, dynamic>? headers, // Custom headers for the request.
    ResponseType? responseType = ResponseType.json, // Expected response type.
    String? contentType, // Content type for the request.
    bool? persistentConnection, // Flag for persistent connection.
  }) {
    // Create a new Dio instance.
    Dio dio = Dio();

    // Set the base options for the Dio instance.
    dio.options = _getBaseOption(
      queryParameters: queryParameters,
      contentType: contentType,
      extra: extra,
      headers: headers,
      responseType: responseType,
      persistentConnection: persistentConnection,
    );

    // Add interceptors for logging if required.
    if (logger) {
      dio.interceptors.add(LoggerInterceptor(requestBody: true, responseBody: true));
    }

    // Add interceptors for authentication if required.
    if (hasToken) {
      dio.interceptors.add(locator<JwtInterceptor>()); // Add the AuthInterceptor to handle token management.
    }

    return dio; // Return the configured Dio instance.
  }

  /// Helper method to get base options for the Dio instance.
  BaseOptions _getBaseOption({
    Map<String, dynamic>? queryParameters, // Query parameters for the request.
    Map<String, dynamic>? extra, // Extra options for the request.
    Map<String, dynamic>? headers, // Custom headers for the request.
    ResponseType? responseType = ResponseType.json, // Expected response type.
    String? contentType, // Content type for the request.
    bool? persistentConnection, // Flag for persistent connection.
  }) {
    int timeOut = 60 * 1000; // Timeout duration set to 60 seconds (1 minute).

    return BaseOptions(
      baseUrl: AppConstant.baseUrl, // Base URL for API requests.
      contentType: contentType ?? Headers.jsonContentType, // Default to JSON content type if not provided.
      responseType: responseType, // Set the expected response type.
      headers: headers, // Set custom headers.
      extra: extra, // Set extra options.
      queryParameters: queryParameters, // Set query parameters.
      persistentConnection: persistentConnection, // Set persistent connection flag.
      connectTimeout: Duration(seconds: timeOut), // Set connection timeout.
      receiveTimeout: Duration(seconds: timeOut), // Set receive timeout.
    );
  }
}
