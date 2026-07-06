// features/payment/presentation/manager/payment_cubit/payment_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import '../../../data/repos/payment_repo.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  final PaymentRepo paymentRepo;

  PaymentCubit(this.paymentRepo) : super(PaymentInitial());

  Future<void> processPayment({
    required String deliveryAddressId,
    required String deliveryOptionId,
    double amount = 0,
  }) async {
    emit(PaymentLoading());

    final result = await paymentRepo.getClientSecret(
      deliveryAddressId: deliveryAddressId,
      deliveryOptionId: deliveryOptionId,
    );

    result.fold(
          (failure) => emit(PaymentFailure(errorMessage: failure.errorMessage)),
          (paymentIntent) async {
        try {
          await Stripe.instance.initPaymentSheet(
            paymentSheetParameters: SetupPaymentSheetParameters(
              paymentIntentClientSecret: paymentIntent.clientSecret,
              merchantDisplayName: 'Smart Store',
              style: ThemeMode.light,
              // ✅ بيظهر المبلغ في الـ Stripe Sheet
              primaryButtonLabel: 'Pay \$${amount.toStringAsFixed(2)}',
            ),
          );

          await Stripe.instance.presentPaymentSheet();
          emit(PaymentSuccess(paymentIntentId: paymentIntent.paymentIntentId));
        } on StripeException catch (e) {
          if (e.error.code == FailureCode.Canceled) {
            emit(PaymentCancelled());
          } else {
            emit(PaymentFailure(
              errorMessage: e.error.localizedMessage ?? "Payment failed",
            ));
          }
        } catch (e) {
          emit(PaymentFailure(errorMessage: e.toString()));
        }
      },
    );
  }

}