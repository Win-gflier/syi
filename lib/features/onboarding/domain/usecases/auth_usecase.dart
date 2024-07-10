import '../../../../core/utils/usecases/usecase.dart';
import '../repositories/abstract_auth_repository.dart';

class AuthUsecase extends UseCase<dynamic> {
  AuthUsecase(this.repository);

  final AbstractAuthRepository repository;

  @override
  Future<dynamic> call() async {
    final Future<dynamic> signInWithGoogle = repository.signInWithGoogle();

    return signInWithGoogle;
  }
}
