part of 'reset_password_cubit.dart';

@immutable
sealed class ResetPasswordState {}

final class ResetPasswordInitial extends ResetPasswordState {}

final class ResetPasswordLoading extends ResetPasswordState {}

final class ResetPasswordSuccess extends ResetPasswordState {
  final String message;
  final String userId;
  final String email;
  ResetPasswordSuccess({
    required this.message,
    required this.userId,
    required this.email,
  });
}
final class ResetPasswordFailure extends ResetPasswordState {
  final String errorMessage;
  ResetPasswordFailure({required this.errorMessage});
}