
import 'package:flutter/material.dart';
import '../../../../../../core/utils/app_style.dart';

class RecommendedList extends StatelessWidget {
  const RecommendedList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Recommended to you', style: AppStyle.styleSemiBold18),
        const SizedBox(height: 16),

        SizedBox(
          height: 90,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              return GestureDetector(
                onTap: () {},
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),

                  child: Image.asset(
                    "assets/images/dress_test.jpg",
                    width: 80,
                    height: 90,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
            separatorBuilder: (_, __) => const SizedBox(width: 16),
            itemCount: 10,
          ),
        ),
      ],
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:smart_store/core/helper_functions/save_user_data.dart';
// import 'package:smart_store/core/service_locator/service_locator.dart';
// import 'package:smart_store/core/widgets/custom_cached_network_image.dart';
// import 'package:smart_store/core/widgets/custom_loading_indicator.dart';
// import 'package:smart_store/features/products/data/models/product_model.dart';
// import 'package:smart_store/features/products/data/repos/product_repo_imp.dart';
// import 'package:smart_store/features/products/presentation/views/product_details_view.dart';
//
// import '../../../../../../core/utils/app_style.dart';
//
// class RecommendedList extends StatelessWidget {
//   const RecommendedList({super.key});
//
//   Future<List<ProductModel>> _loadRecentlyViewed() async {
//     final userData = await UserPreferences.getUserData();
//     final accessToken = (userData['accessToken'] as String?) ?? '';
//     final fallbackToken = await UserPreferences.getToken();
//     final token = accessToken.isNotEmpty ? accessToken : fallbackToken;
//
//     final result = await getIt
//         .get<ProductsRepoImpl>()
//         .getRecentlyViewedProducts(token: token.isEmpty ? null : token);
//
//     return result.fold((_) => <ProductModel>[], (products) => products);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text('Recently viewed', style: AppStyle.styleSemiBold18),
//         const SizedBox(height: 16),
//         FutureBuilder<List<ProductModel>>(
//           future: _loadRecentlyViewed(),
//           builder: (context, snapshot) {
//             final products = snapshot.data ?? const <ProductModel>[];
//
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return const SizedBox(
//                 height: 90,
//                 child: CustomLoadingIndicator(),
//               );
//             }
//
//             if (products.isEmpty) {
//               return Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 8),
//                 child: Text(
//                   'No recently viewed products yet.',
//                   style: AppStyle.styleGreyRegular14,
//                 ),
//               );
//             }
//
//             return SizedBox(
//               height: 90,
//               child: ListView.separated(
//                 scrollDirection: Axis.horizontal,
//                 itemBuilder: (_, index) {
//                   final product = products[index];
//                   return GestureDetector(
//                     onTap: () {
//                       Navigator.of(context).pushNamed(
//                         ProductDetailsView.routeName,
//                         arguments: product.id,
//                       );
//                     },
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(8),
//                       child: CustomCachedNetworkImage(
//                         path: product.productImages.isNotEmpty
//                             ? product.productImages.first.images
//                             : '',
//                         width: 80,
//                         height: 90,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   );
//                 },
//                 separatorBuilder: (_, __) => const SizedBox(width: 16),
//                 itemCount: products.length,
//               ),
//             );
//           },
//         ),
//       ],
//     );
//   }
// }
