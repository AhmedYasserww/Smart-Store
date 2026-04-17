
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/services/api_service.dart';
import '../../../../core/services/end_points.dart';
import '../entities/wishlist_entity.dart';
import '../models/wishlist_model.dart';
import 'wishlist_repo.dart';

class WishlistRepoImpl implements WishlistRepo {
  final ApiService apiService;

  WishlistRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, WishlistEntity>> getWishlist() async {
    try {
      final response = await apiService.get(endPoint: EndPoints.getWishlist);
      log('📋 GetWishlist Response: $response');

      if (response is Map<String, dynamic>) {
        final statusCode = response['statusCode'];
        final message = response['message'];

        if (statusCode == 200 && response['succeeded'] == true) {
          return right(WishlistModel.fromJson(response['data']));
        } else {
          return left(ServerFailure(errorMessage: message ?? 'Failed to get wishlist'));
        }
      }
      return left(ServerFailure(errorMessage: 'Unexpected API response format'));
    } on DioException catch (e) {
      log('❌ DioException (GetWishlist): ${e.message}');
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      log('❌ Unexpected Error (GetWishlist): $e');
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> addToWishlist({required String productId}) async {
    try {
      final response = await apiService.post(
        endPoint: EndPoints.addToWishlist,
        data: {'productId': productId},
      );
      log('❤️ AddToWishlist Response: $response');

      if (response is Map<String, dynamic>) {
        final statusCode = response['statusCode'];
        final message = response['message'];

        if ((statusCode == 200 || statusCode == 201) && response['succeeded'] == true) {
          return right(message ?? 'Product added to wishlist');
        } else {
          return left(ServerFailure(errorMessage: message ?? 'Failed to add to wishlist'));
        }
      }
      return left(ServerFailure(errorMessage: 'Unexpected API response format'));
    } on DioException catch (e) {
      log('❌ DioException (AddToWishlist): ${e.message}');
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      log('❌ Unexpected Error (AddToWishlist): $e');
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> removeFromWishlist({required String itemId}) async {
    try {
      final response = await apiService.delete(
        endPoint: EndPoints.removeFromWishlist(itemId),
      );
      log('🗑️ RemoveFromWishlist Response: $response');

      if (response is Map<String, dynamic>) {
        final statusCode = response['statusCode'];
        final message = response['message'];

        if (statusCode == 200 && response['succeeded'] == true) {
          return right(message ?? 'Item removed from wishlist');
        } else {
          return left(ServerFailure(errorMessage: message ?? 'Failed to remove from wishlist'));
        }
      }
      return left(ServerFailure(errorMessage: 'Unexpected API response format'));
    } on DioException catch (e) {
      log('❌ DioException (RemoveFromWishlist): ${e.message}');
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      log('❌ Unexpected Error (RemoveFromWishlist): $e');
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}