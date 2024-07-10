import 'package:dartz/dartz.dart';

import '../../network/error/failures.dart';

abstract class UseCase<T> {
  Future<T> call();
}

class NoParams {}
