part of 'google_login_cubit.dart';

@immutable
sealed class GoogleLoginState {}

class GoogleLoginInitial extends GoogleLoginState {}
class GoogleLoginLoading extends GoogleLoginState {}
class GoogleLoginSuccess extends GoogleLoginState {
  final String message;
  GoogleLoginSuccess({required this.message});
}
class GoogleLoginFailure extends GoogleLoginState {
  final String errorMessage;
  GoogleLoginFailure({required this.errorMessage});
}