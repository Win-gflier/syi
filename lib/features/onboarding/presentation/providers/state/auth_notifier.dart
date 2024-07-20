import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../shared/exceptions/http_exception.dart';
import '../../../data/repositories/auth_repository_impl.dart';
import '../../../domain/repositories/abstract_auth_repository.dart';
import 'auth_state.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier({
    required this.authRepository,
  }) : super(const AuthState.initial());
  final AuthRepository authRepository;

  Future<void> signInWithGoogle() async {
    print('auth_notifier');

    state = const AuthState.loading();
    final response = await authRepository.signInWithGoogle();

    state = await response.fold(
      (failure) => AuthState.failure(failure),
      (user) async {
        final hasSavedUser = true; // await userRepository.saveUser(user: user);
        if (hasSavedUser) {
          return const AuthState.success();
        }
        return AuthState.failure(CacheFailureException());
      },
    );
  }
}
