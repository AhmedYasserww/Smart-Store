import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/add_to_cart_item_entity.dart';

abstract class CartRepo {
  Future<Either<Failure, String>> addToCart({
    required AddToCartItemEntity cartItemEntity,
  });

  Future<Either<Failure, String>> deleteFromCart({required String productId});
}