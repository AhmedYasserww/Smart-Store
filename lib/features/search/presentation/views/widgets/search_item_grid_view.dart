import 'package:flutter/material.dart';
import '../../../../products/data/models/product_model.dart';
import 'search_item.dart';

class SearchItemGridView extends StatelessWidget {
  const SearchItemGridView({
    super.key,
    required this.products,
  });

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: products.length,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 16,
        childAspectRatio: 0.65,
      ),
      itemBuilder: (context, index) {
        return SearchItem(
          productModel: products[index],
        );
      },
    );
  }
}