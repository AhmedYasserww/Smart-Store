import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/helper_functions/show_try_on_dialog.dart';
import '../../../../../../core/utils/app_images.dart';
import '../../../../../../core/utils/app_style.dart';
class ProductTitleSection extends StatelessWidget {
  const ProductTitleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            'Elegant Maxi Dress',
            style: AppStyle.styleSemiBold20,
          ),
        ),
        InkWell(
            onTap: () {
              showTryOnDialog(context);
            },
            child: SvgPicture.asset(AppImages.vto))
      ],
    );
  }
}