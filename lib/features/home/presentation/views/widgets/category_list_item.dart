import 'package:flutter/material.dart';

import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_style.dart';
class CategoriesListItem extends StatelessWidget {
  const CategoriesListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey.shade300,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(AppImages.menImage),
            ),
          ),
        ),
        const SizedBox(height: 8),
        const Text("Category", style: AppStyle.styleMedium14),
      ],
    );
  }
}