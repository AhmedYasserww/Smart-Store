import 'package:flutter/material.dart';
import 'package:smart_store/core/utils/app_color.dart';
import 'package:smart_store/core/widgets/custom_button.dart';
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
  const ProductDetailsViewBody({super.key});

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
                children: const [
                  SizedBox(height:32 ,),
                  ProductImagesSection(),
                  SizedBox(height: 16),
                  ProductTitleSection(),
                  SizedBox(height: 16),
                  ProductRatingAndPriceSection(),
                  SizedBox(height: 24),
                  ColorSelector(),
                  SizeSelector(),
                  SizedBox(height: 24,),
                  QuantitySelector(),
                  SizedBox(height: 24,),
                  DescriptionSection(),
                  SizedBox(height: 24,),
                  RecommendedList(),
                  SizedBox(height: 32),
                ],
              ),
            ),
          ),
          CustomButton(text: " Add to cart", onTap: (){},buttonColor: AppColors.primaryTextColor,),
          SizedBox(height: 24,)
        ],
      ),
    );
  }
}





