import 'package:flutter/material.dart';
import '../../../../../core/widgets/custom_empty_cart.dart';
class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomEmptyCart();
    // return  Padding(
    //   padding: EdgeInsets.symmetric(
    //     horizontal: AppDimensions.homeScreenPadding,
    //   ),
    //   child: Column(
    //     children: [
    //       const Expanded(
    //         child: CartItemListView(),
    //       ),
    //
    //       CartCheckoutSection(
    //         total: '250 EGP',
    //         onCheckout: () {},
    //       ),
    //     ],
    //   ),
    // );
  }
}

