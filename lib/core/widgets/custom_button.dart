import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../utils/app_color.dart';
import '../utils/app_dimensions.dart';
import '../utils/app_style.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    this.buttonColor,
    this.height,
    this.textButtonColor,
    this.border,
    this.isLoading = false,
  });

  final String text;
  final VoidCallback onTap;
  final Color? buttonColor;
  final Color? textButtonColor;
  final double? height;
  final BoxBorder? border;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {

    final Color bgColor = buttonColor ?? AppColors.primaryColor;

    return InkWell(
      onTap: isLoading ? null : onTap,
      child: Container(
        width: double.infinity,
        height: height ?? 48,
        decoration: BoxDecoration(
          border: border,
          borderRadius: BorderRadius.circular(AppDimensions.buttonRadius),


          color: isLoading
              ? bgColor.withOpacity(.6)
              : bgColor,
        ),
        child: Center(
          child: isLoading
              ? LoadingAnimationWidget.threeArchedCircle(
            color: Colors.white,
            size: 32,
          )
              : Text(
            text,
            style: AppStyle.styleWhiteRegular16.copyWith(
              color: textButtonColor ?? Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}