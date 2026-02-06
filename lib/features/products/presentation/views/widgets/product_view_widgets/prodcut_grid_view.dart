import 'package:flutter/material.dart';

import '../../../../../home/presentation/views/widgets/product_card.dart';

class ProductGridView extends StatelessWidget {
  const ProductGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.6,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) => ProductCard(),
        childCount: 10,
      ),
    );
  }
}
