// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:flutter_template/core/app/service/interface/i_authentication_service.dart';
import 'package:flutter_template/core/app/utility/logging_mixin.dart';

import '../../feature/data/model/token_model.dart';
import '../../feature/data/data_source/error/failure.dart';
import '../../feature/data/data_source/local/app_secure_storage.dart';
import '../../feature/data/data_source/remote/dio_wrapper.dart';
import '../../feature/data/data_source/remote/safe_call_extensions.dart';
import 'navigation_service.dart';

class AuthenticationService extends IAuthenticationService with LogMixin {
  final DioWrapper _dio;
  final AppSecureStorage _secureStorage;
  final NavigationService _navigationService;

  AuthenticationService(
    this._dio,
    this._secureStorage,
    this._navigationService,
  );

  @override
  Future<Either<Failure, bool>> login(String email, String password) async {
    var result = await _dio.getDio().safeCall(
          'sign_in.php',
          mapper: TokenModel.fromMap,
        );
    result.fold(
      (failure) {
        return Left(failure);
      },
      (token) {
        // Check if token is not empty
        if (token.accessToken.isNotEmpty) {
          // Save user secure storage
          _secureStorage.persistEmailAndToken(email, token.accessToken, token.refreshToken);
          // Navigate to home screen
          _navigationService.navigateToReplacementAll('/home_screen');
          return const Right(true);
        }
        return const Right(false);
      },
    );

    return const Right(false);
  }

  @override
  Future<void> persistToken(String token, String refreshToken) async {
    logger.d('Persist token to secure storage');
    // Get Email
    String? email = await _secureStorage.getEmail();
    // Save user secure storage
    await _secureStorage.persistEmailAndToken(email!, token, refreshToken);
  }

  @override
  Future<bool> isAuthenticated() async {
    logger.d('Check if user is authenticated');
    return await _secureStorage.hasToken();
  }

  @override
  Future<String?> getToken() async {
    logger.d('Get token from secure storage');
    return await _secureStorage.getToken();
  }

  @override
  Future<String?> getRefreshToken() {
    logger.d('Get refresh token from secure storage');
    return _secureStorage.getRefreshToken();
  }

  @override
  Future<void> logout() async {
    logger.d('Start logout process');
    // Delete user secure storage
    await _secureStorage.deleteAll();
    // Navigate to home screen
    _navigationService.navigateToReplacementAll('/');
  }
}
