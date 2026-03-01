import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_style.dart';

class CustomOrderStatusItem extends StatelessWidget {
  const CustomOrderStatusItem({
    super.key,
    required this.statusText,
    required this.icon,
  });

  final String statusText;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
                padding: const EdgeInsets.all(16),
                decoration: ShapeDecoration(
                  color: const Color(0xFFF3EEFB),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 8,
              children: [
                SvgPicture.asset(
                  icon,),

                /// Rich Text
                RichText(
                  text: TextSpan(
                    children: [

                      TextSpan(
                        text: " Order\n ",
                        style: AppStyle.styleRegular20,
                      ),
                      TextSpan(
                        text: statusText,
                        style: AppStyle.styleSemiBold20,
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
        SizedBox(width: 32,),
        SvgPicture.asset(AppImages.correctSolidIcon)
      ],
    );
  }
}