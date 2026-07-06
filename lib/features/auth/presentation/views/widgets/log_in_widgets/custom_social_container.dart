import 'package:flutter/material.dart';
import 'package:smart_store/core/utils/app_color.dart';
import 'package:smart_store/core/utils/app_style.dart';

class CustomSocialContainer extends StatelessWidget {
  const CustomSocialContainer({
    super.key,
    required this.title,
    this.icon, required this.onTap,
  });

  final String title;
  final Widget? icon;
  final void Function() onTap;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1,
              color: AppColors.palletBorderColor,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              icon!,
              const SizedBox(width: 8),
            ],
            Text(
              title,
              textAlign: TextAlign.center,
              style: AppStyle.styleRegular16,
            ),
          ],
        ),
      ),
    );
  }
}