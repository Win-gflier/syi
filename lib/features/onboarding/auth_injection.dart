import '../../core/utils/injections.dart';
import 'data/data_sources/remote/auth_impl_api.dart';
import 'data/repositories/auth_repository_impl.dart';
import 'domain/repositories/abstract_auth_repository.dart';
import 'domain/usecases/auth_usecase.dart';

 dynamic initAuthInjections() {
  sl.registerSingleton<AuthImplApi>(AuthImplApi());
  sl.registerSingleton<AbstractAuthRepository>(AuthRepositoryImpl(sl()));
  // sl.registerSingleton<ArticlesSharedPrefs>(ArticlesSharedPrefs(sl()));
  sl.registerSingleton<AuthUsecase>(AuthUsecase(sl()));
}
