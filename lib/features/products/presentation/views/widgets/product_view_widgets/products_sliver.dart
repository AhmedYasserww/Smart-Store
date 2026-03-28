import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_store/features/products/presentation/views/widgets/product_view_widgets/product_of_list_card.dart';

import '../../../../../home/presentation/views/widgets/product_card.dart';
import '../../../../data/product_or_list_cubit/product_or_list_cubit.dart';
import '../../../manager/get_all_product_cubit.dart';

class ProductsSliver extends StatelessWidget {
  const ProductsSliver({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetAllProductCubit, GetAllProductState>(
      listener: (context, state) {
        if (state is GetAllProductFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      builder: (context, productState) {
        if (productState is GetAllProductLoading) {
          return const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
        }

        if (productState is GetAllProductSuccess) {
          final products = productState.products;

          if (products.isEmpty) {
            return const SliverFillRemaining(
              hasScrollBody: false,
              child: Center(
                child: Text(
                  'No products match your current filters. Try adjusting them.',
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }

          return BlocBuilder<ProductOrListCubit, ProductOrListState>(
            builder: (context, viewState) {
              // ✅ Grid View
              if (viewState is ProductOrListProduct) {
                return SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.65,
                  ),
                  delegate: SliverChildBuilderDelegate((_, index) {
                    return ProductCard(
                      productModel: products[index], // 🔥 الداتا الحقيقية
                    );
                  }, childCount: products.length),
                );
              }
              // ✅ List View
              else if (viewState is ProductOrList) {
                return SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: ProductOfListCard(
                        productModel: products[index], // 🔥 الداتا الحقيقية
                      ),
                    );
                  }, childCount: products.length),
                );
              }

              return const SliverToBoxAdapter(child: SizedBox());
            },
          );
        }

        return const SliverToBoxAdapter(child: SizedBox());
      },
    );
  }
}
