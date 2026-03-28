import 'package:flutter/material.dart';
import 'package:smart_store/core/widgets/custom_cached_network_image.dart';
import 'package:smart_store/features/categories/data/models/category_model.dart';

import '../../../../../core/utils/app_style.dart';

class CategoriesListItem extends StatelessWidget {
  const CategoriesListItem({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipOval(
          child: CustomCachedNetworkImage(
            path: category.categoryImageUrl,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
        ),
        /*Container(
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
        ),*/
        const SizedBox(height: 8),
        Text(category.name, style: AppStyle.styleMedium14),
      ],
    );
  }
}
