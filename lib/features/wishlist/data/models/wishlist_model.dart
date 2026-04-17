
import '../../../products/data/models/product_model.dart';
import '../entities/wishlist_entity.dart';
class WishlistModel extends WishlistEntity {
  WishlistModel({
    required super.id,
    required super.clientId,
    required super.createdAt,
    required super.lastUpdated,
    required super.items,
  });

  factory WishlistModel.fromJson(Map<String, dynamic> json) {
    return WishlistModel(
      id: json['id'] ?? '',
      clientId: json['clientId'] ?? '',
      createdAt: json['createdAt'] ?? '',
      lastUpdated: json['lastUpdated'] ?? '',
      items: (json['items'] as List<dynamic>? ?? [])
          .map((e) => WishlistItemModel.fromJson(e))
          .toList(),
    );
  }
}

class WishlistItemModel extends WishlistItemEntity {
  WishlistItemModel({
    required super.id,
    required super.addedAt,
    required super.product,
  });

  factory WishlistItemModel.fromJson(Map<String, dynamic> json) {
    return WishlistItemModel(
      id: json['id'] ?? '',
      addedAt: json['addedAt'] ?? '',
      product: ProductModel.fromJson(json['product']),
    );
  }
}