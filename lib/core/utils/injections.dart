import 'package:get_it/get_it.dart';

import '../../features/onboarding/auth_injection.dart';

final  sl = GetIt.instance;

Future<void> initInjections() async {
  // await initSharedPrefsInjections();
  // await initAppInjections();
  // await initDioInjections();
  await initAuthInjections();
}
