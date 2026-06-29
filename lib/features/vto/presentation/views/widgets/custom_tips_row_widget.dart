import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_style.dart';

class CustomTipsRowWidget extends StatelessWidget {
  const CustomTipsRowWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(AppImages.correctTipsIcon),
        SizedBox(width: 10,),
        Text(title,
            style: AppStyle.styleRegular12
        )
      ],
    );
  }
}
