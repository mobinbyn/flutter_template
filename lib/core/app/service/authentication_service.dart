import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_template/core/feature/data/data_source/local/app_preferences.dart';
import 'package:flutter_template/core/feature/presentation/bloc/auth/auth_bloc.dart';

import '../../feature/data/data_source/error/failure.dart';
import '../../feature/data/data_source/local/app_secure_storage.dart';
import '../../feature/data/data_source/remote/dio_wrapper.dart';
import '../../feature/data/data_source/remote/safe_call_extensions.dart';
import '../../feature/data/model/token_model.dart';
import '../utility/logging_mixin.dart';
import 'interface/i_authentication_service.dart';
import 'navigation_service.dart';

class AuthenticationService extends IAuthenticationService with LogMixin {
  final DioWrapper _dio;
  final AppSecureStorage _secureStorage;
  final AppPreferences _appPreferences;
  final NavigationService _navigationService;

  AuthenticationService(
    this._dio,
    this._secureStorage,
    this._appPreferences,
    this._navigationService,
  );

  @override
  Future<Either<Failure, AuthModel>> signUP(String username, String password) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, AuthModel>> signIn(String username, String password, {String nextRoute = '/home_screen'}) async {
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
          // Save token secure storage
          _secureStorage.saveTokenPair((accessToken: token.accessToken, refreshToken: token.refreshToken));
          // Navigate to home screen
          _navigationService.navigateToReplacementAll(nextRoute);

          return const Right(
            AuthModel(
              isAuthenticated: true,
              user: User(id: '1', name: 'admin'),
            ),
          );
        }
        return const Right(AuthModel(isAuthenticated: false));
      },
    );

    return const Right(AuthModel(isAuthenticated: false));
  }

  @override
  Future<void> signOut({String route = '/login_screen'}) async {
    logger.d('Start logout process');
    // Delete user secure storage
    await _secureStorage.clearAll();
    _appPreferences.setIsUserLoggedIn(false);
    // Navigate to home screen
    _navigationService.navigateToReplacementAll(route);
  }

  @override
  Future<bool> isSignedIn() async {
    return _appPreferences.isUserLoggedIn();
  }

  @override
  Future<void> updateIsSignedIn() async {
    _appPreferences.setIsUserLoggedIn(true);
  }

  @override
  Future<void> saveTokenPair(TokenPair tokenPair) async {
    logger.d('Save token pair to secure storage');
    await _secureStorage.saveTokenPair(tokenPair);
  }

  @override
  Future<TokenPair?> getTokenPair() async {
    logger.d('Get token pair from secure storage');
    return await _secureStorage.getTokenPair();
  }

  @override
  Future<void> clearTokenPair() async {
    logger.d('Clear token pair from secure storage');
    await _secureStorage.clearTokenPair();
  }

  /// [marginOfErrorInMilliseconds] can be changed.
  /// It is an error value to ensure that when the request is sent,
  /// it will not be expired.
  @override
  Future<bool> isAccessTokenValid() async {
    logger.d('Check if token is valid');
    final tokenPair = await _secureStorage.getTokenPair();

    if (tokenPair == null) {
      return false;
    }

    final decodedJwt = JWT.decode(tokenPair.accessToken);
    final expirationTimeEpoch = decodedJwt.payload['exp'];
    final expirationDateTime = DateTime.fromMillisecondsSinceEpoch(expirationTimeEpoch * 1000);

    const marginOfErrorInMilliseconds = 1000;
    const addedMarginTime = Duration(milliseconds: marginOfErrorInMilliseconds);

    return DateTime.now().add(addedMarginTime).isBefore(expirationDateTime);
  }
}
