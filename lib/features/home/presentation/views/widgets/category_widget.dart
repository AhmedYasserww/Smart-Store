import 'package:flutter/material.dart';
import '../../../../../core/utils/app_style.dart';
import 'categories_list_view.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text("Categories", style: AppStyle.styleSemiBold18),
        SizedBox(height: 16),
        CategoriesListView(),
      ],
    );
  }
}
