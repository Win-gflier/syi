import 'package:dartz/dartz.dart';

import '../../../../core/network/error/failures.dart';
import '../../../../shared/exceptions/http_exception.dart';

abstract class AuthRepository {
  Future<Either<AppException,dynamic>> signInWithGoogle();
}
