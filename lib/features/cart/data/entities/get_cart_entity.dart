class GetCartEntity {
  final String cartId;
  final int totalItems;
  final double totalPrice;
  final List<CartItemDetailsEntity> items;
  final String createdAt;
  final String updatedAt;

  GetCartEntity({
    required this.cartId,
    required this.totalItems,
    required this.totalPrice,
    required this.items,
    required this.createdAt,
    required this.updatedAt,
  });
}

class CartItemDetailsEntity {
  final String id;
  final String productId;
  final int quantity;
  final String color;
  final String size;
  final double unitPrice;
  final String productName;
  final String productImageUrl;
  final String createdAt;
  final int stockQuantity;

  CartItemDetailsEntity({
    required this.id,
    required this.productId,
    required this.quantity,
    required this.color,
    required this.size,
    required this.productName,
    required this.productImageUrl,
    required this.createdAt,
    required this.unitPrice, required this.stockQuantity,
  });
}