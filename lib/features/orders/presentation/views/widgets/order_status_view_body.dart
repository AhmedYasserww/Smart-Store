import 'package:flutter/material.dart';
import 'package:smart_store/core/utils/app_dimensions.dart';
import '../../../../../core/utils/app_images.dart';
import 'custom_order_status_item.dart';
class OrderStatusViewBody extends StatelessWidget {
  const OrderStatusViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: AppDimensions.homeScreenPadding),
      child: Column(
        spacing: 24,
        children: [
          SizedBox(height: 32,),
          CustomOrderStatusItem(
            statusText: "Confirmed",
            icon: AppImages.checkDouble,
          ),
          CustomOrderStatusItem(
            statusText: "Processed",
            icon: AppImages.orderProcessing,
          ),
          CustomOrderStatusItem(
            statusText: "Shipped",
            icon: AppImages.orderShippedIcon,
          ),
          CustomOrderStatusItem(
            statusText: "Out Of Delivered",
            icon: AppImages.orderOutOfDeliveryIcon,
          ),

          CustomOrderStatusItem(
            statusText: "Arrived",
            icon: AppImages.orderArrivedIcon,
          ),

        ],
      ),
    );
  }
}
