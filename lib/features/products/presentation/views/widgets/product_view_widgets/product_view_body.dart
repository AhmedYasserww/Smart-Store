import 'package:flutter/material.dart';
import 'package:smart_store/features/products/presentation/views/widgets/product_view_widgets/product_filter_widget.dart';
import 'package:smart_store/features/products/presentation/views/widgets/product_view_widgets/products_sliver.dart';

import '../../../../../../core/utils/app_color.dart';
import '../../../../../home/presentation/views/widgets/custom_search_field.dart';

class ProductViewBody extends StatelessWidget {
  const ProductViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          CustomSearchField(),
          SizedBox(height: 16),
          Divider(height: 0, color: AppColors.palletBorderColor),
          Expanded(
            child: CustomScrollView(
              slivers: [ProductFilterWidget(), ProductsSliver()],
            ),
          ),
        ],
      ),
    );
  }
}

