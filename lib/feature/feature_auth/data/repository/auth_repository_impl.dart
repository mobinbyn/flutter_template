import 'package:dartz/dartz.dart';

import '../../../../core/app/di/index.dart';
import '../../../../core/feature/data/data_source/error/failure.dart';
import '../../../../core/feature/data/data_source/remote/safe_call_extensions.dart';
import '../../domain/entity/token_entity.dart';
import '../model/token_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AppSecureStorage _secureStorage;
  final DioWrapper _dio;

  AuthRepositoryImpl(this._secureStorage, this._dio);

  @override
  Future<Either<Failure, TokenEntity>> login() async {
    return await _dio.getDio().safePost('endPoint', TokenModel.fromMap);
  }

  @override
  forgetPassword() {
    // TODO: implement forgetPassword
    throw UnimplementedError();
  }

  @override
  register() {
    // TODO: implement register
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, TokenEntity>> updateToken(String refreshToken) {
    // TODO: implement updateToken
    throw UnimplementedError();
  }

  @override
  Future<String?> readToken(String key) {
    switch (key) {
      case AppSecureStorage.secureStorageKeyToken:
        return _secureStorage.getUserToken();
      case AppSecureStorage.secureStorageKeyRefreshToken:
        return _secureStorage.getUserRefreshToken();
      default:
        return Future.value(null);
    }
  }

  @override
  Future<void> writeToken(String key, String value) {
    switch (key) {
      case AppSecureStorage.secureStorageKeyToken:
        return _secureStorage.setUserToken(value);
      case AppSecureStorage.secureStorageKeyRefreshToken:
        return _secureStorage.setUserRefreshToken(value);
      default:
        return Future.value(null);
    }
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }
}
