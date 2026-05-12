import 'package:flutter/material.dart';
import 'package:smart_store/features/orders/presentation/views/widgets/order_details_view_body.dart';

import '../../../more/profile/presentation/views/widgets/custom_profile_app_bar.dart';
class OrderDetailsView extends StatelessWidget {
  const OrderDetailsView({super.key});
  static const String routeName = 'order_details_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:CustomProfileAppBar(title: "Order Details"),
      body: OrderDetailsViewBody(),
    );
  }
}
