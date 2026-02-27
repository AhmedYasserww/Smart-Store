import 'package:flutter/material.dart';
import 'package:smart_store/features/delivery/presentation/views/widgets/confirm_order_view_body.dart';

class ConfirmOrderView extends StatelessWidget {
  const ConfirmOrderView({super.key});
  static const String routeName = 'confirm_order_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConfirmOrderViewBody(),
    );
  }
}


