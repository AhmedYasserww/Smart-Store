import 'package:flutter/material.dart';
import 'package:smart_store/features/delivery/data/entities/delivery_option_entity.dart';
import 'package:smart_store/features/delivery/presentation/views/widgets/payment_method_view_body.dart';

import '../../data/entities/delivery_address_entity.dart';
class PaymentMethodView extends StatelessWidget {
  const PaymentMethodView({super.key, required this.address, required this.deliveryOption});

  static const String routeName = 'payment_method_view';
  final DeliveryAddressEntity address;
  final DeliveryOptionEntity deliveryOption;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: PaymentMethodViewBody(address: address, deliveryOption: deliveryOption,),
    );
  }
}
