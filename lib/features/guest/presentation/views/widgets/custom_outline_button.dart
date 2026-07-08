import 'package:flutter/material.dart';

import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/app_style.dart';
class CustomOutlinedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomOutlinedButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 40,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color:  AppColors.palletBorderColor, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: Text(text, style: AppStyle.styleRegular16),
      ),
    );
  }
}