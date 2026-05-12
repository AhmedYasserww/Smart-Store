import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_style.dart';
import '../../../../data/models/order_summary_argument.dart';
import 'info_row.dart';

class DeliveryInformationCard extends StatelessWidget {
  const DeliveryInformationCard({super.key, required this.args});
  final OrderSummaryArguments args;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF3EEFB),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF5D3A82)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Delivery Information', style: AppStyle.styleBold16),
          const SizedBox(height: 16),
          InfoRow(title: 'Address', value: args.address.fullAddress),
          const SizedBox(height: 8),
          InfoRow(title: 'Delivery Option', value: args.deliveryOption.name),
          const SizedBox(height: 8),
          InfoRow(title: 'Shipping Fee', value: args.deliveryOption.formattedFee),
          const SizedBox(height: 8),
          InfoRow(title: 'Payment Method', value: args.paymentMethod),
        ],
      ),
    );
  }
}