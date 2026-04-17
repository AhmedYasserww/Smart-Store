import 'package:flutter/material.dart';
import 'package:smart_store/core/helper_functions/save_user_data.dart';
import 'package:smart_store/core/service_locator/service_locator.dart';
import 'package:smart_store/core/widgets/custom_loading_indicator.dart';
import 'package:smart_store/features/products/data/models/product_model.dart';
import 'package:smart_store/features/products/data/repos/product_repo_imp.dart';
import 'package:smart_store/features/home/presentation/views/widgets/product_card.dart';
import '../../../../../core/utils/app_style.dart';

class RecentlyViewedHomeList extends StatelessWidget {
  const RecentlyViewedHomeList({super.key});

  Future<List<ProductModel>> _loadRecentlyViewed() async {
    final userData = await UserPreferences.getUserData();
    final accessToken = (userData['accessToken'] as String?) ?? '';
    final fallbackToken = await UserPreferences.getToken();
    final token = accessToken.isNotEmpty ? accessToken : fallbackToken;

    final result = await getIt
        .get<ProductsRepoImpl>()
        .getRecentlyViewedProducts(token: token.isEmpty ? null : token);

    return result.fold((_) => <ProductModel>[], (products) => products);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ProductModel>>(
      future: _loadRecentlyViewed(),
      builder: (context, snapshot) {
        final products = snapshot.data ?? const <ProductModel>[];

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox(
            height: 180,
            child: CustomLoadingIndicator(),
          );
        }

        if (products.isEmpty) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              'No recently viewed products yet.',
              style: AppStyle.styleGreyRegular14,
            ),
          );
        }

        return SizedBox(
          height: 270,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (_, index) {
              return SizedBox(
               // width: 160,
                child: ProductCard(productModel: products[index]),
              );
            },
          ),
        );
      },
    );
  }
}