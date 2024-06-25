import 'package:dartz/dartz.dart';
import '../../data/data_source/error/failure.dart';

abstract class UsecaseFailureLessNoParam<Type> {
  Future<Type> call();
}

abstract class UsecaseFailureLess<Type, Param> {
  Future<Type> call(Param param);
}

abstract class UsecaseNoParam<Type> {
  Future<Either<Failure, Type>> call();
}

abstract class Usecase<Type, Param> {
  Future<Either<Failure, Type>> call(Param param);
}

abstract class UsecaseTwoParams<Type, Param1, Param2> {
  Future<Either<Failure, Type>> call(Param1 param1, Param2 param2);
}

abstract class UsecaseThreeParams<Type, Param1, Param2, Param3> {
  Future<Either<Failure, Type>> call(Param1 param1, Param2 param2, Param3 param3);
}

abstract class UsecaseFourParams<Type, Param1, Param2, Param3, Param4> {
  Future<Either<Failure, Type>> call(Param1 param1, Param2 param2, Param3 param3, Param4 param4);
}
