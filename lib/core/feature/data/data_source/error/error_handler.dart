import 'package:dio/dio.dart';
import 'data_source_enum.dart';
import 'data_source_extension.dart';
import 'response_code.dart';

import 'failure.dart';

class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      // Dio error so its error from response of the API
      failure = _handleError(error);
    } else if (error is ErrorHandler) {
      failure = error.failure.code == ResponseCode.noInternetConnection
          ? failure
          : DataSource.defaultError.getFailure();
    } else {
      failure = DataSource.defaultError.getFailure();
    }
  }

  ErrorHandler.noInternetConnection() {
    failure = DataSource.noInternetConnection.getFailure();
  }

  Failure _handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.connectionError:
        return DataSource.connectTimeout.getFailure();
      case DioExceptionType.sendTimeout:
        return DataSource.sendTimeout.getFailure();
      case DioExceptionType.receiveTimeout:
        return DataSource.receiveTimeout.getFailure();
      case DioExceptionType.badResponse:
        // When response code exist
        switch (error.response?.statusCode) {
          case ResponseCode.badRequest:
            return DataSource.badRequest.getFailure();
          case ResponseCode.forbidden:
            return DataSource.forbidden.getFailure();
          case ResponseCode.unauthorized:
            return DataSource.unauthorized.getFailure();
          case ResponseCode.notFound:
            return DataSource.notFound.getFailure();
          case ResponseCode.internalServerError:
            return DataSource.internalServerError.getFailure();
        }
        return DataSource.defaultError.getFailure();
      case DioExceptionType.cancel:
        return DataSource.cancel.getFailure();
      case DioExceptionType.badCertificate:
        return DataSource.badCertificate.getFailure();
      case DioExceptionType.unknown:
        if (error.error == DataSource.noInternetConnection) {
          return DataSource.noInternetConnection.getFailure();
        }
        return DataSource.defaultError.getFailure();
    }
  }
}
