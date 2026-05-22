import 'package:flutter/material.dart';
import 'package:smart_store/core/utils/app_color.dart';
import 'package:smart_store/features/delivery/presentation/views/widgets/confirm_order_widgets/item_order_details.dart';

import '../../../../../../core/utils/app_style.dart';
import '../../../../../orders/data/entities/order_details_entity.dart';

class OrderDetailsWidget extends StatelessWidget {
  const OrderDetailsWidget({super.key, required this.order});
  final OrderDetailsEntity order;

  @override
  Widget build(BuildContext context) {
    final subtotal = order.orderItems.fold<double>(
      0, (sum, item) => sum + item.totalPrice,
    );

    return Card(
      color: Colors.white,
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
            const SizedBox(height: 16),
            ...order.orderItems.map((item) => Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: ItemOrderDetails(
                text1: '${item.productName} x${item.quantity}',
                text2: '\$${item.totalPrice.toStringAsFixed(2)}',
              ),
            )),
            const Divider(height: 0, color: AppColors.palletBorderColor),
            const SizedBox(height: 16),
            ItemOrderDetails(
              text1: "Subtotal",
              text2: '\$${subtotal.toStringAsFixed(2)}',
            ),
            const SizedBox(height: 16),
            ItemOrderDetails(
              text1: "Shipping Fee",
              text2: '\$${order.shippingFee.toStringAsFixed(2)}',
            ),
            const SizedBox(height: 16),
            ItemOrderDetails(
              text1: "Discount",
              text2: '\$${order.discount.toStringAsFixed(2)}',
            ),
            const SizedBox(height: 16),
            const Divider(height: 0, color: AppColors.palletBorderColor),
            const SizedBox(height: 16),
            Row(
              children: [
                Text("Total", style: AppStyle.styleBold16),
                const Spacer(),
                Text(
                  '\$${order.totalPrice.toStringAsFixed(2)}',
                  style: AppStyle.styleSemiBold18.copyWith(
                    color: AppColors.primaryColor,
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
