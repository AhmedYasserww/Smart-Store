import 'package:flutter/material.dart';
import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/app_images.dart';
import 'order_details_item.dart';

class OrderDetailsCard extends StatelessWidget {
  const OrderDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

      width: double.infinity,

      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 32,
      ),

      decoration: BoxDecoration(

        color: Colors.white,

        borderRadius:
        BorderRadius.circular(24),

        border: Border.all(
          color: AppColors.palletBorderColor,
        ),

        boxShadow: const [
          BoxShadow(
            color: Color(0x1E000000),
            blurRadius: 4,
          )
        ],
      ),

      child: const Column(

        crossAxisAlignment:
        CrossAxisAlignment.start,

        children: [

          OrderDetailsItem(
            title: "Order Code",
            value: "123456",
            icon: AppImages.orderIcon,
          ),

          SizedBox(height: 32),

          OrderDetailsItem(
            title: "Status",
            value: "Pending",
            icon: AppImages.statusIcon,
          ),

          SizedBox(height: 32),

          OrderDetailsItem(
            title: "Price",
            value: "\$120",
            icon: AppImages.priceIcon,
          ),

          SizedBox(height: 32),

          OrderDetailsItem(
            title: "Date",
            value: "2025-12-5",
            icon: AppImages.dateIcon,
          ),

          SizedBox(height: 32),

          OrderDetailsItem(
            title: "Delivery Address",
            value: "12 Nile Road, Cairo",
            icon: AppImages.deliveryIcon,
          ),

        ],
      ),
    );
  }
}