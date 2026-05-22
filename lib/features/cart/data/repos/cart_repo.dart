import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/add_to_cart_item_entity.dart';
import '../entities/get_cart_entity.dart';

abstract class CartRepo {
  Future<Either<Failure, String>> addToCart({
    required AddToCartItemEntity cartItemEntity,
  });
  Future<Either<Failure, GetCartEntity>> getCart();
  Future<Either<Failure, String>> deleteFromCart({required String productId});
  Future<Either<Failure, GetCartEntity>> updateCartItemQuantity({
    required String cartItemId,
    required int quantity,
  });
  Future<Either<Failure, String>> clearCart();

}