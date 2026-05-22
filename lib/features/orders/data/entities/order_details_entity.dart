// features/orders/data/entities/order_details_entity.dart
class OrderDetailsEntity {
  final String id;
  final String status;
  final double shippingFee;
  final double discount;
  final double totalPrice;
  final String orderCode;
  final String shippingAddress;
  final String createdAt;
  final List<OrderItemEntity> orderItems;
  final OrderDeliveryAddressEntity deliveryAddress;
  final OrderDeliveryOptionEntity deliveryOption;

  OrderDetailsEntity({
    required this.id,
    required this.status,
    required this.shippingFee,
    required this.discount,
    required this.totalPrice,
    required this.orderCode,
    required this.shippingAddress,
    required this.createdAt,
    required this.orderItems,
    required this.deliveryAddress,
    required this.deliveryOption,
  });
}

class OrderItemEntity {
  final String id;
  final String productId;
  final String productName;
  final int quantity;
  final String color;
  final String size;
  final String imageUrl;
  final double itemPrice;
  final double totalPrice;

  OrderItemEntity({
    required this.id,
    required this.productId,
    required this.productName,
    required this.quantity,
    required this.color,
    required this.size,
    required this.imageUrl,
    required this.itemPrice,
    required this.totalPrice,
  });
}

class OrderDeliveryAddressEntity {
  final String fullName;
  final String phoneNumber;
  final String city;
  final String street;
  final String building;
  final String apartment;

  OrderDeliveryAddressEntity({
    required this.fullName,
    required this.phoneNumber,
    required this.city,
    required this.street,
    required this.building,
    required this.apartment,
  });
}

class OrderDeliveryOptionEntity {
  final String name;
  final double shippingFee;
  final int minDays;
  final int maxDays;

  OrderDeliveryOptionEntity({
    required this.name,
    required this.shippingFee,
    required this.minDays,
    required this.maxDays,
  });
}