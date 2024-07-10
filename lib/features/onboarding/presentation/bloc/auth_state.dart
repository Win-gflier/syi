part of 'auth_bloc.dart';

abstract class AuthState {
  const AuthState();
}

class NyTimesInitial extends AuthState {}

class LoadingAuthState extends AuthState {}

class ErrorAuthState extends AuthState {
  ErrorAuthState(this.errorMsg);

  final String errorMsg;
}

class SuccessAuthState extends AuthState {
  SuccessAuthState(this.articles);

  final dynamic articles;
}
