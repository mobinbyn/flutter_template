import 'package:dio/dio.dart';
import 'data_source_enum.dart';
import 'data_source_extension.dart';
import 'response_code.dart';

import 'failure.dart';

class DioErrorHandler implements Exception {
  late Failure failure;

  DioErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      // Dio error so its error from response of the API
      failure = _handleError(error);
    } else {
      failure = DataSource.defaultError.getFailure();
    }
  }

  // DioErrorHandler.noInternetConnection() {
  //   failure = DataSource.noInternetConnection.getFailure();
  // }

  Failure _handleError(DioException error) {
    switch (error.type) {
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
          case ResponseCode.networkAuthenticationRequired:
            return DataSource.networkAuthenticationRequired.getFailure();
        }
        return DataSource.defaultError.getFailure();
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.connectionError:
        return DataSource.connectTimeout.getFailure();
      case DioExceptionType.sendTimeout:
        return DataSource.sendTimeout.getFailure();
      case DioExceptionType.receiveTimeout:
        return DataSource.receiveTimeout.getFailure();
      case DioExceptionType.cancel:
        return DataSource.cancel.getFailure();
      case DioExceptionType.badCertificate:
        return DataSource.badCertificate.getFailure();
      case DioExceptionType.unknown:
        return DataSource.defaultError.getFailure();
    }
  }
}
