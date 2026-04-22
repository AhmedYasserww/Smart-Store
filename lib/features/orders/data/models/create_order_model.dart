// features/order/data/models/create_order_model.dart

import '../entities/create_order_entity.dart';

class CreateOrderModel extends CreateOrderEntity {
  CreateOrderModel({required super.orderId});

  factory CreateOrderModel.fromJson(Map<String, dynamic> json) {
    return CreateOrderModel(orderId: json['orderId'] ?? '');
  }
}