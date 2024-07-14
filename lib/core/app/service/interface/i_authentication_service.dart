import 'package:dartz/dartz.dart';
import 'package:flutter_template/core/feature/data/data_source/error/failure.dart';

abstract class IAuthenticationService {
  Future<void> persistToken(String token, String refreshToken);

  Future<Either<Failure, bool>> login(String email, String password);

  Future<void> logout();

  Future<String?> getToken();

  Future<String?> getRefreshToken();

  Future<bool> isAuthenticated();
}
