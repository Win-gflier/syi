import 'package:dartz/dartz.dart';

import '../../../../../shared/exceptions/http_exception.dart';

abstract class AbstractSignInApi {
  Future<Either<AppException, dynamic>> signInWithGoogle();

  Future<dynamic> signOutFromGoogle();
}
