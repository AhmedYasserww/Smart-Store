// features/orders/data/models/order_model.dart
import '../entities/order_entity.dart';

class OrderModel extends OrderEntity {
  OrderModel({
    required super.id,
    required super.orderCode,
    required super.status,
    required super.clientName,
    required super.createdAt,
    required super.total,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'] ?? '',
      orderCode: json['orderCode'] ?? '',
      status: json['status'] ?? '',
      clientName: json['clientName'] ?? '',
      createdAt: json['createdAt'] ?? '',
      total: (json['total'] as num).toDouble(),
    );
  }
}

class OrdersResponseModel extends OrdersResponseEntity {
  OrdersResponseModel({
    required super.items,
    required super.hasNextPage,
    required super.hasPreviousPages,
    required super.totalPage,
  });

  factory OrdersResponseModel.fromJson(Map<String, dynamic> json) {
    return OrdersResponseModel(
      items: (json['items'] as List)
          .map((e) => OrderModel.fromJson(e))
          .toList(),
      hasNextPage: json['hasNextPage'] ?? false,
      hasPreviousPages: json['hasPreviousPages'] ?? false,
      totalPage: json['totalPage'] ?? 1,
    );
  }
}