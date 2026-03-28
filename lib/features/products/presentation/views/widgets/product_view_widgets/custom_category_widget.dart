import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_store/core/service_locator/service_locator.dart';
import 'package:smart_store/features/categories/data/models/category_model.dart';
import 'package:smart_store/features/categories/data/repos/categories_repo_imp.dart';
import 'package:smart_store/features/products/presentation/manager/get_all_product_cubit.dart';

import '../../../../../../core/utils/app_style.dart';

class _CategoryOption {
  const _CategoryOption({required this.label, this.id});

  final String label;
  final String? id;
}

class CustomCategoryWidget extends StatefulWidget {
  const CustomCategoryWidget({super.key});

  @override
  State<CustomCategoryWidget> createState() => _CustomCategoryWidgetState();
}

class _CustomCategoryWidgetState extends State<CustomCategoryWidget> {
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

  List<_CategoryOption> _buildOptions(List<CategoryModel> categories) {
    final options = <_CategoryOption>[const _CategoryOption(label: 'All')];

    for (final category in categories) {
      if (category.id.isEmpty) continue;
      options.add(_CategoryOption(id: category.id, label: category.name));
    }

    return options;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CategoryModel>>(
      future: _categoriesFuture,
      builder: (context, snapshot) {
        final categories = snapshot.data ?? const <CategoryModel>[];

        return BlocBuilder<GetAllProductCubit, GetAllProductState>(
          builder: (context, state) {
            final cubit = context.read<GetAllProductCubit>();
            final options = _buildOptions(categories);
            final selectedCategoryId = cubit.currentParams.categoryId;
            final calculatedIndex = selectedCategoryId == null
                ? 0
                : options.indexWhere((e) => e.id == selectedCategoryId);
            final selectedIndex = calculatedIndex < 0 ? 0 : calculatedIndex;

            return SizedBox(
              height: 36,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final option = options[index];
                  final isSelected = index == selectedIndex;

                  return GestureDetector(
                    onTap: () {
                      final updatedParams = option.id == null
                          ? cubit.currentParams.copyWith(clearCategoryId: true)
                          : cubit.currentParams.copyWith(categoryId: option.id);

                      cubit.fetchAllProducts(params: updatedParams);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color(0xFF5D3A82)
                            : const Color(0xFFF9FAFA),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        child: Center(
                          child: Text(
                            option.label,
                            style: isSelected
                                ? AppStyle.styleMedium14.copyWith(
                                    color: const Color(0xFFFFFFFF),
                                  )
                                : AppStyle.styleMedium14,
                          ),
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(width: 8),
                itemCount: options.length,
              ),
            );
          },
        );
      },
    );
  }
}
