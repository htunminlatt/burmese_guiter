part of 'sign_up_cubit.dart';

sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}

final class LoadingState extends SignUpState{}

final class SuccessState extends SignUpState{}

final class FailSignUpState extends SignUpState{
  final String message;

  FailSignUpState({required this.message});
}