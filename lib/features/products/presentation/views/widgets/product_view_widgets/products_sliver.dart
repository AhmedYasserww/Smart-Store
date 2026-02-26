import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_store/features/products/presentation/views/widgets/product_view_widgets/product_of_list_card.dart';

import '../../../../../home/presentation/views/widgets/product_card.dart';
import '../../../../data/product_or_list_cubit/product_or_list_cubit.dart';
class ProductsSliver extends StatelessWidget {
  const ProductsSliver({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductOrListCubit, ProductOrListState>(
      builder: (context, state) {
        if (state is ProductOrListProduct) {
          return SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 16,
              childAspectRatio: 0.65,
            ),
            delegate: SliverChildBuilderDelegate(
              (_, __) => const ProductCard(),
              childCount: 10,
            ),
          );
        } else if (state is ProductOrList) {
          return SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: ProductOfListCard(),
              );
            }, childCount: 10),
          );
        }
        return const SliverToBoxAdapter(child: SizedBox());
      },
    );
  }
}
