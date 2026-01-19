import 'package:flutter/material.dart';

import '../../../../../core/utils/app_color.dart';

class OnBoardingTexts extends StatelessWidget {
  final String title;
  final String subTitle;

  const OnBoardingTexts({
    super.key,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style:  TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color:AppColors.primaryTextColor
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          subTitle,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 16,
            color: AppColors.greyTextColor,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
