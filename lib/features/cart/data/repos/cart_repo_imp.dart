import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/services/api_service.dart';
import '../../../../core/services/end_points.dart';
import '../entities/add_to_cart_item_entity.dart';
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
  Future<Either<Failure, String>> deleteFromCart({required String productId}) {
    // TODO: implement deleteFromCart
    throw UnimplementedError();
  }
}