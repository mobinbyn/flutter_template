import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../feature/feature_auth/data/model/token_model.dart';
import '../../../../../feature/feature_auth/domain/entity/token_entity.dart';
import '../../../../app/di/index.dart';
import '../../../../app/di/injector.dart';
import '../error/failure.dart';
import '../error/response_code.dart';

class RefreshTokenInterceptor extends Interceptor {
  static const String _authorization = 'authorization';
  static const String _authorizationType = 'Bearer';

  static const String _errorKey = 'err';
  static const String _handlerKey = 'handler';

  final AuthRepository _authRepository;

  // A queue for failed requests and a flag to track the refresh status.
  List<Map<String, dynamic>> failedRequests = [];
  bool isRefreshing = false;

  RefreshTokenInterceptor(this._authRepository);

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // Read token from secure storage
    String token = await _authRepository
            .readToken(AppSecureStorage.secureStorageKeyToken) ??
        '';
    // Add the access token to the request header
    options.headers
        .addEntries({_authorization: '$_authorizationType $token'}.entries);

    super.onRequest(options, handler);
  }

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == ResponseCode.unauthorized) {
      // If refresh token is not available, perform logout
      if ((await _authRepository
                  .readToken(AppSecureStorage.secureStorageKeyRefreshToken) ??
              '')
          .isEmpty) {
        // ... (Logout logic)
        return handler.reject(err);
      }
      if (!isRefreshing) {
        // Initiating token refresh
        isRefreshing = true;
        final refreshTokenResponse = await _refreshToken(err, handler);
        refreshTokenResponse.fold(
          (failure) {
            // If the refresh process fails, reject with the previous error
            if (failure.code == ResponseCode.networkAuthenticationRequired) {}
            // ... (Logout logic)
            return handler.next(err);
          },
          (tokenEntity) async {
            // ... (Update headers and retry logic)
            err.requestOptions.headers[_authorization] =
                '$_authorizationType ${await _authRepository.readToken(AppSecureStorage.secureStorageKeyToken)}';
          },
        );
      } else {
        // Adding errored request to the queue
        failedRequests.add({_errorKey: err, _handlerKey: handler});
      }
    } else {
      return handler.next(err);
    }
  }

  Future<Either<Failure, TokenEntity>> _refreshToken(
      DioException err, ErrorInterceptorHandler handler) async {
    Dio retryDio = locator<DioWrapper>().getDio();
    // Read token from secure storage
    TokenModel tokenModel = TokenModel(
      accessToken: await (_authRepository
              .readToken(AppSecureStorage.secureStorageKeyToken)) ??
          '',
      refreshToken: await (_authRepository
              .readToken(AppSecureStorage.secureStorageKeyRefreshToken)) ??
          '',
    );
    // handle refresh token
    var response = await retryDio.post(
      AppConstant.getRefreshToken,
      data: tokenModel.toMap(),
    );

    // If the refresh process fails, reject with the previous error
    if (response.statusCode == ResponseCode.success) {
      TokenEntity tokenEntity = TokenModel.fromMap(response.data);
      //save new refresh token and access token
      // Set token in the app secure storage
      _authRepository.writeToken(
          AppSecureStorage.secureStorageKeyToken, tokenEntity.accessToken);
      // Set refresh token in the app secure storage
      _authRepository.writeToken(AppSecureStorage.secureStorageKeyRefreshToken,
          tokenEntity.refreshToken);

      failedRequests.add({_errorKey: err, _handlerKey: handler});
      await _retryRequests(tokenEntity.accessToken);
      return Right(tokenEntity);
    } else {
      return const Left(Failure(ResponseCode.networkAuthenticationRequired,
          'networkAuthenticationRequired'));
    }
  }

  Future<void> _retryRequests(token) async {
    // Create a Dio instance for retrying requests
    Dio retryDio = locator<DioWrapper>().getDio(hasToken: true);
    // Iterate through failed requests and retry them
    for (var i = 0; i < failedRequests.length; i++) {
      // Get the RequestOptions from the failed request
      RequestOptions requestOptions =
          failedRequests[i][_errorKey].requestOptions as RequestOptions;

      // Update headers with the new access token
      requestOptions.headers = {
        RefreshTokenInterceptor._authorization: '$_authorizationType $token',
      };

      // Retry the request using the new token
      await retryDio.fetch(requestOptions).then(
        failedRequests[i][_handlerKey].resolve,
        onError: (error) async {
          // Reject the request if an error occurs during retry
          failedRequests[i][_handlerKey].reject(error as DioException);
        },
      );
    }
    // Reset the refreshing state and clear the failed requests queue
    isRefreshing = false;
    failedRequests = [];
  }
}
