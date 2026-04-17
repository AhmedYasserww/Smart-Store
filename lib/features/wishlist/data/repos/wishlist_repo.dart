
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/wishlist_entity.dart';

abstract class WishlistRepo {
  Future<Either<Failure, WishlistEntity>> getWishlist();
  Future<Either<Failure, String>> addToWishlist({required String productId});
  Future<Either<Failure, String>> removeFromWishlist({required String itemId});
}