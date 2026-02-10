import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_store/core/utils/app_color.dart';

import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_style.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(top: 24),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Image (no radius)
            Image.asset(
              AppImages.bagImage,
              width: 85,
              height: 100,
              fit: BoxFit.cover,
            ),

            const SizedBox(width: 8),


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
                        child: SvgPicture.asset(AppImages.circleRemove),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  Row(
                    children: [
                      Text(
                        'Quantity: ',
                        style: AppStyle.styleGreyRegular12,
                      ),
                      Text(
                        ' 1',
                        style: AppStyle.styleGreyRegular12,
                      ),
                    ],
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
                        style: AppStyle.styleMedium16,
                      ),

                    Spacer(),

                      Text(
                        'Move to Wishlist',
                        style: AppStyle.styleSemiBold10.copyWith(
                          color:Color(0xff2861AB),
                        ),
                      ),
                      SizedBox(width: 8,),

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
        width: 20,
        height: 20,
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

