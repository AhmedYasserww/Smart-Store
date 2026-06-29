import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_store/core/service_locator/service_locator.dart';
import 'package:smart_store/core/widgets/custom_loading_indicator.dart';
import 'package:smart_store/features/cart/data/repos/cart_repo_imp.dart';
import 'package:smart_store/features/cart/presentation/manager/add_to_cart_cubit/add_to_cart_cubit.dart';
import 'package:smart_store/features/products/data/repos/product_repo_imp.dart';
import 'package:smart_store/features/products/presentation/manager/get_recommendations_cubit/get_recommendations_cubit.dart';
import 'package:smart_store/features/products/presentation/views/widgets/product_details_view_body.dart';
import 'package:smart_store/features/products/presentation/views/widgets/product_details_widgets/product_details_app_bar.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({
    super.key,
    required this.productId,
  });

  static const String routeName = 'product-details_view';

  final String productId;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getIt.get<ProductsRepoImpl>().getProductById(id: productId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            appBar: ProductDetailsAppBar(
              title: 'Product',
            ),
            body: CustomLoadingIndicator(),
          );
        }

        if (!snapshot.hasData) {
          return const Scaffold(
            appBar: ProductDetailsAppBar(
              title: 'Product',
            ),
            body: Center(
              child: Text('Failed to load product details.'),
            ),
          );
        }

        return snapshot.data!.fold(
              (failure) => Scaffold(
            appBar: const ProductDetailsAppBar(
              title: 'Product',
            ),
            body: Center(
              child: Text(failure.errorMessage),
            ),
          ),
              (product) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) => AddToCartCubit(
                  getIt.get<CartRepoImpl>(),
                ),
              ),
              BlocProvider(
                create: (_) => GetRecommendationsCubit(
                  getIt.get<ProductsRepoImpl>(),
                )..getRecommendations(
                  productId: product.id,
                  imageId: product.productImages.isNotEmpty
                      ? product.productImages.first.id
                      : '',
                ),
              ),
            ],
            child: Scaffold(
              appBar: ProductDetailsAppBar(
                title: product.name,
                productId: product.id,
              ),
              body: ProductDetailsViewBody(
                productModel: product,
              ),
            ),
          ),
        );
      },
    );
  }
}