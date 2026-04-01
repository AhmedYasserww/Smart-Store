import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/cart_item_entity.dart';

abstract class CartRepo {
  Future<Either<Failure, String>> addToCart({
    required CartItemEntity cartItemEntity,
  });

  Future<Either<Failure, String>> deleteFromCart({required String productId});
}