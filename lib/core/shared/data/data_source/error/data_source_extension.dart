import 'package:easy_localization/easy_localization.dart';

import 'response_code.dart';
import 'data_source_enum.dart';
import 'failure.dart';

extension DataSourceExtension on DataSource {
  Failure getFailure() {
    switch (this) {
      case DataSource.badRequest:
        return Failure(ResponseMessage.badRequest.tr());
      case DataSource.forbidden:
        return Failure(ResponseMessage.forbidden.tr());
      case DataSource.unauthorized:
        return Failure(ResponseMessage.unauthorized.tr());
      case DataSource.notFound:
        return Failure(ResponseMessage.notFound.tr());
      case DataSource.internalServerError:
        return Failure(ResponseMessage.internalServerError.tr());
      case DataSource.connectTimeout:
        return Failure(ResponseMessage.connectTimeout.tr());
      case DataSource.cancel:
        return Failure(ResponseMessage.cancel.tr());
      case DataSource.receiveTimeout:
        return Failure(ResponseMessage.receiveTimeout.tr());
      case DataSource.sendTimeout:
        return Failure(ResponseMessage.sendTimeout.tr());
      case DataSource.cacheError:
        return Failure(ResponseMessage.cacheError.tr());
      case DataSource.noInternetConnection:
        return Failure(ResponseMessage.noInternetConnection.tr());
      case DataSource.defaultError:
        return Failure(ResponseMessage.defaultError.tr());
      case DataSource.badCertificate:
        return Failure(ResponseMessage.badCertificate.tr());
      case DataSource.networkAuthenticationRequired:
        return Failure(ResponseMessage.networkAuthenticationRequired.tr());
      default:
        return Failure(ResponseMessage.defaultError.tr());
    }
  }
}
