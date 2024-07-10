import 'package:bloc/bloc.dart';

import '../../../../core/network/error/failures.dart';
import '../../domain/usecases/auth_usecase.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthUsecase authsUseCase;

  dynamic allAuths;

  AuthBloc({required this.authsUseCase}) : super(LoadingAuthState()) {
    on<OnAuthEvent>(_onGettingAuthsEvent);
  }

// Getting auths event
  _onGettingAuthsEvent(OnAuthEvent event, Emitter<AuthState> emitter) async {
    if (event.withLoading) {
      emitter(LoadingAuthState());
    }

    final dynamic result = await authsUseCase.call();
    result.fold((l) {
      if (l is CancelTokenFailure) {
        emitter(LoadingAuthState());
      } else {
        emitter(ErrorAuthState(l.errorMessage.toString()));
      }
    }, (r) {
      // Return list of auths with filtered by search text
      allAuths = r;
      emitter(SuccessAuthState(result));
    });
  }
}
