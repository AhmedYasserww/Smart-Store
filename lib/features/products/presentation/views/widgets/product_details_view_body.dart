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

class ProductDetailsViewBody extends StatefulWidget {
  const ProductDetailsViewBody({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  State<ProductDetailsViewBody> createState() => _ProductDetailsViewBodyState();
}

class _ProductDetailsViewBodyState extends State<ProductDetailsViewBody> {
  int selectedStockQuantity = 0;

  @override
  void initState() {
    super.initState();
    if (widget.productModel.productSizes.isNotEmpty) {
      selectedStockQuantity = widget.productModel.productSizes[0].quantity;
    } else {
      selectedStockQuantity = widget.productModel.stockQuantity;
    }
  }

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
                    productImages: widget.productModel.productImages,
                  ),
                  const SizedBox(height: 16),
                  ProductTitleSection(title: widget.productModel.name),
                  const SizedBox(height: 16),
                  ProductRatingAndPriceSection(
                    rating: widget.productModel.rating,
                    reviews: widget.productModel.reviews,
                    price: widget.productModel.price,
                  ),
                  const SizedBox(height: 24),
                  ColorSelector(colors: widget.productModel.colors),
                  const SizedBox(height: 16),
                  SizeSelector(
                    productSizes: widget.productModel.productSizes,
                    onSizeSelected: (selectedSize) {
                      setState(() {
                        selectedStockQuantity = selectedSize.quantity;
                      });
                    },
                  ),
                  const SizedBox(height: 24),
                  QuantitySelector(maxQuantity: selectedStockQuantity),
                  const SizedBox(height: 24),
                  DescriptionSection(description: widget.productModel.description),
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