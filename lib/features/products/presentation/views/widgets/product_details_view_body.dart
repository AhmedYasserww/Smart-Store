import 'package:flutter/material.dart';
import 'package:smart_store/core/utils/app_color.dart';
import 'package:smart_store/core/widgets/custom_button.dart';
import 'package:smart_store/features/products/data/models/product_model.dart';
import 'package:smart_store/features/products/presentation/views/widgets/product_details_widgets/color_selector.dart';
import 'package:smart_store/features/products/presentation/views/widgets/product_details_widgets/description_section.dart';
import 'package:smart_store/features/products/presentation/views/widgets/product_details_widgets/product_image_section.dart';
import 'package:smart_store/features/products/presentation/views/widgets/product_details_widgets/product_raiting_and_price_section.dart';
import 'package:smart_store/features/products/presentation/views/widgets/product_details_widgets/product_title_section.dart';
import 'package:smart_store/features/products/presentation/views/widgets/product_details_widgets/quantity_selector.dart';
import 'package:smart_store/features/products/presentation/views/widgets/product_details_widgets/recomended_list_view.dart';
import 'package:smart_store/features/products/presentation/views/widgets/product_details_widgets/size_selector.dart';

import '../../../../../core/utils/app_dimensions.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.homeScreenPadding,
      ),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 32),
                  ProductImagesSection(
                    productImages: productModel.productImages,
                  ),
                  SizedBox(height: 16),
                  ProductTitleSection(title: productModel.name),
                  SizedBox(height: 16),
                  ProductRatingAndPriceSection(
                    rating: productModel.rating,
                    reviews: productModel.reviews,
                    price: productModel.price,
                  ),
                  SizedBox(height: 24),
                  const ColorSelector(),
                  SizedBox(height: 16,),
                  SizeSelector(productSizes: productModel.productSizes),
                  const SizedBox(height: 24),
                  QuantitySelector(stockQuantity: productModel.stockQuantity),
                  const SizedBox(height: 24),
                  DescriptionSection(description: productModel.description),
                  const SizedBox(height: 24),
                  const RecommendedList(),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
          SafeArea(
            child: CustomButton(
              text: " Add to cart",
              onTap: () {},
              buttonColor: AppColors.primaryTextColor,
            ),
          ),
          const SizedBox(height: 4),
        ],
      ),
    );
  }
}
