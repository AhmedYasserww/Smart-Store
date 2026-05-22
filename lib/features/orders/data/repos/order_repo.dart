// features/order/data/repos/order_repo.dart

import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/create_order_entity.dart';
import '../entities/order_details_entity.dart';

abstract class OrderRepo {
  Future<Either<Failure, CreateOrderEntity>> createOrder({
    required String deliveryAddressId,
    required String deliveryOptionId,
  });

  Future<Either<Failure, OrderDetailsEntity>> getOrderDetails({
    required String orderId,
  });
}