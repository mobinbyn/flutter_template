import 'package:dartz/dartz.dart';
import 'package:flutter_template/core/feature/data/data_source/error/failure.dart';

abstract class Usecase<Type, Param> {
  Future<Either<Failure, Type>> call(Param param);
}

abstract class UsecaseTwoParams<Type, Param1, Param2> {
  Future<Either<Failure, Type>> call(Param1 param1, Param2 param2);
}

abstract class UsecaseThreeParams<Type, Param1, Param2, Param3> {
  Future<Either<Failure, Type>> call(
      Param1 param1, Param2 param2, Param3 param3);
}
