import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/helper_functions/show_try_on_dialog.dart';
import '../../../../../../core/utils/app_images.dart';
import '../../../../../../core/utils/app_style.dart';
import '../../../../../vto/data/models/vto_argument.dart';

class ProductTitleSection extends StatelessWidget {
  const ProductTitleSection({
    super.key,
    required this.title,
    required this.garmentUrl,   // ✅ صورة المنتج
    required this.subCategory,  // ✅ الكاتيجوري
  });

  final String title;
  final String garmentUrl;
  final String subCategory;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Text(title, style: AppStyle.styleSemiBold20)),
        InkWell(
          onTap: () {
            showTryOnDialog(
              context,
              args: VtoArguments(
                garmentUrl: garmentUrl,
                subCategory: subCategory,
              ),
            );
          },
          child: SvgPicture.asset(AppImages.vto),
        ),
      ],
    );
  }
}
