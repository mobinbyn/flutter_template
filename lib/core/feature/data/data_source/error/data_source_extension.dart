import 'response_code.dart';
import 'data_source_enum.dart';
import 'failure.dart';

extension DataSourceExtension on DataSource {
  Failure getFailure() {
    switch (this) {
      case DataSource.badRequest:
        return const Failure(
            ResponseCode.badRequest, ResponseMessage.badRequest);
      case DataSource.forbidden:
        return const Failure(ResponseCode.forbidden, ResponseMessage.forbidden);
      case DataSource.unauthorized:
        return const Failure(
            ResponseCode.unauthorized, ResponseMessage.unauthorized);
      case DataSource.notFound:
        return const Failure(ResponseCode.notFound, ResponseMessage.notFound);
      case DataSource.internalServerError:
        return const Failure(ResponseCode.internalServerError,
            ResponseMessage.internalServerError);
      case DataSource.connectTimeout:
        return const Failure(
            ResponseCode.connectTimeout, ResponseMessage.connectTimeout);
      case DataSource.cancel:
        return const Failure(ResponseCode.cancel, ResponseMessage.cancel);
      case DataSource.receiveTimeout:
        return const Failure(
            ResponseCode.receiveTimeout, ResponseMessage.receiveTimeout);
      case DataSource.sendTimeout:
        return const Failure(
            ResponseCode.sendTimeout, ResponseMessage.sendTimeout);
      case DataSource.cacheError:
        return const Failure(
            ResponseCode.cacheError, ResponseMessage.cacheError);
      case DataSource.noInternetConnection:
        return const Failure(ResponseCode.noInternetConnection,
            ResponseMessage.noInternetConnection);
      case DataSource.defaultError:
        return const Failure(
            ResponseCode.defaultError, ResponseMessage.defaultError);
      case DataSource.badCertificate:
        return const Failure(
            ResponseCode.badCertificate, ResponseMessage.badCertificate);
      case DataSource.networkAuthenticationRequired:
        return const Failure(ResponseCode.networkAuthenticationRequired,
            ResponseMessage.networkAuthenticationRequired);
      default:
        return const Failure(
            ResponseCode.defaultError, ResponseMessage.defaultError);
    }
  }
}
