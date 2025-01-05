import 'package:dartz/dartz.dart';
import 'package:flutter_template/core/shared/data/data_source/error/failure.dart';
import 'package:flutter_template/core/shared/data/model/user_model.dart';

abstract class IUserCacheService {
  String get storageKey;

  Future<Either<Failure, User>> fetchUser();
  Future<bool> saveUser({required User user});
  Future<bool> deleteUser();
  Future<bool> hasUser();
}
