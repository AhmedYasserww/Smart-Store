import '../entities/get_cart_entity.dart';

class CartModel extends GetCartEntity {
  CartModel({
    required super.cartId,
    required super.totalItems,
    required super.totalPrice,
    required super.items,
    required super.createdAt,
    required super.updatedAt,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      cartId: json['cartId'],
      totalItems: json['totalItems'],
      totalPrice: (json['totalPrice'] as num).toDouble(),
      items: (json['items'] as List)
          .map((e) => CartItemDetailsModel.fromJson(e))
          .toList(),
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}

class CartItemDetailsModel extends CartItemDetailsEntity {
  CartItemDetailsModel({
    required super.id,
    required super.productId,
    required super.quantity,
    required super.color,
    required super.size,
    required super.productName,
    required super.productImageUrl,
    required super.createdAt,
    required super.unitPrice,
  });

  factory CartItemDetailsModel.fromJson(Map<String, dynamic> json) {
    return CartItemDetailsModel(
      id: json['id'],
      productId: json['productId'],
      quantity: json['quantity'],
      color: json['color'],
      size: json['size'],
      productName: json['poductName'],
      productImageUrl: json['productImageUrl'],
      createdAt: json['createdAt'],
      unitPrice: (json['unitPrice'] as num).toDouble(),
    );
  }
}