import 'package:flutter/material.dart';
import 'package:smart_store/features/delivery/presentation/views/widgets/delivery_option_view_body.dart';
class DeliveryOptionView extends StatelessWidget {
  const DeliveryOptionView({super.key});
  static const String routeName = 'delivery_option_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:DeliveryOptionViewBody() ,
    );
  }
}
