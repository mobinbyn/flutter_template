import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_template/core/app/res/const/app_constant.dart';
import 'package:flutter_template/core/app/service/interface/i_user_cache_service.dart';
import 'package:flutter_template/core/shared/data/data_source/error/failure.dart';
import 'package:flutter_template/core/shared/data/data_source/local/interface/storage_service.dart';
import 'package:flutter_template/core/shared/data/model/user_model.dart';

class UserCacheService implements IUserCacheService {
  UserCacheService(this.storageService);

  final StorageService storageService;

  @override
  String get storageKey => AppConstant.userLocalStorageKey;

  @override
  Future<Either<Failure, User>> fetchUser() async {
    final data = await storageService.get(storageKey);
    if (data == null) {
      return const Left(CacheFailure());
    }
    final userJson = jsonDecode(data.toString());

    return Right(User.fromJson(userJson));
  }

  @override
  Future<bool> saveUser({required User user}) async {
    return await storageService.set(storageKey, jsonEncode(user.toJson()));
  }

  @override
  Future<bool> deleteUser() async {
    return await storageService.remove(storageKey);
  }

  @override
  Future<bool> hasUser() async {
    return await storageService.has(storageKey);
  }
}
