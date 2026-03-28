import 'package:flutter/material.dart';
import 'package:smart_store/core/service_locator/service_locator.dart';
import 'package:smart_store/features/categories/data/models/category_model.dart';
import 'package:smart_store/features/categories/data/repos/categories_repo_imp.dart';

import 'category_list_item.dart';

class CategoriesListView extends StatefulWidget {
  const CategoriesListView({super.key});

  @override
  State<CategoriesListView> createState() => _CategoriesListViewState();
}

class _CategoriesListViewState extends State<CategoriesListView> {
  late Future<List<CategoryModel>> _categoriesFuture;

  @override
  void initState() {
    super.initState();
    _categoriesFuture = _loadCategories();
  }

  Future<List<CategoryModel>> _loadCategories() async {
    final result = await getIt.get<CategoriesRepoImpl>().getAllCategories();
    return result.fold((_) => <CategoryModel>[], (categories) => categories);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CategoryModel>>(
      future: _categoriesFuture,
      builder: (context, snapshot) {
        final categories = snapshot.data ?? const <CategoryModel>[];

        if (categories.isEmpty) {
          return const SizedBox.shrink();
        }

        return SizedBox(
          height: 90,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            separatorBuilder: (context, index) => const SizedBox(width: 16),
            itemBuilder: (context, index) {
              final category = categories[index];
              return CategoriesListItem(category: category);
            },
          ),
        );
      },
    );
  }
}
