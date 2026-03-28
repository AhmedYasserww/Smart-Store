import 'package:flutter/material.dart';
import 'package:smart_store/core/utils/app_color.dart';
import 'package:smart_store/features/home/presentation/views/widgets/product_info_card.dart';
import 'package:smart_store/features/products/data/models/product_model.dart';
import 'package:smart_store/features/products/presentation/views/product_details_view.dart';

import '../../../../../core/utils/app_images.dart';
class ProductCard extends StatefulWidget {
  const ProductCard({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isFavorite = false;

  final double cardWidth = 196;
  final double imageHeight = 150;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(ProductDetailsView.routeName);
      },
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: cardWidth,
        margin: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 12,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius:  BorderRadius.vertical(
                top: Radius.circular(16),
              ),
              child: SizedBox(
                height: imageHeight,
                width: cardWidth,
                child: Stack(
                  children: [
                    Image.network(
                      widget.productModel.productImages.isNotEmpty
                          ? widget.productModel.productImages.first.images
                          : "",
                      width: double.infinity,
                      height: imageHeight,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Icon(Icons.image_not_supported),
                    ),

                    Positioned(
                      top: 8,
                      right: 8,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isFavorite = !isFavorite;
                          });
                        },
                        child: Container(
                          width: 32,
                          height: 32,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: isFavorite
                                ? Colors.red
                                : AppColors.primaryTextColor,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
             ProductInfoWidget(
              productModel: widget.productModel,
            ),
          ],
        ),
      ),
    );
  }}



