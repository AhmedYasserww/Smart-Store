import 'package:flutter/material.dart';
import 'package:smart_store/core/widgets/custom_cached_network_image.dart';
import 'package:smart_store/features/home/data/models/product_home_model.dart';
import 'package:smart_store/features/home/presentation/views/widgets/recently_product_info_widget.dart';
import 'package:smart_store/features/products/presentation/views/product_details_view.dart';
import '../../../../products/presentation/views/widgets/product_view_widgets/favorite_button.dart';

class RecentlyViewedProductCard extends StatelessWidget {
  const RecentlyViewedProductCard({super.key, required this.productModel});
  final HomeProductModel productModel;

  final double cardWidth = 196;
  final double imageHeight = 150;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(
          context,
        ).pushNamed(ProductDetailsView.routeName, arguments: productModel.id);
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
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 12,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16),
              ),
              child: SizedBox(
                height: imageHeight,
                width: cardWidth,
                child: Stack(
                  children: [
                    CustomCachedNetworkImage(
                      path: productModel.imageUrl,
                      width: double.infinity,
                      height: imageHeight,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: FavoriteButton(productId: productModel.id),
                    ),
                  ],
                ),
              ),
            ),
            RecentlyProductInfoWidget(productModel: productModel),
          ],
        ),
      ),
    );
  }
}
