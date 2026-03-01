import 'package:flutter/material.dart';
import 'package:smart_store/features/profile/presentation/views/widgets/custom_profile_app_bar.dart';

import 'widgets/order_status_view_body.dart';
class OrderStatusView extends StatelessWidget {
  const OrderStatusView({super.key});
  static const String routeName = 'order_status_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomProfileAppBar(title: "Order Status"),
      body:OrderStatusViewBody() ,
    );
  }
}
