import 'package:flutter/material.dart';
import 'package:smart_store/core/utils/app_color.dart';

import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_style.dart';
class CartItem extends StatelessWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Image (no radius)
            Image.asset(
              AppImages.bagImage,
              width: 90,
              height: 110,
              fit: BoxFit.cover,
            ),

            const SizedBox(width: 12),

            /// Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Title + Close
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          'Sunset Shine Heels',
                          style: AppStyle.styleBold16,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const Icon(
                          Icons.close,
                          size: 20,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 4),

                  Text(
                    'Quantity: 1',
                    style: AppStyle.styleGreyRegular12,
                  ),

                  const SizedBox(height: 4),

                  Text(
                    'Medium, Black',
                    style: AppStyle.styleGreyRegular12,
                  ),

                  const SizedBox(height: 8),

                  /// Price + Wishlist + Counter
                  Row(
                    children: [
                      Text(
                        '\$49.99',
                        style: AppStyle.styleSemiBold16,
                      ),

                      const SizedBox(width: 12),

                      Text(
                        'Move to Wishlist',
                        style: AppStyle.styleRegular12.copyWith(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),

                      const Spacer(),

                      Row(
                        children: [
                          _circleButton(
                            context: context,
                            icon: Icons.remove,
                            onTap: () {},
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '1',
                            style: AppStyle.styleRegular14,
                          ),
                          const SizedBox(width: 8),
                          _circleButton(
                            context: context,
                            icon: Icons.add,
                            onTap: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _circleButton({
    required BuildContext context,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 28,
        height: 28,
        decoration: const BoxDecoration(
          color: Color(0xFFBFBFBF),
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          size: 16,
          color: AppColors.primaryTextColor,
        ),
      ),
    );
  }
}

