
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_store/core/utils/app_color.dart';

import '../../../../../../core/utils/app_images.dart';
import '../../../../../../core/utils/app_style.dart';

class TopThankYouWidget extends StatelessWidget {
  const TopThankYouWidget({super.key, required this.orderCode});
  final String orderCode;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: const Color(0xFF5D3A82),
          child: SvgPicture.asset(AppImages.orderConfirmIcon),
        ),
        const SizedBox(height: 24),
        Text("Thank You!", style: AppStyle.styleBold24),
        const SizedBox(height: 16),
        Text(
          "Your payment has been processed successfully",
          style: AppStyle.styleGreyRegular14,
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFFF3EEFB),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(width: 2, color: AppColors.primaryColor),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
            child: Text(
              "Order #$orderCode",
              style: AppStyle.styleMedium14.copyWith(
                color: const Color(0xFF5D3A82),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
