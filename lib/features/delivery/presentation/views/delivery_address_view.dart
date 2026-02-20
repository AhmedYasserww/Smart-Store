import 'package:flutter/material.dart';
import 'package:smart_store/features/delivery/presentation/views/widgets/delivery_address_view_body.dart';
class DeliveryAddressView extends StatelessWidget {
  const DeliveryAddressView({super.key});
  static const String routeName = 'delivery_address_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:DeliveryAddressViewBody(),
    );
  }
}
