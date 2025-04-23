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

final class GoogelSinghtInLoading extends AuthenticationState {}

final class GoogelSinghtInSucsess extends AuthenticationState {}

final class GoogelSinghtInFailuer extends AuthenticationState {}

final class SignOutLoading extends AuthenticationState {}

final class SignOutSucsess extends AuthenticationState {}

final class SignOutFailuer extends AuthenticationState {
  // final String error;
  // logOutFailuer({required this.error});
}

final class ResetpasswordLoging extends AuthenticationState {}

final class ResetpasswordSucsess extends AuthenticationState {}

final class ResetpasswordFailuer extends AuthenticationState {
  final String error;

  ResetpasswordFailuer({required this.error});
}
