part of 'resend_otp_cubit.dart';

@immutable
sealed class ResendOtpState {}

final class ResendOtpInitial extends ResendOtpState {}

final class ResendOtpLoading extends ResendOtpState {}

final class ResendOtpSuccess extends ResendOtpState {
  final String message;

  ResendOtpSuccess({required this.message});
}

final class ResendOtpFailure extends ResendOtpState {
  final String errorMessage;

  ResendOtpFailure({required this.errorMessage});
}