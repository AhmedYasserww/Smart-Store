import 'package:flutter/material.dart';
import 'package:smart_store/features/cart/data/entities/get_cart_entity.dart';
import 'order_summary_item.dart';

class OrderSummaryListView extends StatelessWidget {
  const OrderSummaryListView({super.key, required this.items});
  final List<CartItemDetailsEntity> items;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, i) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: OrderSummaryItem(item: items[i]),
        );
      },
    );
  }
}