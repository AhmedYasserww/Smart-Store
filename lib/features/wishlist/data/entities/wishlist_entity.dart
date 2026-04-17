// features/wishlist/data/entities/wishlist_entity.dart

import '../../../products/data/models/product_model.dart';

class WishlistEntity {
  final String id;
  final String clientId;
  final String createdAt;
  final String lastUpdated;
  final List<WishlistItemEntity> items;

  WishlistEntity({
    required this.id,
    required this.clientId,
    required this.createdAt,
    required this.lastUpdated,
    required this.items,
  });
}

class WishlistItemEntity {
  final String id;
  final String addedAt;
  final ProductModel product;

  WishlistItemEntity({
    required this.id,
    required this.addedAt,
    required this.product,
  });
}