import 'package:flutter/material.dart';
import 'package:smart_store/features/products/presentation/views/widgets/product_details_view_body.dart';
import 'package:smart_store/features/products/presentation/views/widgets/product_details_widgets/product_details_app_bar.dart';
class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  static const String routeName = 'product-details_view';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ProductDetailsAppBar(),
      body: ProductDetailsViewBody(),
    );
  }
}
