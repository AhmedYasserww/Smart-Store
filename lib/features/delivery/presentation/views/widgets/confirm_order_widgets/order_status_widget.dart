
import 'package:flutter/material.dart';
import 'package:smart_store/core/utils/app_color.dart';
import '../../../../../../core/utils/app_images.dart';
import '../../../../../../core/utils/app_style.dart';
import 'order_status_tile.dart';

class OrderStatusWidget extends StatelessWidget {
  const OrderStatusWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: ShapeDecoration(
        color: const Color(0xFFF3EEFB),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: AppColors.primaryColor,
          ),
          borderRadius: BorderRadius.circular(24),
        ),
      ),
      child: Column(
        spacing: 16,
        children: [
          Row(children: [Text("Order Status", style: AppStyle.styleBold16)]),
          OrderStatusTile(
            title: "Order Confirmed",
            subtitle: "Your order has been confirmed",
            icon: AppImages.orderConfirmIcon,
            circleColor: AppColors.primaryColor,
            lineColor: AppColors.primaryColor,
            isSelected: true,
          ),
          OrderStatusTile(
            title: "Processing",
            subtitle: "We're preparing your items for shipment",
            icon: AppImages.processingIcon,
            circleColor: AppColors.palletBorderColor,
            lineColor: AppColors.palletBorderColor,
            isSelected: false,
          ),
          OrderStatusTile(
            title: "Shipped",
            subtitle: "Your order has been confirmed",
            icon: AppImages.shippedIcon,
            circleColor: AppColors.palletBorderColor,
            lineColor: AppColors.palletBorderColor,
          ),

          OrderStatusTile(
            title: "Delivered",
            subtitle: "Estimated delivery: 3-5 Days",
            icon: AppImages.deliveredIcon,
            circleColor: AppColors.palletBorderColor,
            lineColor: AppColors.palletBorderColor,
          ),

          OrderStatusTile(
            title: "Arrived",
            subtitle: "Reached destination",
            icon: AppImages.arrivedIcon,
            circleColor: AppColors.palletBorderColor,
            lineColor: AppColors.palletBorderColor,
isLast: true,
          ),
        ],
      ),
    );
  }
}


