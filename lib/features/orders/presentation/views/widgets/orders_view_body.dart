import 'package:flutter/material.dart';
import '../../../../../core/utils/app_dimensions.dart';
import 'custom_order_item.dart';
class OrdersViewBody extends StatelessWidget {
  const OrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal:
        AppDimensions.homeScreenPadding,
      ),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [

          const SizedBox(height: 32),

          CustomOrderItem(
            orderCode: "123456",
            status: "Pending",
         //   onDetailsTap: () {},
          ),

          const SizedBox(height: 16),
          CustomOrderItem(
            orderCode: ":587496",
            status: "Arrived",
          //  onDetailsTap: () {},
          ),

        ],
      ),
    );
  }
}
