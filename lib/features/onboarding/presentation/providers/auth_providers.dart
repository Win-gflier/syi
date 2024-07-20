import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/provider/onboarding_provider.dart';
import 'state/auth_notifier.dart';

import 'state/auth_state.dart';

final authStateNotifierProvider =
    StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) {
    final authenticationRepository = ref.watch(onboardingProvider);
    // final AuthenticationRepository authenticationRepository =
    //     ref.watch(authRepositoryProvider);
    // final UserRepository userRepository =
    //     ref.watch(userLocalRepositoryProvider);
    print('auth_provider');

    return AuthNotifier(
      authRepository: authenticationRepository,
      // userRepository: userRepository,
    );
  },
);
