import 'package:flutter/material.dart';
import 'package:smart_store/features/cart/presentation/views/widgets/cart_item.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: CartItem()
    );
  }
}
