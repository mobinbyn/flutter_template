import 'package:dartz/dartz.dart';
import '../../data/data_source/error/failure.dart';

/// Abstract class representing a use case with no parameters and no failure handling.
/// It returns a Future of a generic type [Type].
abstract class SimpleUsecaseNoParam<Type> {
  Future<Type> call();
}

/// Abstract class representing a use case with one parameter and no failure handling.
/// It takes a single parameter [Param] and returns a Future of a generic type [Type].
abstract class SimpleUsecase<Type, Param> {
  Future<Type> call(Param param);
}

/// Abstract class for a use case that returns a result wrapped in an [Either] to handle failures.
/// This use case takes no parameters and returns either a [Failure] or the result of type [Type].
abstract class UsecaseResultNoParam<Type> {
  Future<Either<Failure, Type>> call();
}

/// Abstract class for a use case that takes a single parameter [Param] and handles failures.
/// The result is wrapped in an [Either] which can be a [Failure] or a value of type [Type].
abstract class Usecase<Type, Param> {
  Future<Either<Failure, Type>> call(Param param);
}

/// Abstract class for a use case that takes two parameters [Param1] and [Param2].
/// It returns a result wrapped in an [Either] to handle failures or return the result of type [Type].
abstract class UsecaseResultTwoParams<Type, Param1, Param2> {
  Future<Either<Failure, Type>> call(Param1 param1, Param2 param2);
}

/// Abstract class for a use case that takes three parameters [Param1], [Param2], and [Param3].
/// It returns a result wrapped in an [Either] which can be a [Failure] or a result of type [Type].
abstract class UsecaseResultThreeParams<Type, Param1, Param2, Param3> {
  Future<Either<Failure, Type>> call(Param1 param1, Param2 param2, Param3 param3);
}

/// Abstract class for a use case that takes four parameters [Param1], [Param2], [Param3], and [Param4].
/// It returns a result wrapped in an [Either] which can be a [Failure] or a result of type [Type].
abstract class UsecaseResultFourParams<Type, Param1, Param2, Param3, Param4> {
  Future<Either<Failure, Type>> call(Param1 param1, Param2 param2, Param3 param3, Param4 param4);
}
