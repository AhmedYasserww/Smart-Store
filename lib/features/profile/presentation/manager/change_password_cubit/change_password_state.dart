part of 'change_password_cubit.dart';

@immutable
sealed class ChangePasswordState {}

class ChangePasswordInitial extends ChangePasswordState {}
class ChangePasswordLoading extends ChangePasswordState {}

class ChangePasswordSuccess extends ChangePasswordState {
  final String message;
  ChangePasswordSuccess({required this.message});
}

class ChangePasswordFailure extends ChangePasswordState {
  final String errorMessage;
  ChangePasswordFailure({required this.errorMessage});
}