part of 'auth_bloc.dart';

abstract class AuthEvent {
  const AuthEvent();
}

class OnAuthEvent extends AuthEvent {
  OnAuthEvent({this.withLoading = true});

  final bool withLoading;
}
