import 'package:flutter/material.dart';

import 'order_summary_item.dart';

class OrderSummaryListView extends StatelessWidget {
  const OrderSummaryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, i) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: OrderSummaryItem(),
        );
      },
    );
  }
}