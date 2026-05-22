import 'package:flutter/material.dart';
import 'package:smart_store/features/orders/data/entities/order_details_entity.dart';
import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/app_images.dart';
import 'order_details_item.dart';

class OrderDetailsCard extends StatelessWidget {
  const OrderDetailsCard({super.key, required this.order});
  final OrderDetailsEntity order;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.palletBorderColor),
        boxShadow: const [BoxShadow(color: Color(0x1E000000), blurRadius: 4)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OrderDetailsItem(
            title: "Order Code",
            value: order.orderCode,
            icon: AppImages.orderIcon,
          ),
          const SizedBox(height: 32),
          OrderDetailsItem(
            title: "Status",
            value: order.status,
            icon: AppImages.statusIcon,
          ),
          const SizedBox(height: 32),
          OrderDetailsItem(
            title: "Price",
            value: '\$${order.totalPrice.toStringAsFixed(2)}',
            icon: AppImages.priceIcon,
          ),
          const SizedBox(height: 32),
          OrderDetailsItem(
            title: "Date",
            value: order.createdAt.substring(0, 10),
            icon: AppImages.dateIcon,
          ),
          const SizedBox(height: 32),
          OrderDetailsItem(
            title: "Delivery Address",
            value: order.shippingAddress,
            icon: AppImages.deliveryIcon,
          ),
        ],
      ),
    );
  }
}