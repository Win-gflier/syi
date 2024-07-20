import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/data_sources/remote/auth_impl_api.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../repositories/abstract_auth_repository.dart';

final onboardingProvider = Provider<AuthRepository>(
      (ref) {

    // final NetworkService networkService = ref.watch(networkServiceProvider);
    // final LoginUserDataSource dataSource =
    return AuthRepositoryImpl(AuthImplApi());
  },
);