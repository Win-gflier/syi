import 'package:dartz/dartz.dart';

import '../../network/error/failures.dart';

abstract class UseCase<T> {
  Future<Either<Failure,T>> call();
}

class NoParams {}
