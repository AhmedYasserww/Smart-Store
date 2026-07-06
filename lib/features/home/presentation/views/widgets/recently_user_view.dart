import 'package:flutter/material.dart';
import 'package:smart_store/core/helper_functions/save_user_data.dart';
import 'package:smart_store/core/service_locator/service_locator.dart';
import 'package:smart_store/core/widgets/custom_cached_network_image.dart';
import 'package:smart_store/core/widgets/custom_loading_indicator.dart';
import 'package:smart_store/features/products/data/models/product_model.dart';
import 'package:smart_store/features/products/data/repos/product_repo_imp.dart';
import 'package:smart_store/features/products/presentation/views/product_details_view.dart';

import '../../../../../core/utils/app_style.dart';

class RecentlyUserView extends StatelessWidget {
  const RecentlyUserView({super.key});

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
          return CustomLoadingIndicator();
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
          height: 180,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            separatorBuilder: (context, index) => const SizedBox(width: 12),
            itemBuilder: (_, index) {
              final product = products[index];
              return InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    ProductDetailsView.routeName,
                    arguments: product.id,
                  );
                },
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  width: 124,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFFE5E5E5)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(12),
                        ),
                        child: CustomCachedNetworkImage(
                          path: product.productImages.isNotEmpty
                              ? product.productImages.first.images
                              : '',
                          width: 124,
                          height: 110,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: AppStyle.styleMedium14,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '\$${product.price.toStringAsFixed(2)}',
                              style: AppStyle.styleBold14,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}