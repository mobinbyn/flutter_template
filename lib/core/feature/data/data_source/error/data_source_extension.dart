import 'package:easy_localization/easy_localization.dart';

import 'response_code.dart';
import 'data_source_enum.dart';
import 'failure.dart';

extension DataSourceExtension on DataSource {
  Failure getFailure() {
    switch (this) {
      case DataSource.badRequest:
        return Failure(ResponseCode.badRequest, ResponseMessage.badRequest.tr());
      case DataSource.forbidden:
        return Failure(ResponseCode.forbidden, ResponseMessage.forbidden.tr());
      case DataSource.unauthorized:
        return Failure(ResponseCode.unauthorized, ResponseMessage.unauthorized.tr());
      case DataSource.notFound:
        return Failure(ResponseCode.notFound, ResponseMessage.notFound.tr());
      case DataSource.internalServerError:
        return Failure(ResponseCode.internalServerError, ResponseMessage.internalServerError.tr());
      case DataSource.connectTimeout:
        return Failure(ResponseCode.connectTimeout, ResponseMessage.connectTimeout.tr());
      case DataSource.cancel:
        return Failure(ResponseCode.cancel, ResponseMessage.cancel.tr());
      case DataSource.receiveTimeout:
        return Failure(ResponseCode.receiveTimeout, ResponseMessage.receiveTimeout.tr());
      case DataSource.sendTimeout:
        return Failure(ResponseCode.sendTimeout, ResponseMessage.sendTimeout.tr());
      case DataSource.cacheError:
        return Failure(ResponseCode.cacheError, ResponseMessage.cacheError.tr());
      case DataSource.noInternetConnection:
        return Failure(ResponseCode.noInternetConnection, ResponseMessage.noInternetConnection.tr());
      case DataSource.defaultError:
        return Failure(ResponseCode.defaultError, ResponseMessage.defaultError.tr());
      case DataSource.badCertificate:
        return Failure(ResponseCode.badCertificate, ResponseMessage.badCertificate.tr());
      case DataSource.networkAuthenticationRequired:
        return Failure(ResponseCode.networkAuthenticationRequired, ResponseMessage.networkAuthenticationRequired.tr());
      default:
        return Failure(ResponseCode.defaultError, ResponseMessage.defaultError.tr());
    }
  }
}
