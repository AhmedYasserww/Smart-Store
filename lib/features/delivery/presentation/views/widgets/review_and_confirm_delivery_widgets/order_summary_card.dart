import 'package:flutter/material.dart';
import 'package:smart_store/core/utils/app_color.dart';
import 'package:smart_store/core/utils/app_style.dart';
import 'order_summary_list_view.dart';
import 'price_row.dart';

class OrderSummaryCard extends StatelessWidget {
  const OrderSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.palletBorderColor,
        ),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Order Summary',
            style: AppStyle.styleBold16,
          ),
          const SizedBox(height: 16),
          const OrderSummaryListView(),
          const SizedBox(height: 16),
          const Divider(
            height: 0,
            color: AppColors.palletBorderColor,
          ),
          const SizedBox(height: 24),
          const PriceRow(
            title: "Subtotal",
            value: "\$149.97",
          ),

          const SizedBox(height: 12),

          const PriceRow(
            title: "Shipping Fee",
            value: "\$4.99",
          ),
          const SizedBox(height: 12),

          const PriceRow(
            title: "Discount",
            value: "\$10.99",
          ),
          const SizedBox(height: 24),
          const Divider(
            height: 0,
            color: AppColors.palletBorderColor,
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total",
                style: AppStyle.styleSemiBold18,
              ),
              Opacity(
                opacity: .9,
                child: Text(
                  "\$143.97",
                  style: AppStyle.styleSemiBold18,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}