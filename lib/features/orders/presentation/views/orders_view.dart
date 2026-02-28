import 'package:flutter/material.dart';
import 'package:smart_store/features/orders/presentation/views/widgets/orders_view_body.dart';
import 'package:smart_store/features/profile/presentation/views/widgets/custom_profile_app_bar.dart';
class OrdersView extends StatelessWidget {
  const OrdersView({super.key});
static const String routeName = 'orders_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomProfileAppBar(title: "My Orders"),
      body:OrdersViewBody() ,
    );
  }
}
