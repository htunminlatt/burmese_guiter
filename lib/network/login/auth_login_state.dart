part of 'auth_login_cubit.dart';

class AuthLoginState {}

final class AuthLoginInitial extends AuthLoginState {}

final class AuthLoadingState extends AuthLoginState {}

final class LoginSuccessState extends AuthLoginState{
}

final class FailState extends AuthLoginState {
  final String error;
  FailState(this.error);
}

