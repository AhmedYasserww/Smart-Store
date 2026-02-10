import 'package:flutter/material.dart';
import 'package:smart_store/core/widgets/custom_button.dart';

import '../utils/app_color.dart';
import '../utils/app_style.dart';

class CartCheckoutSection extends StatelessWidget {
  const CartCheckoutSection({
    super.key,
    required this.total,
    this.onCheckout,
  });

  final String total;
  final VoidCallback? onCheckout;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 24),

        Divider(thickness: 1 ,height: 0,color: AppColors.palletBorderColor ,),

        const SizedBox(height: 16),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             Text(
              'Total',
              style: AppStyle.styleSemiBold22
            ),
            Text(
              total,
                style: AppStyle.styleSemiBold22
            ),
          ],
        ),

        const SizedBox(height: 24),

        CustomButton(
          text: 'Processed to Checkout',
          onTap: onCheckout!,
        ),

        const SizedBox(height: 16),
      ],
    );
  }
}
