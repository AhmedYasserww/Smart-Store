import 'package:flutter/material.dart';

import '../utils/app_color.dart';
import '../utils/app_dimensions.dart';
import '../utils/app_style.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    this.buttonColor,
  });

  final String text;
  final void Function() onTap;
  final Color? buttonColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppDimensions.buttonRadius),
          color: buttonColor ?? AppColors.primaryColor,
        ),
        child: Center(
          child: Text(
            text,
            style:AppStyle.styleWhiteRegular16
          ),
        ),
      ),
    );
  }
}
