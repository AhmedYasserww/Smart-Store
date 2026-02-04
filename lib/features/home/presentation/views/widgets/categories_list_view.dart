
import 'package:flutter/material.dart';

import '../home_view.dart';
import 'category_list_item.dart';
class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        separatorBuilder: (context, index) => const SizedBox(width: 16),
        itemBuilder: (context, index) {
          return const CategoriesListItem();
        },
      ),
    );
  }
}
