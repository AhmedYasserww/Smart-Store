import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_color.dart';
import '../../../../../../core/utils/app_style.dart';

class ProductRatingAndPriceSection extends StatelessWidget {
  const ProductRatingAndPriceSection({
    super.key,
    required this.rating,
    required this.reviews,
    required this.price,
  });

  final double rating;
  final int reviews;
  final double price;

  @override
  Widget build(BuildContext context) {
    final clamped = rating.clamp(0, 5);
    final filledStars = clamped.floor();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(rating.toStringAsFixed(1), style: AppStyle.styleRegular14),
            const SizedBox(width: 8),

            Row(
              children: List.generate(
                5,
                (index) => Icon(
                  index < filledStars ? Icons.star : Icons.star_border_outlined,
                  size: 18,
                  color: index < filledStars
                      ? const Color(0xffFFC107)
                      : AppColors.greyTextColor,
                ),
              ),
            ),

            const SizedBox(width: 8),
            Text('($reviews Review)', style: AppStyle.styleRegular14),
          ],
        ),

        const SizedBox(height: 24),

        Row(
          children: [
            Text(
              '\$${price.toStringAsFixed(2)}',
              style: AppStyle.styleSemiBold18,
            ),
          ],
        ),
      ],
    );
  }
}
