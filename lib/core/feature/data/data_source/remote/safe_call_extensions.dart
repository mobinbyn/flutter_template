import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import '../../../../app/utility/logging_mixin.dart';
import '../error/dio_error_handler.dart';
import '../error/failure.dart';
import '../error/response_code.dart';
import 'request_type.dart';

extension DioExtensions on Dio {
  static Logger logger = Logger(printer: CustomPrinter('DioExtensions'));

  /// A method to perform a safe HTTP call using Dio, handling success and errors.
  ///
  /// Either a [mapper] for single object or a [listMapper] for a list must be provided.
  Future<Either<Failure, T>> safeCall<T>(
    String endPoint, {
    data,
    RequestType method = RequestType.GET, // HTTP method (GET, POST, etc.)
    T Function(Map<String, dynamic>)? mapper, // Mapper function for a single object
    T Function(List<dynamic>)? listMapper, // Mapper function for a list of objects
    Map<String, dynamic>? queryParameters, // Query parameters for the request
    CancelToken? cancelToken, // Token to cancel the request
    ProgressCallback? onSendProgress, // Callback for tracking upload progress
    ProgressCallback? onReceiveProgress, // Callback for tracking download progress
  }) async {
    // Ensure that either mapper or listMapper is provided
    assert((mapper != null) || (listMapper != null), 'Either mapper or listMapper must be provided');

    try {
      // Uncomment the following lines to check for internet connection
      // if (!await NetworkInfoService().isConnected()) {
      //   logger.d('Internet Connection Error');
      //   return Left(DioErrorHandler.noInternetConnection().failure);
      // }

      logger.d('${method.stringValue} request for $endPoint');

      // Perform the HTTP request
      Response response = await fetch(
        RequestOptions(
          baseUrl: options.baseUrl, // Base URL from Dio options
          contentType: options.contentType, // Content type from Dio options
          connectTimeout: options.connectTimeout, // Connection timeout
          receiveTimeout: options.receiveTimeout, // Receive timeout
          headers: options.headers, // Headers from Dio options
          method: method.stringValue, // HTTP method
          path: endPoint, // Endpoint path
          data: data, // Data to send in the request
          queryParameters: queryParameters, // Query parameters
          cancelToken: cancelToken, // Cancel token
          onSendProgress: onSendProgress, // Send progress callback
          onReceiveProgress: onReceiveProgress, // Receive progress callback
        ),
      );

      // Handle success response
      if (response.statusCode == ResponseCode.success) {
        logger.d('${method.stringValue} request success');
        if (mapper != null) {
          return Right(mapper(response.data)); // Use mapper for single object
        }
        return Right(listMapper!(response.data)); // Use listMapper for list of objects
      }

      // Handle error response
      logger.d('${method.stringValue} request failed');
      return Left(DioErrorHandler.handle(response.statusCode).failure);
    } catch (exception) {
      logger.e(exception.toString()); // Log the exception
      return Left(DioErrorHandler.handle(exception).failure); // Handle exception
    }
  }
}
