// features/payment/data/repos/payment_repo.dart
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entites/payment_intent_entity.dart';

abstract class PaymentRepo {
  Future<Either<Failure, PaymentIntentEntity>> getClientSecret({
    required String deliveryAddressId,
    required String deliveryOptionId,
  });
}