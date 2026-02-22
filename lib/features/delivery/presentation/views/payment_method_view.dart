import 'package:flutter/material.dart';
import 'package:smart_store/features/delivery/presentation/views/widgets/payment_method_view_body.dart';
class PaymentMethodView extends StatelessWidget {
  const PaymentMethodView({super.key});

  static const String routeName = 'payment_method_view';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: PaymentMethodViewBody(),
    );
  }
}
