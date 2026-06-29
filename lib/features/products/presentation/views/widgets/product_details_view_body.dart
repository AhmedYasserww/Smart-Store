import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_store/core/utils/app_color.dart';
import 'package:smart_store/core/widgets/custom_button.dart';
import 'package:smart_store/features/cart/data/entities/add_to_cart_item_entity.dart';
import 'package:smart_store/features/products/data/models/product_model.dart';
import 'package:smart_store/features/products/presentation/views/widgets/product_details_widgets/color_selector.dart';
import 'package:smart_store/features/products/presentation/views/widgets/product_details_widgets/description_section.dart';
import 'package:smart_store/features/products/presentation/views/widgets/product_details_widgets/product_image_section.dart';
import 'package:smart_store/features/products/presentation/views/widgets/product_details_widgets/product_raiting_and_price_section.dart';
import 'package:smart_store/features/products/presentation/views/widgets/product_details_widgets/product_title_section.dart';
import 'package:smart_store/features/products/presentation/views/widgets/product_details_widgets/quantity_selector.dart';
import 'package:smart_store/features/products/presentation/views/widgets/product_details_widgets/recomended_list_view.dart';
import 'package:smart_store/features/products/presentation/views/widgets/product_details_widgets/size_selector.dart';
import '../../../../../core/helper_functions/show_snack_bar.dart';
import '../../../../../core/utils/app_dimensions.dart';
import '../../../../cart/presentation/manager/add_to_cart_cubit/add_to_cart_cubit.dart';

class ProductDetailsViewBody extends StatefulWidget {
  const ProductDetailsViewBody({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  State<ProductDetailsViewBody> createState() => _ProductDetailsViewBodyState();
}

class _ProductDetailsViewBodyState extends State<ProductDetailsViewBody> {
  int selectedStockQuantity = 0;
  int selectedQuantity = 1;
  String? selectedColor;
  String? selectedSize;

  @override
  void initState() {
    super.initState();
    if (widget.productModel.productSizes.isNotEmpty) {
      selectedStockQuantity = widget.productModel.productSizes[0].quantity;
      selectedSize = widget.productModel.productSizes[0].sizeName;
    } else {
      selectedStockQuantity = widget.productModel.stockQuantity;
    }
    if (widget.productModel.colors.isNotEmpty) {
      selectedColor = widget.productModel.colors[0];
    }
  }


  @override
  Widget build(BuildContext context) {
    return BlocListener<AddToCartCubit, AddToCartState>(
      listener: (context, state) {
        if (state is AddToCartSuccess) {
          showSnackBar(context, message: state.message, isSuccess: true);
        } else if (state is AddToCartFailure) {
          showSnackBar(context,
              message: state.errorMessage, isSuccess: false);
        }
      },
      child: Padding(
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
                    ProductTitleSection(
                      title: widget.productModel.name,
                      garmentUrl: widget.productModel.productImages.isNotEmpty
                          ? widget.productModel.productImages.first.images
                          : '',
                      subCategory: widget.productModel.subCategory,
                    ),
                    const SizedBox(height: 16),
                    ProductRatingAndPriceSection(
                      rating: widget.productModel.rating,
                      reviews: widget.productModel.reviews,
                      price: widget.productModel.price,
                    ),
                    const SizedBox(height: 24),
                    ColorSelector(
                      colors: widget.productModel.colors,
                      onColorSelected: (color) {
                        selectedColor = color;
                      },
                    ),
                    const SizedBox(height: 16),
                    SizeSelector(
                      productSizes: widget.productModel.productSizes,
                      onSizeSelected: (selectedSize) {
                        setState(() {
                          selectedStockQuantity = selectedSize.quantity;
                          this.selectedSize = selectedSize.sizeName;
                        });
                      },
                    ),
                    const SizedBox(height: 24),
                    QuantitySelector(
                      maxQuantity: selectedStockQuantity,
                      onQuantityChanged: (qty) {
                        selectedQuantity = qty;
                      },
                    ),
                    const SizedBox(height: 24),
                    DescriptionSection(
                        description: widget.productModel.description),
                    const SizedBox(height: 24),
                    const RecommendedList(),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
            SafeArea(
              child: BlocBuilder<AddToCartCubit, AddToCartState>(
                builder: (context, state) {
                  return CustomButton(
                    isLoading: state is AddToCartLoading,

                    text: 'Add to Cart',
                    onTap: () {
                      if (selectedColor == null) {
                        showSnackBar(context,
                            message: "Please select a color",
                            isSuccess: false);
                        return;
                      }
                      if (selectedSize == null &&
                          widget.productModel.productSizes.isNotEmpty) {
                        showSnackBar(context,
                            message: "Please select a size",
                            isSuccess: false);
                        return;
                      }
                      context.read<AddToCartCubit>().addToCart(
                        cartItem: AddToCartItemEntity(
                          productId: widget.productModel.id,
                          quantity: selectedQuantity,
                          color: selectedColor ?? '',
                          size: selectedSize ?? '',
                        ),
                      );
                    },
                    buttonColor: AppColors.primaryTextColor,
                  );
                },
              ),
            ),
            const SizedBox(height: 4),
          ],
        ),
      ),
    );
  }
}