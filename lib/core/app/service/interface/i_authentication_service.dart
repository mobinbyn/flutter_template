import 'package:dartz/dartz.dart';
import 'package:flutter_template/core/shared/data/data_source/error/failure.dart';
import 'package:flutter_template/core/shared/presentation/bloc/auth/auth_bloc.dart';

typedef TokenPair = ({String accessToken, String? refreshToken});

abstract class IAuthenticationService {
  Future<Either<Failure, AuthModel>> signIn(String username, String password);
  Future<Either<Failure, AuthModel>> signUP(String username, String password);
  Future<void> signOut();

  Future<bool> isSignedIn();
  Future<void> updateIsSignedIn();

  /// *Token Pair (Token and Refresh Token)
  /// Write token pair to secure storage
  Future<void> saveTokenPair(TokenPair tokenPair);

  /// Read token pair from secure storage
  Future<TokenPair?> getTokenPair();

  /// Clear token pair from secure storage
  Future<void> clearTokenPair();

  /// Check if access token is valid
  Future<bool> isAccessTokenValid();
}
