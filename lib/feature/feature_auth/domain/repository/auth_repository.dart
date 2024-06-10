import 'package:dartz/dartz.dart';

import '../../../../core/feature/data/data_source/error/failure.dart';
import '../entity/token_entity.dart';

abstract class AuthRepository {
  register();
  Future<Either<Failure, TokenEntity>> login();
  forgetPassword();

  Future<Either<Failure, TokenEntity>> updateToken(String refreshToken);
  Future<String?> readToken(String key);
  Future<void> writeToken(String key, String value);
  Future<void> logout();
}
