import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_store/core/widgets/custom_cached_network_image.dart';
import 'package:smart_store/features/home/presentation/views/widgets/product_info_card.dart';
import 'package:smart_store/features/products/presentation/views/product_details_view.dart';
import 'package:smart_store/features/wishlist/data/entities/wishlist_entity.dart';
import 'package:smart_store/features/wishlist/presentation/manager/get_wishlist_cubit/get_wishlist_cubit.dart';

class WishlistProductCard extends StatelessWidget {
  const WishlistProductCard({super.key, required this.item});

  final WishlistItemEntity item;

  static const double imageHeight = 150;

  @override
  Widget build(BuildContext context) {
    final product = item.product;

    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          ProductDetailsView.routeName,
          arguments: product.id,
        );
      },
      borderRadius: BorderRadius.circular(16),
      child: Container(
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
                width: double.infinity,
                child: Stack(
                  children: [
                    CustomCachedNetworkImage(
                      path: product.productImages.isNotEmpty
                          ? product.productImages.first.images
                          : "",
                      width: double.infinity,
                      height: imageHeight,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: GestureDetector(
                        onTap: () {
                          // ✅ حذف locally على طول
                          context
                              .read<GetWishlistCubit>()
                              .removeItemLocally(item.id);
                          // هنا هتضيف الـ API call بعدين
                        },
                        child: Container(
                          width: 32,
                          height: 32,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.favorite,
                            color: Colors.red,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ProductInfoWidget(productModel: product),
          ],
        ),
      ),
    );
  }
}