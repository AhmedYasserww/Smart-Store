import 'package:flutter/material.dart';
import 'package:smart_store/features/cart/presentation/views/widgets/cart_view_body.dart';

import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_style.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});
  static const String routeName = 'cart_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    //  backgroundColor: Colors.red,
      appBar: AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      scrolledUnderElevation: 0,
      title: Text(
        'My cart',
        style: AppStyle.styleSemiBold20,
      ),
      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(1),
        child: Divider(
          height: 1,
          thickness: 1,
          color: AppColors.palletBorderColor,
        ),
      ),
      ),
      body: CartViewBody(),
    );
  }
}
