import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_style.dart';

class CustomOrderStatusItem extends StatelessWidget {
  const CustomOrderStatusItem({
    super.key,
    required this.statusText,
    required this.icon,
    required this.isCompleted,
  });

  final String statusText;
  final String icon;
  final bool isCompleted;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: ShapeDecoration(
              color: isCompleted
                  ? const Color(0xFFF3EEFB)
                  : Colors.grey.shade100,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              spacing: 8,
              children: [
                SvgPicture.asset(
                  icon,
                  colorFilter: isCompleted
                      ? ColorFilter.mode(
                    AppColors.primaryColor,
                    BlendMode.srcIn,
                  )
                      : const ColorFilter.mode(
                    Color(0xFF666666),
                    BlendMode.srcIn,
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: " Order\n ",
                        style: AppStyle.styleRegular20.copyWith(
                          color: isCompleted
                              ? AppColors.primaryTextColor
                              : const Color(0xFF666666),
                        ),
                      ),
                      TextSpan(
                        text: statusText,
                        style: AppStyle.styleSemiBold20.copyWith(
                          color: isCompleted
                              ? AppColors.primaryTextColor
                              : const Color(0xFF666666),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 32),
        // ✅ لو completed يبقى الـ correct icon، لو لا يبقى الـ unselected
        SvgPicture.asset(
          isCompleted
              ? AppImages.correctSolidIcon
              : AppImages.unselectedStatusOrder,
        ),
      ],
    );
  }
}