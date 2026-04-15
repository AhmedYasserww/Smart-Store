import 'package:flutter/material.dart';
import '../../../data/entities/get_cart_entity.dart';
import 'cart_item.dart';

class CartItemListView extends StatelessWidget {
  const CartItemListView({super.key, required this.items});

  final List<CartItemDetailsEntity> items;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 24),
      itemCount: items.length,
      itemBuilder: (context, i) {
        return CartItem(item: items[i]);
      },
    );
  }
}