import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../../app/service/authentication_service.dart';
import '../../../../app/service/interface/i_authentication_service.dart';

/// Exception thrown when the token is revoked.
class RevokeTokenException extends DioException {
  RevokeTokenException({required super.requestOptions});
}

/// Interceptor for handling authentication-related functionality with Dio.
class JwtInterceptor extends QueuedInterceptor {
  /// Creates an Auth interceptor.
  JwtInterceptor({
    required this.dio,
    required this.authenticationService,
    this.shouldClearBeforeReset = true,
  }) {
    // Initialize clients for refreshing tokens and retrying requests.
    refreshClient = Dio();
    refreshClient.options = BaseOptions(baseUrl: dio.options.baseUrl);

    retryClient = Dio();
    retryClient.options = BaseOptions(baseUrl: dio.options.baseUrl);
  }

  final Dio dio; // Main Dio instance for API requests.
  final bool shouldClearBeforeReset; // Flag to clear tokens before resetting.
  final AuthenticationService authenticationService; // Service for managing authentication.

  late final Dio refreshClient; // Dio instance for refreshing tokens.
  late final Dio retryClient; // Dio instance for retrying requests.

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    try {
      // Fetch the current token pair from the authentication service.
      final tokenPair = await authenticationService.getTokenPair();

      // If no token pair is available, continue with the request.
      if (tokenPair == null) {
        return handler.next(options);
      }

      // Check if the access token is valid.
      final isAccessTokenValid = await authenticationService.isAccessTokenValid();

      if (isAccessTokenValid) {
        // Add headers with the access token to the request.
        options.headers.addAll(await _buildHeaders());
        return handler.next(options); // Proceed with the request.
      } else {
        // If the access token is invalid, attempt to refresh it.
        final newTokenPair = await _refresh(
          options: options,
          tokenPair: tokenPair,
        );

        // If refreshing the token fails, reject the request.
        if (newTokenPair == null) {
          return handler.reject(
            RevokeTokenException(requestOptions: options),
            true,
          );
        }

        // Add headers with the new access token to the request.
        options.headers.addAll(await _buildHeaders());
        return handler.next(options); // Proceed with the request.
      }
    } catch (_) {
      // Handle any exceptions by rejecting the request.
      return handler.reject(
        RevokeTokenException(requestOptions: options),
        true,
      );
    }
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    // If the error is due to token revocation, handle session expiration logic.
    if (err is RevokeTokenException) {
      return handler.reject(err);
    }

    // Check if the response indicates a need to refresh the token.
    if (!shouldRefresh(err.response)) {
      return handler.next(err);
    }

    // Check if the access token is valid and retrieve the token pair.
    final isAccessValid = await authenticationService.isAccessTokenValid();
    final tokenPair = await authenticationService.getTokenPair();

    // If no token pair is available, reject the error.
    if (tokenPair == null) {
      return handler.reject(err);
    }

    try {
      // If the access token is still valid, retry the previous request.
      if (isAccessValid) {
        final previousRequest = await _retry(err.requestOptions);
        return handler.resolve(previousRequest);
      } else {
        // If the access token is invalid, refresh it and retry the request.
        await _refresh(options: err.requestOptions, tokenPair: tokenPair);
        final previousRequest = await _retry(err.requestOptions);
        return handler.resolve(previousRequest);
      }
    } on RevokeTokenException {
      // Handle session expiration logic in case of revocation.
      return handler.reject(err);
    } on DioException catch (err) {
      // If another Dio exception occurs, pass it along.
      return handler.next(err);
    }
  }

  /// Build headers for the request including the access token.
  Future<Map<String, dynamic>> _buildHeaders() async {
    final tokenPair = await authenticationService.getTokenPair();
    return {
      'Authorization': 'Bearer ${tokenPair!.accessToken}', // Set authorization header.
    };
  }

  /// Check if the token pair should be refreshed based on the response.
  @visibleForTesting
  @pragma('vm:prefer-inline')
  bool shouldRefresh<R>(Response<R>? response) => response?.statusCode == 401;

  /// Refresh the access and refresh tokens.
  Future<TokenPair?> _refresh({
    required RequestOptions options,
    TokenPair? tokenPair,
  }) async {
    if (tokenPair == null) {
      throw RevokeTokenException(requestOptions: options);
    }

    try {
      // Set headers for the refresh client request.
      refreshClient.options = refreshClient.options.copyWith(
        headers: {'refresh-Token': tokenPair.refreshToken},
      );

      // Send a request to refresh the tokens.
      final response = await refreshClient.post(
        '/endpoint-to-send-refresh-request',
      );

      // Extract the new tokens from the response.
      final TokenPair newTokenPair = (
        accessToken: response.data['accessToken'],
        refreshToken: response.data['refreshToken'],
      );

      // Clear the old tokens if needed before saving the new ones.
      if (shouldClearBeforeReset) {
        await authenticationService.clearTokenPair();
      }

      await authenticationService.saveTokenPair(newTokenPair);
      return newTokenPair; // Return the new token pair.
    } catch (_) {
      // Clear tokens on failure and throw an exception.
      await authenticationService.clearTokenPair();
      throw RevokeTokenException(requestOptions: options);
    }
  }

  /// Retry the request with the previous options.
  Future<Response<R>> _retry<R>(
    RequestOptions requestOptions,
  ) async {
    return retryClient.request<R>(
      requestOptions.path,
      cancelToken: requestOptions.cancelToken,
      data: requestOptions.data is FormData ? (requestOptions.data as FormData).clone() : requestOptions.data,
      onReceiveProgress: requestOptions.onReceiveProgress,
      onSendProgress: requestOptions.onSendProgress,
      queryParameters: requestOptions.queryParameters,
      options: Options(
        method: requestOptions.method,
        sendTimeout: requestOptions.sendTimeout,
        receiveTimeout: requestOptions.receiveTimeout,
        extra: requestOptions.extra,
        headers: requestOptions.headers..addAll(await _buildHeaders()), // Include updated headers.
        responseType: requestOptions.responseType,
        contentType: requestOptions.contentType,
        validateStatus: requestOptions.validateStatus,
        receiveDataWhenStatusError: requestOptions.receiveDataWhenStatusError,
        followRedirects: requestOptions.followRedirects,
        maxRedirects: requestOptions.maxRedirects,
        requestEncoder: requestOptions.requestEncoder,
        responseDecoder: requestOptions.responseDecoder,
        listFormat: requestOptions.listFormat,
      ),
    );
  }
}
