// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter_template/core/app/service/interface/i_authentication_service.dart';

// import '../../../../app/di/injector_index.dart';
// import '../../../../app/res/const/app_constant.dart';
// import '../../../../app/service/authentication_service.dart';
// import '../../model/token_model.dart';
// import '../error/failure.dart';
// import '../error/response_code.dart';
// import 'dio_wrapper.dart';
// import 'safe_call_extensions.dart';

// class TokenInterceptor extends Interceptor {
//   static const String _authorization = 'authorization';
//   static const String _authorizationType = 'Bearer';

//   static const String _errorKey = 'err';
//   static const String _handlerKey = 'handler';

//   final AuthenticationService _authenticationService;

//   // A queue for failed requests and a flag to track the refresh status.
//   List<Map<String, dynamic>> failedRequests = [];
//   bool isRefreshing = false;

//   TokenInterceptor(this._authenticationService);

//   @override
//   Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
//     // Read token from secure storage
//     if (await _authenticationService.isAuthenticated()) {
//       String token = await _authenticationService.getToken() as String;
//       // Add the access token to the request header
//       options.headers.addEntries({_authorization: '$_authorizationType $token'}.entries);
//     } else {
//       // If refresh token is not available, perform logout
//       await _authenticationService.logout();
//     }

//     super.onRequest(options, handler);
//   }

//   @override
//   Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
//     // If the error is due to unauthorized, initiate token refresh
//     if (err.response?.statusCode == ResponseCode.unauthorized) {
//       // If refresh token is not available, perform logout
//       if (!await _authenticationService.isAuthenticated()) {
//         await _authenticationService.logout();
//         return handler.reject(err);
//       }
//       if (!isRefreshing) {
//         // Initiating token refresh
//         isRefreshing = true;
//         await _refreshToken(err, handler);
//       } else {
//         // Adding errored request to the queue
//         failedRequests.add({_errorKey: err, _handlerKey: handler});
//       }
//     } else {
//       // If the error is not due to unauthorized, reject with this handler
//       return handler.next(err);
//     }
//   }

//   Future<void> _refreshToken(DioException err, ErrorInterceptorHandler handler) async {
//     Dio retryDio = locator<DioWrapper>().getDio();
//     // Read token from secure storage
//     var tokenPair = await _authenticationService.getTokenPair();
//     if (await _authenticationService.isAccessTokenValid()) {
//       TokenModel tokenModel = TokenModel(
//         accessToken: tokenPair.accessToken,
//         refreshToken: tokenPair.refreshToken,
//       );
//     }
//     // handle refresh token
//     var response = await retryDio.safeCall(
//       AppConstant.getRefreshToken,
//       data: tokenModel.toMap(),
//       mapper: TokenModel.fromMap,
//     );

//     response.fold(
//       (failure) {
//         // If the refresh process fails, reject with the previous error
//         return const Left(Failure(ResponseCode.networkAuthenticationRequired, 'networkAuthenticationRequired'));
//       },
//       (token) async {
//         //save new refresh token and access token
//         _authenticationService.saveTokenPair((accessToken: token.accessToken, refreshToken: token.refreshToken!));

//         failedRequests.add({_errorKey: err, _handlerKey: handler});
//         // Update headers and retry logic
//         await _retryRequests(token.accessToken);
//         return Right(token);
//       },
//     );
//   }

//   Future<void> _retryRequests(token) async {
//     // Create a Dio instance for retrying requests
//     Dio retryDio = locator<DioWrapper>().getDio(hasToken: true);
//     // Iterate through failed requests and retry them
//     for (var i = 0; i < failedRequests.length; i++) {
//       // Get the RequestOptions from the failed request
//       RequestOptions requestOptions = failedRequests[i][_errorKey].requestOptions as RequestOptions;

//       // Update headers with the new access token
//       requestOptions.headers = {_authorization: '$_authorizationType $token'};

//       // Retry the request using the new token
//       await retryDio.fetch(requestOptions).then(
//         failedRequests[i][_handlerKey].resolve,
//         onError: (error) async {
//           // Reject the request if an error occurs during retry
//           failedRequests[i][_handlerKey].reject(error as DioException);
//         },
//       );
//     }
//     // Reset the refreshing state and clear the failed requests queue
//     isRefreshing = false;
//     failedRequests = [];
//   }
// }
