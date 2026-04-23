// features/order/data/repos/order_repo.dart

import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/create_order_entity.dart';

abstract class OrderRepo {
  Future<Either<Failure, CreateOrderEntity>> createOrder({
    required String addressId,
    required String deliveryOption,
  });
}