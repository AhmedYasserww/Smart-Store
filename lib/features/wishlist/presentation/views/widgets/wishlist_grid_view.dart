import 'package:flutter/material.dart';
import 'package:smart_store/features/wishlist/data/entities/wishlist_entity.dart';
import 'package:smart_store/features/wishlist/presentation/views/widgets/wishlist_product_card.dart';

class WishlistGrid extends StatelessWidget {
  const WishlistGrid({super.key, required this.items});

  final List<WishlistItemEntity> items;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 16,
        childAspectRatio: 0.65,
      ),
      itemCount: items.length,
      itemBuilder: (_, index) {
        return WishlistProductCard(item: items[index]);
      },
    );
  }
}