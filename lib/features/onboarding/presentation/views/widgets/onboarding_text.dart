import 'package:flutter/material.dart';
import 'package:smart_store/core/utils/app_style.dart';

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
            style: AppStyle.styleBold24
          ),
        ),
        const SizedBox(height: 16),
        Text(
          subTitle,
          textAlign: TextAlign.center,
          style: AppStyle.styleGreyRegular16
        ),
      ],
    );
  }
}
