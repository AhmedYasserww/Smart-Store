// features/orders/data/entities/order_entity.dart
class OrderEntity {
  final String id;
  final String orderCode;
  final String status;
  final String clientName;
  final String createdAt;
  final double total;

  OrderEntity({
    required this.id,
    required this.orderCode,
    required this.status,
    required this.clientName,
    required this.createdAt,
    required this.total,
  });
}

class OrdersResponseEntity {
  final List<OrderEntity> items;
  final bool hasNextPage;
  final bool hasPreviousPages;
  final int totalPage;

  OrdersResponseEntity({
    required this.items,
    required this.hasNextPage,
    required this.hasPreviousPages,
    required this.totalPage,
  });
}