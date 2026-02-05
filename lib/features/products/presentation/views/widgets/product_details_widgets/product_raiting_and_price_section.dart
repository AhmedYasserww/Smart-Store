import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_color.dart';
import '../../../../../../core/utils/app_style.dart';
class ProductRatingAndPriceSection extends StatelessWidget {
  const ProductRatingAndPriceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              '4.5',
              style: AppStyle.styleRegular14,
            ),
            const SizedBox(width: 8),

            Row(
              children: List.generate(
                5,
                    (index) => Icon(
                  Icons.star_border_outlined,
                  size: 18,
                  color: index < 5
                      ? const Color(0xffFFC107)
                      : AppColors.greyTextColor,
                ),
              ),
            ),

            const SizedBox(width: 8),
            Text(
                '(120 Review)',
                style: AppStyle.styleRegular14
            ),
          ],
        ),

        const SizedBox(height: 24),

        Row(
          children: [
            Text(
                '\$59.99',
                style:AppStyle.styleRegular16.copyWith( decoration: TextDecoration.lineThrough,)
            ),
            const SizedBox(width: 8),
            Text(
                '\$49.99',
                style: AppStyle.styleSemiBold18


            ),
          ],
        ),
      ],
    );
  }
}