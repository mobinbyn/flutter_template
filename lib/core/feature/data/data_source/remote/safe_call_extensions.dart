import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../error/error_handler.dart';
import '../error/failure.dart';
import '../error/response_code.dart';
import 'network_check.dart';

extension DioExtensions on Dio {
  Future<Either<Failure, T>> safePost<T>(
    String endPoint,
    T Function(Map<String, dynamic>) mapper, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      // Check Internet Connection
      if (!await NetworkCheck.instance.isNetworkAvailable()) {
        // Handle network not available case, you can throw an exception or return an error response.
        // logger.d('Internet Connection Error');
        return Left(ErrorHandler.noInternetConnection().failure);
      }

      // logger.d('POST request for $endPoint');
      Response response = await post(
        endPoint,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      if (response.statusCode == ResponseCode.success) {
        return Right(mapper(response.data));
      }
      return Left(ErrorHandler.handle(response.statusCode).failure);
    } catch (exception) {
      // logger.e(exception.toString());
      return Left(ErrorHandler.handle(exception).failure);
    }
  }

  Future<Either<Failure, T>> safeGet<T>(
    String endPoint,
    T Function(Map<String, dynamic>) mapper, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      // Check Internet Connection
      if (!await NetworkCheck.instance.isNetworkAvailable()) {
        // Handle network not available case, you can throw an exception or return an error response.
        // logger.d('Internet Connection Error');
        return Left(ErrorHandler.noInternetConnection().failure);
      }

      // logger.d('GET request for $endPoint');
      Response response = await get(
        endPoint,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );

      if (response.statusCode == ResponseCode.success) {
        return Right(mapper(response.data));
      }
      return Left(ErrorHandler.handle(response.statusCode).failure);
    } catch (exception) {
      // logger.e(exception.toString());
      return Left(ErrorHandler.handle(exception).failure);
    }
  }

  Future<Either<Failure, T>> safeDelete<T>(
    String endPoint,
    T Function(Map<String, dynamic>) mapper, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      // Check Internet Connection
      if (!await NetworkCheck.instance.isNetworkAvailable()) {
        // Handle network not available case, you can throw an exception or return an error response.
        // logger.d('Internet Connection Error');
        return Left(ErrorHandler.noInternetConnection().failure);
      }

      // logger.d('DELETE request for $endPoint');
      Response response = await delete(
        endPoint,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );

      if (response.statusCode == ResponseCode.success) {
        return Right(mapper(response.data));
      }
      return Left(ErrorHandler.handle(response.statusCode).failure);
    } catch (exception) {
      // logger.e(exception.toString());
      return Left(ErrorHandler.handle(exception).failure);
    }
  }

  Future<Either<Failure, T>> safePut<T>(
    String endPoint,
    T Function(Map<String, dynamic>) mapper, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      // Check Internet Connection
      if (!await NetworkCheck.instance.isNetworkAvailable()) {
        // Handle network not available case, you can throw an exception or return an error response.
        // logger.d('Internet Connection Error');
        return Left(ErrorHandler.noInternetConnection().failure);
      }

      // logger.d('PUT request for $endPoint');
      Response response = await put(
        endPoint,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      if (response.statusCode == ResponseCode.success) {
        return Right(mapper(response.data));
      }
      return Left(ErrorHandler.handle(response.statusCode).failure);
    } catch (exception) {
      // logger.e(exception.toString());
      return Left(ErrorHandler.handle(exception).failure);
    }
  }
}
