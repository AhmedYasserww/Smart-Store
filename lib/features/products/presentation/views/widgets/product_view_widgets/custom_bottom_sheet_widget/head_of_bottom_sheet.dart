import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../core/utils/app_images.dart';
import '../../../../../../../core/utils/app_style.dart';
class HeadOfBottomSheet extends StatelessWidget {
  const HeadOfBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("Filters", style: AppStyle.styleBold20),
        Spacer(),
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: SvgPicture.asset(AppImages.exitIcon),
        ),
      ],
    );
  }
}