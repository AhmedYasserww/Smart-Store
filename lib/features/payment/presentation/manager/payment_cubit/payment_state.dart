part of 'payment_cubit.dart';

@immutable
sealed class PaymentState {}

class PaymentInitial extends PaymentState {}
class PaymentLoading extends PaymentState {}

class PaymentSuccess extends PaymentState {
  final String paymentIntentId;
  PaymentSuccess({required this.paymentIntentId});
}

class PaymentCancelled extends PaymentState {}

class PaymentFailure extends PaymentState {
  final String errorMessage;
  PaymentFailure({required this.errorMessage});
}