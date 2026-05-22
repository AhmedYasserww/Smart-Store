
import 'package:flutter/material.dart';
import '../../../more/profile/presentation/views/widgets/custom_profile_app_bar.dart';
import 'widgets/order_status_view_body.dart';
class OrderStatusView extends StatelessWidget {
  const OrderStatusView({super.key, required this.status});
  static const String routeName = 'order_status_view';
  final String status;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomProfileAppBar(title: "Order Status"),
      body: OrderStatusViewBody(currentStatus: status),
    );
  }
}
