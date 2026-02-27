import 'package:flutter/material.dart';
import 'package:smart_store/core/utils/app_color.dart';
import 'package:smart_store/features/delivery/presentation/views/widgets/confirm_order_widgets/item_order_details.dart';

import '../../../../../../core/utils/app_style.dart';

class OrderDetailsWidget extends StatelessWidget {
  const OrderDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFFFFFFFF),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: AppColors.palletBorderColor, width: 1),
      ),
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Order Details", style: AppStyle.styleBold16),
            SizedBox(height: 16),
            ItemOrderDetails(text1: "Classic Blue Suit x 1", text2: "\$49.99"),
            SizedBox(height: 16),

            ItemOrderDetails(text1: "Classic Blue Suit x 1", text2: "\$49.99"),
            SizedBox(height: 16),

            ItemOrderDetails(text1: "Classic Blue Suit x 1", text2: "\$49.99"),

            SizedBox(height: 16),
            Divider(
              height: 0,
              color: AppColors.palletBorderColor,
            ),
            SizedBox(height: 16),
            ItemOrderDetails(text1: "Subtotal", text2: "\$149.97"),
            SizedBox(height: 16),

            ItemOrderDetails(text1: "Shipping Fee", text2: "\$4.99"),
            SizedBox(height: 16),
            ItemOrderDetails(text1: "Discount", text2: "\$10.99"),
            SizedBox(height: 16),
            Divider(
              height: 0,
              color: AppColors.palletBorderColor,
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Text("Total", style: AppStyle.styleBold16),
                Spacer(),
                Opacity(
                  opacity: .9,
                  child: Text(
                    "\$143.97",
                    style: AppStyle.styleSemiBold18.copyWith(
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
