part of 'authentication_cubit.dart';

@immutable
sealed class AuthenticationState {}

final class AuthenticationInitial extends AuthenticationState {}

final class LoginLoading extends AuthenticationState {}

final class LoginSuccess extends AuthenticationState {}

final class LoginFailure extends AuthenticationState {
  final String error;
  LoginFailure({required this.error});
}

final class SinghUpLoading extends AuthenticationState {}

final class SinghUpSuccess extends AuthenticationState {}

final class SinghUpFailure extends AuthenticationState {
  final String error;
  SinghUpFailure({required this.error});
}
