import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/services/api_service.dart';
import '../../../../core/services/end_points.dart';
import '../entities/add_to_cart_item_entity.dart';
import '../entities/get_cart_entity.dart';
import '../models/cart_model.dart';
import 'cart_repo.dart';

class CartRepoImpl implements CartRepo {
  final ApiService apiService;

  CartRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, String>> addToCart({
    required AddToCartItemEntity cartItemEntity,
  }) async {
    try {
      final response = await apiService.post(
        endPoint: EndPoints.addToCart,
        data: {
          "productId": cartItemEntity.productId,
          "quantity": cartItemEntity.quantity,
          "color": cartItemEntity.color,
          "size": cartItemEntity.size,
        },
      );

      log("🛒 AddToCart Response: $response");

      if (response is Map<String, dynamic>) {
        final statusCode = response['statusCode'];
        final message = response['message'];

        if (statusCode == 200 && response['succeeded'] == true && message is String) {
          return right(message);
        } else {
          return left(
            ServerFailure(
              errorMessage: message ?? "Failed to add product to cart",
            ),
          );
        }
      } else {
        return left(ServerFailure(errorMessage: "Unexpected API response format"));
      }
    } on DioException catch (e) {
      log('❌ DioException (AddToCart): ${e.message}');
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      log('❌ Unexpected Error (AddToCart): $e');
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
  @override
  Future<Either<Failure, GetCartEntity>> getCart() async {
    try {
      final response = await apiService.get(
        endPoint: EndPoints.getCart,
      );

      log("🛒 GetCart Response: $response");

      if (response is Map<String, dynamic>) {
        final statusCode = response['statusCode'];
        final message = response['message'];

        if (statusCode == 200 &&
            response['succeeded'] == true &&
            response['data'] != null) {
          return right(CartModel.fromJson(response['data']));
        } else {
          return left(
            ServerFailure(errorMessage: message ?? "Failed to get cart"),
          );
        }
      } else {
        return left(ServerFailure(errorMessage: "Unexpected API response format"));
      }
    } on DioException catch (e) {
      log('❌ DioException (GetCart): ${e.message}');
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      log('❌ Unexpected Error (GetCart): $e');
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  @override
  Future<Either<Failure, String>> deleteFromCart({
    required String productId,
  }) async {
    try {
      final response = await apiService.delete(
        endPoint: EndPoints.deleteFromCart(productId),
      );

      log("🗑️ DeleteFromCart Response: $response");

      if (response is Map<String, dynamic>) {
        final statusCode = response['statusCode'];
        final message = response['message'];

        if (statusCode == 200 && response['succeeded'] == true) {
          return right(message ?? 'Cart item removed successfully.');
        } else {
          return left(
            ServerFailure(errorMessage: message ?? 'Failed to delete cart item'),
          );
        }
      } else {
        return left(ServerFailure(errorMessage: 'Unexpected API response format'));
      }
    } on DioException catch (e) {
      log('❌ DioException (DeleteFromCart): ${e.message}');
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      log('❌ Unexpected Error (DeleteFromCart): $e');
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
  @override
  Future<Either<Failure, GetCartEntity>> updateCartItemQuantity({
    required String cartItemId,
    required int quantity,
  }) async {
    try {
      final response = await apiService.put(
        endPoint: EndPoints.updateCartItem,
        data: {
          "cartItemId": cartItemId,
          "quantity": quantity,
        },
      );

      log("🔄 UpdateCartItem Response: $response");

      if (response is Map<String, dynamic>) {
        final statusCode = response['statusCode'];
        final message = response['message'];

        if (statusCode == 200 && response['succeeded'] == true) {
          return right(CartModel.fromJson(response['data']));
        } else {
          return left(ServerFailure(errorMessage: message ?? 'Failed to update quantity'));
        }
      } else {
        return left(ServerFailure(errorMessage: 'Unexpected API response format'));
      }
    } on DioException catch (e) {
      log('❌ DioException (UpdateCartItem): ${e.message}');
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      log('❌ Unexpected Error (UpdateCartItem): $e');
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }


  @override
  Future<Either<Failure, String>> clearCart() async {
    try {
      final response = await apiService.delete(
        endPoint: EndPoints.clearCart,
      );

      log("🗑️ ClearCart Response: $response");

      if (response is Map<String, dynamic>) {
        final statusCode = response['statusCode'];
        final message = response['message'];

        if (statusCode == 200 && response['succeeded'] == true) {
          return right(message ?? "Cart cleared successfully");
        } else {
          return left(ServerFailure(errorMessage: message ?? "Failed to clear cart"));
        }
      }
      return left(ServerFailure(errorMessage: "Unexpected response format"));
    } on DioException catch (e) {
      log('❌ DioException (ClearCart): ${e.message}');
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      log('❌ Unexpected Error (ClearCart): $e');
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}