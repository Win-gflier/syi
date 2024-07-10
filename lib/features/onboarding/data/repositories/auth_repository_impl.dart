import '../../domain/repositories/abstract_auth_repository.dart';
import '../data_sources/remote/auth_impl_api.dart';

class AuthRepositoryImpl extends AbstractAuthRepository {
  AuthRepositoryImpl(this.authApi);

  final AuthImplApi authApi;

  @override
  Future<dynamic> signInWithGoogle() async {
    return authApi.signInWithGoogle();
  }
}
