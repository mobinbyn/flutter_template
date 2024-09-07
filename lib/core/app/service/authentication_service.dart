import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:dartz/dartz.dart';

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
  final NavigationService _navigationService;

  AuthenticationService(
    this._dio,
    this._secureStorage,
    this._navigationService,
  );

  @override
  Future<void> saveToken(String token) async {
    logger.d('Save token to secure storage');
    await _secureStorage.saveToken(token);
  }

  @override
  Future<String?> getToken() async {
    logger.d('Get token from secure storage');
    return await _secureStorage.getToken;
  }

  @override
  Future<void> clearToken() async {
    logger.d('Clear token from secure storage');
    await _secureStorage.clearToken();
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

  @override
  Future<Either<Failure, bool>> loginWithUsernameAndPassword(String username, String password, {bool isTokenPair = true}) async {
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
          if (isTokenPair) {
            _secureStorage.saveTokenPair((accessToken: token.accessToken, refreshToken: token.refreshToken!));
          } else {
            _secureStorage.saveToken(token.accessToken);
          }
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
  Future<Either<Failure, bool>> login() async {
    // TODO : implement login
    throw UnimplementedError();
  }

  @override
  Future<void> logout() async {
    logger.d('Start logout process');
    // Delete user secure storage
    await _secureStorage.clearAll();
    // Navigate to home screen
    _navigationService.navigateToReplacementAll('/');
  }
}
