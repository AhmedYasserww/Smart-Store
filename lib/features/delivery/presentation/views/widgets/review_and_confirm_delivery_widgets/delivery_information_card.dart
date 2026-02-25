import 'package:flutter/material.dart';
import 'package:smart_store/core/utils/app_style.dart';
import 'info_row.dart';

class DeliveryInformationCard extends StatelessWidget {

  const DeliveryInformationCard({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(

      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF3EEFB),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFF5D3A82),
        ),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(
            "Delivery Information", style: AppStyle.styleBold16,
          ),
          const SizedBox(height: 16),
          const InfoRow(
            title: "Address",
            value: "12 Nile Road, Cairo",
          ),
          const SizedBox(height: 8),
          const InfoRow(
            title: "Delivery Option",
            value: "Standard Delivery",
          ),
          const SizedBox(height: 8),
          const InfoRow(
            title: "Payment Method",
            value: "Card",
          ),
        ],
      ),
    );
  }
}