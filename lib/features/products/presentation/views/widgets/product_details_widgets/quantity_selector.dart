import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_store/features/products/presentation/views/widgets/product_details_widgets/quantity_button.dart';

import '../../../../../../core/utils/app_images.dart';
import '../../../../../../core/utils/app_style.dart';
class QuantitySelector extends StatefulWidget {
  const QuantitySelector({super.key});

  @override
  State<QuantitySelector> createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Text('Quantity', style: AppStyle.styleSemiBold18),
            const Spacer(),
            const Text('15 in stock', style: AppStyle.styleRegular14),
            const SizedBox(width: 4),
            SvgPicture.asset(
              AppImages.checkImage,
              width: 14,
              height: 14,
            ),
          ],
        ),

        const SizedBox(height: 12),

        Row(
          children: [
            QuantityButton(
              icon: Icons.remove,
              onTap: quantity > 1
                  ? () => setState(() => quantity--)
                  : null,
            ),
            const SizedBox(width: 8),
            Text(
              '$quantity',
              style: AppStyle.styleRegular16
                  .copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(width: 8),
            QuantityButton(
              icon: Icons.add,
              onTap: () => setState(() => quantity++),
            ),
          ],
        ),
      ],
    );
  }
}

