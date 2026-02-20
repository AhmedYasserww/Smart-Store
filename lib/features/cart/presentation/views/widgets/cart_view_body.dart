import 'package:flutter/material.dart';
import 'package:smart_store/features/delivery/presentation/views/delivery_address_view.dart';
import '../../../../../core/utils/app_dimensions.dart';
import 'cart_checkout_section.dart';
import 'cart_item_list_view.dart';
class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
   // return CustomEmptyCart();
    return  Padding(
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
            onCheckout: () {
              Navigator.of(context).pushNamed(DeliveryAddressView.routeName);
            },
          ),
        ],
      ),
    );
  }
}

