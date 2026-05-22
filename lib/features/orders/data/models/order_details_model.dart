// features/orders/data/models/order_details_model.dart
import '../entities/order_details_entity.dart';

class OrderDetailsModel extends OrderDetailsEntity {
  OrderDetailsModel({
    required super.id,
    required super.status,
    required super.shippingFee,
    required super.discount,
    required super.totalPrice,
    required super.orderCode,
    required super.shippingAddress,
    required super.createdAt,
    required super.orderItems,
    required super.deliveryAddress,
    required super.deliveryOption,
  });

  factory OrderDetailsModel.fromJson(Map<String, dynamic> json) {
    return OrderDetailsModel(
      id: json['id'] ?? '',
      status: json['status'] ?? '',
      shippingFee: (json['shippingFee'] as num).toDouble(),
      discount: (json['discount'] as num).toDouble(),
      totalPrice: (json['totalPrice'] as num).toDouble(),
      orderCode: json['orderCode'] ?? '',
      shippingAddress: json['shippingAddress'] ?? '',
      createdAt: json['createdAt'] ?? '',
      orderItems: (json['orderItems'] as List)
          .map((e) => OrderItemModel.fromJson(e))
          .toList(),
      deliveryAddress: OrderDeliveryAddressModel.fromJson(json['deliveryAddress']),
      deliveryOption: OrderDeliveryOptionModel.fromJson(json['deleveryOptions']),
    );
  }
}

class OrderItemModel extends OrderItemEntity {
  OrderItemModel({
    required super.id,
    required super.productId,
    required super.productName,
    required super.quantity,
    required super.color,
    required super.size,
    required super.imageUrl,
    required super.itemPrice,
    required super.totalPrice,
  });

  factory OrderItemModel.fromJson(Map<String, dynamic> json) {
    return OrderItemModel(
      id: json['id'] ?? '',
      productId: json['productId'] ?? '',
      productName: json['productName'] ?? '',
      quantity: json['quantity'] ?? 0,
      color: json['color'] ?? '',
      size: json['size'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      itemPrice: (json['itemPrice'] as num).toDouble(),
      totalPrice: (json['totalPrice'] as num).toDouble(),
    );
  }
}

class OrderDeliveryAddressModel extends OrderDeliveryAddressEntity {
  OrderDeliveryAddressModel({
    required super.fullName,
    required super.phoneNumber,
    required super.city,
    required super.street,
    required super.building,
    required super.apartment,
  });

  factory OrderDeliveryAddressModel.fromJson(Map<String, dynamic> json) {
    return OrderDeliveryAddressModel(
      fullName: json['fullName'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      city: json['city'] ?? '',
      street: json['street'] ?? '',
      building: json['building'] ?? '',
      apartment: json['apartment'] ?? '',
    );
  }
}

class OrderDeliveryOptionModel extends OrderDeliveryOptionEntity {
  OrderDeliveryOptionModel({
    required super.name,
    required super.shippingFee,
    required super.minDays,
    required super.maxDays,
  });

  factory OrderDeliveryOptionModel.fromJson(Map<String, dynamic> json) {
    return OrderDeliveryOptionModel(
      name: json['name'] ?? '',
      shippingFee: (json['shopingFee'] as num).toDouble(),
      minDays: json['minDays'] ?? 0,
      maxDays: json['maxDays'] ?? 0,
    );
  }
}