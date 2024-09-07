import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../../app/service/authentication_service.dart';
import '../../../../app/service/interface/i_authentication_service.dart';

class RevokeTokenException extends DioException {
  RevokeTokenException({required super.requestOptions});
}

class AuthInterceptor extends QueuedInterceptor {
  /// Create an Auth interceptor
  AuthInterceptor({
    required this.dio,
    required this.authenticationService,
    this.shouldClearBeforeReset = true,
  }) {
    refreshClient = Dio();
    refreshClient.options = BaseOptions(baseUrl: dio.options.baseUrl);

    retryClient = Dio();
    retryClient.options = BaseOptions(baseUrl: dio.options.baseUrl);
  }

  final Dio dio;
  final bool shouldClearBeforeReset;
  final AuthenticationService authenticationService;
  late final Dio refreshClient;
  late final Dio retryClient;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    try {
      final tokenPair = await authenticationService.getTokenPair();

      if (tokenPair == null) {
        return handler.next(options);
      }

      final isAccessTokenValid = await authenticationService.isAccessTokenValid();

      if (isAccessTokenValid) {
        options.headers.addAll(await _buildHeaders());
        return handler.next(options);
      } else {
        final newTokenPair = await _refresh(
          options: options,
          tokenPair: tokenPair,
        );

        if (newTokenPair == null) {
          return handler.reject(
            RevokeTokenException(requestOptions: options),
            true,
          );
        }

        options.headers.addAll(await _buildHeaders());
        return handler.next(options);
      }
    } catch (_) {
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
    if (err is RevokeTokenException) {
      /// call the session expire logic for your state management
      return handler.reject(err);
    }

    if (!shouldRefresh(err.response)) {
      return handler.next(err);
    }

    final isAccessValid = await authenticationService.isAccessTokenValid();
    final tokenPair = await authenticationService.getTokenPair();

    if (tokenPair == null) {
      return handler.reject(err);
    }

    try {
      if (isAccessValid) {
        final previousRequest = await _retry(err.requestOptions);
        return handler.resolve(previousRequest);
      } else {
        await _refresh(options: err.requestOptions, tokenPair: tokenPair);
        final previousRequest = await _retry(err.requestOptions);
        return handler.resolve(previousRequest);
      }
    } on RevokeTokenException {
      /// call the session expire logic for your state management
      return handler.reject(err);
    } on DioException catch (err) {
      return handler.next(err);
    }
  }

  Future<Map<String, dynamic>> _buildHeaders() async {
    final tokenPair = await authenticationService.getTokenPair();

    return {
      'Authorization': 'Bearer ${tokenPair!.accessToken}',
    };
  }

  /// Check if the token pair should be refreshed
  @visibleForTesting
  @pragma('vm:prefer-inline')
  bool shouldRefresh<R>(Response<R>? response) => response?.statusCode == 401;

  Future<TokenPair?> _refresh({
    required RequestOptions options,
    TokenPair? tokenPair,
  }) async {
    if (tokenPair == null) {
      throw RevokeTokenException(requestOptions: options);
    }

    try {
      refreshClient.options = refreshClient.options.copyWith(
        headers: {'refresh-Token': tokenPair.refreshToken},
      );

      /// it will be changed based on your project
      final response = await refreshClient.post(
        '/endpoint-to-send-refresh-request',
      );

      final TokenPair newTokenPair = (
        accessToken: response.data['accessToken'],
        refreshToken: response.data['refreshToken'],
      );

      if (shouldClearBeforeReset) {
        await authenticationService.clearTokenPair();
      }

      await authenticationService.saveTokenPair(newTokenPair);
      return newTokenPair;
    } catch (_) {
      await authenticationService.clearTokenPair();
      throw RevokeTokenException(requestOptions: options);
    }
  }

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
        headers: requestOptions.headers..addAll(await _buildHeaders()),
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
