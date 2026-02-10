import 'package:flutter/material.dart';

import 'cart_item.dart';
class CartItemListView extends StatelessWidget {
  const CartItemListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 24),
      itemCount: 15,
      itemBuilder: (context, i) {
        return const CartItem();
      },
    );
  }
}
