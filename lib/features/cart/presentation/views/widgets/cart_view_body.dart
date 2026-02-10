import 'package:flutter/material.dart';
import 'package:smart_store/core/utils/app_dimensions.dart';

import '../../../../../core/widgets/cart_checkout_section.dart';
import 'cart_item_list_view.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppDimensions.homeScreenPadding,
      ),
      child: Column(
        children: [
          const Expanded(
            child: CartItemListView(),
          ),

          CartCheckoutSection(
            total: '250 EGP',
            onCheckout: () {},
          ),
        ],
      ),
    );
  }
}

