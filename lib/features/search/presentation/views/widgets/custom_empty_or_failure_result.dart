import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/app_style.dart';

class CustomEmptyOrFailureResult extends StatelessWidget {
  const CustomEmptyOrFailureResult({
    super.key,
    required this.image,
    required this.title,
    this.subtitle,
    this.richSubtitle,
  });

  final String image;
  final String title;
  final String? subtitle;
  final InlineSpan? richSubtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 56),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: const Color(0xffF9FAFA),
            radius: 40,
            child: SvgPicture.asset(
              image,
              height: 40,
              width: 40,
              color: AppColors.greyTextColor,
            ),
          ),
          const SizedBox(height: 32),
          Text(title, style: AppStyle.styleSemiBold24),
          const SizedBox(height: 32),

          richSubtitle != null
              ? Text.rich(
            textAlign: TextAlign.center,
            richSubtitle!,
          )
              : Text(
            subtitle ?? "",
            textAlign: TextAlign.center,
            style: AppStyle.styleGreyRegular16,
          ),
        ],
      ),
    );
  }
}