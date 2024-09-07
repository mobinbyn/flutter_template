import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import '../../../../app/utility/logging_mixin.dart';
import '../error/dio_error_handler.dart';
import '../error/failure.dart';
import '../error/response_code.dart';
import 'network_check.dart';
import 'request_type.dart';

extension DioExtensions on Dio {
  static Logger logger = Logger(printer: CustomPrinter('DioExtensions'));

  /// Either mapper or listMapper must be provided
  Future<Either<Failure, T>> safeCall<T>(
    String endPoint, {
    data,
    RequestType method = RequestType.GET,
    T Function(Map<String, dynamic>)? mapper,
    T Function(List<dynamic>)? listMapper,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    assert((mapper != null) || (listMapper != null), 'Either mapper or listMapper must be provided');
    try {
      // Check Internet Connection
      if (!await NetworkCheck.instance.isNetworkAvailable()) {
        // Handle network not available case, you can throw an exception or return an error response.
        logger.d('Internet Connection Error');
        return Left(DioErrorHandler.noInternetConnection().failure);
      }

      logger.d('${method.stringValue} request for $endPoint');
      Response response = await fetch(
        RequestOptions(
          baseUrl: options.baseUrl,
          contentType: options.contentType,
          connectTimeout: options.connectTimeout,
          receiveTimeout: options.receiveTimeout,
          headers: options.headers,
          method: method.stringValue,
          path: endPoint,
          data: data,
          queryParameters: queryParameters,
          cancelToken: cancelToken,
          onSendProgress: onSendProgress,
          onReceiveProgress: onReceiveProgress,
        ),
      );

      // Handle success
      if (response.statusCode == ResponseCode.success) {
        logger.d('${method.stringValue} request success');
        if (mapper != null) {
          return Right(mapper(response.data));
        }
        return Right(listMapper!(response.data));
      }

      // Handle error
      logger.d('${method.stringValue} request failed');
      return Left(DioErrorHandler.handle(response.statusCode).failure);
    } catch (exception) {
      logger.e(exception.toString());
      return Left(DioErrorHandler.handle(exception).failure);
    }
  }
}
