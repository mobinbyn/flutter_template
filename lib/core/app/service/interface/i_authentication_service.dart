import 'package:dartz/dartz.dart';
import 'package:flutter_template/core/feature/data/data_source/error/failure.dart';

typedef TokenPair = ({String accessToken, String refreshToken});

abstract class IAuthenticationService {
  /// *Only Token
  /// Write token to secure storage
  Future<void> saveToken(String token);

  /// Read token from secure storage
  Future<String?> getToken();

  /// Clear token from secure storage
  Future<void> clearToken();

  /// *Token Pair (Token and Refresh Token)
  /// Write token pair to secure storage
  Future<void> saveTokenPair(TokenPair tokenPair);

  /// Read token pair from secure storage
  Future<TokenPair?> getTokenPair();

  /// Clear token pair from secure storage
  Future<void> clearTokenPair();

  /// Check if access token is valid
  Future<bool> isAccessTokenValid();

  /// *Login - Logout - Register
  /// Login with email and password
  Future<Either<Failure, bool>> loginWithUsernameAndPassword(String username, String password);

  /// Login with other services
  Future<Either<Failure, bool>> login();

  /// Logout
  Future<void> logout();
}
