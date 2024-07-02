import 'package:dartz/dartz.dart';
import 'package:marvel_app/src/core/utils/exceptions/marvel_app_exception.dart';

abstract class UseCase<T, K extends Params> {
  Future<Either<MarvelAppException, T>> call(K params);
}

class Params {}

class NoParams extends Params {}
