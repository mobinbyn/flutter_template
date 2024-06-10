import '../../../../app/res/strings/app_strings.dart';

class ResponseCode {
  /// API status codes
  // success with data
  static const int success = 200;
  // success with no content
  static const int created = 201;
  // failure, api rejected the request
  static const int badRequest = 400;
  // failure, api rejected the request
  static const int forbidden = 403;
  // failure user is not authorized
  static const int unauthorized = 401;
  // failure, api url is not correct and not found
  static const int notFound = 404;
  // failure, crash happened in server side
  static const int internalServerError = 500;
  // failure authentication required
  static const int networkAuthenticationRequired = 511;
  static const int badCertificate = 495;

  /// local status code
  static const int defaultError = -1;
  static const int connectTimeout = -2;
  static const int cancel = -3;
  static const int receiveTimeout = -4;
  static const int sendTimeout = -5;
  static const int cacheError = -6;
  static const int noInternetConnection = -7;
}

class ResponseMessage {
  /// API response codes
  // success with data
  static const String success = AppStrings.success;
  // success with no content
  static const String noContent = AppStrings.noContent;
  // failure, api rejected our request
  static const String badRequest = AppStrings.badRequestError;
  // failure,  api rejected our request
  static const String forbidden = AppStrings.forbiddenError;
  // failure, user is not authorized
  static const String unauthorized = AppStrings.unauthorizedError;
  // failure, API url is not correct and not found in api side.
  static const String notFound = AppStrings.notFoundError;
  // failure, a crash happened in API side.
  static const String internalServerError = AppStrings.internalServerError;

  /// local responses codes
  // unknown error happened
  static const String defaultError = AppStrings.defaultError;
  // issue in connectivity
  static const String connectTimeout = AppStrings.timeoutError;
  // API request was cancel
  static const String cancel = AppStrings.defaultError;
  //  issue in connectivity
  static const String receiveTimeout = AppStrings.timeoutError;
  //  issue in connectivity
  static const String sendTimeout = AppStrings.timeoutError;
  //  issue in getting data from local data source (cache)
  static const String cacheError = AppStrings.defaultError;
  // issue in connectivity
  static const String noInternetConnection = AppStrings.noInternetError;
  // issue in authentication
  static const String networkAuthenticationRequired =
      AppStrings.networkAuthenticationRequired;
  // issue in certificate
  static const String badCertificate = AppStrings.badCertificate;
}
