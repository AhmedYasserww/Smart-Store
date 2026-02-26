
import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_images.dart';
import '../../../../../../core/utils/app_style.dart';
class TopThankYouWidget extends StatelessWidget {
  const TopThankYouWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Color(0xFF5D3A82),

          child: Image.asset(
            AppImages.orderConfirmIcon,
            height: 40,
            width: 40,
            fit: BoxFit.contain,
            color: Color(0xFFFFFFFF),
          ),
        ),
        SizedBox(height: 24),
        Text("Thank You!", style: AppStyle.styleBold24),
        SizedBox(height: 16),
        Text(
          "Your payment has been processed successfully",
          style: AppStyle.styleRegular14.copyWith(color: Color(0xFF666666)),
        ),
        SizedBox(height: 8),
        Container(
          height: 40,
          width: 220,
          decoration: BoxDecoration(
            color: Color(0xFFF3EEFB),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(width: 2, color: Color(0xFF5D3A82)),
          ),
          child: Center(
            child: Text(
              "Order #123456",
              style: AppStyle.styleMedium14.copyWith(color: Color(0xFF5D3A82)),
            ),
          ),
        ),
      ],
    );
  }
}
