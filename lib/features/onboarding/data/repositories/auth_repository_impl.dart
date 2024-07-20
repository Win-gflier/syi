import 'package:dartz/dartz.dart';

import '../../../../core/network/error/failures.dart';
import '../../../../shared/exceptions/http_exception.dart';
import '../../domain/repositories/abstract_auth_repository.dart';
import '../data_sources/remote/auth_impl_api.dart';

class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl(this.authApi);

  final AuthImplApi authApi;

  @override
  Future<Either<AppException, dynamic>> signInWithGoogle() {
    return authApi.signInWithGoogle();
  }
}
