import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:smart_store/core/errors/failure.dart';
import 'package:smart_store/core/services/end_points.dart';
import 'package:smart_store/features/home/data/models/product_home_model.dart';
import 'package:smart_store/features/home/data/repos/home_repo.dart';
import '../../../../core/services/api_service.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl({required this.apiService});
  @override
  Future<Either<ServerFailure, List<HomeProductModel>>>
  getRecentlyProducts() async {
    try {
      final response = await apiService.get(
        endPoint: EndPoints.getRecentlyAdded,
      );
      log("Endpoint: ${EndPoints.getRecentlyAdded}");
      if (response is Map<String, dynamic>) {
        final statusCode = response["statusCode"];
        final succeeded = response["succeeded"] ?? false;

        if (statusCode == 200 && succeeded) {
          final products = (response["data"] as List<dynamic>)
              .map((e) => HomeProductModel.fromJson(e as Map<String, dynamic>))
              .toList();

          return Right(products);
        } else {
          return Left(
            ServerFailure(
              errorMessage: response["message"] ?? "Failed to fetch products",
            ),
          );
        }
      }

      return Left(ServerFailure(errorMessage: "Invalid server response"));
    } catch (e) {
      return Left(ServerFailure(errorMessage: "Unexpected error: $e"));
    }
  }

  @override
  Future<Either<ServerFailure, List<HomeProductModel>>>
  getHighlightsProducts() async {
    try {
      final response = await apiService.get(
        endPoint: EndPoints.getWishListHighlights,
      );
      log("Endpoint: ${EndPoints.getWishListHighlights}");
      if (response is Map<String, dynamic>) {
        final statusCode = response["statusCode"];
        final succeeded = response["succeeded"] ?? false;

        if (statusCode == 200 && succeeded) {
          final products = (response["data"] as List<dynamic>)
              .map((e) => HomeProductModel.fromJson(e as Map<String, dynamic>))
              .toList();

          return Right(products);
        } else {
          return Left(
            ServerFailure(
              errorMessage: response["message"] ?? "Failed to fetch products",
            ),
          );
        }
      }

      return Left(ServerFailure(errorMessage: "Invalid server response"));
    } catch (e) {
      return Left(ServerFailure(errorMessage: "Unexpected error: $e"));
    }
  }

  @override
  Future<Either<ServerFailure, List<HomeProductModel>>>
  getTopSellingProducts() async {
    try {
      final response = await apiService.get(endPoint: EndPoints.getTopSelling);
      log("Endpoint: ${EndPoints.getTopSelling}");
      if (response is Map<String, dynamic>) {
        final statusCode = response["statusCode"];
        final succeeded = response["succeeded"] ?? false;

        if (statusCode == 200 && succeeded) {
          final products = (response["data"] as List<dynamic>)
              .map((e) => HomeProductModel.fromJson(e as Map<String, dynamic>))
              .toList();

          return Right(products);
        } else {
          return Left(
            ServerFailure(
              errorMessage: response["message"] ?? "Failed to fetch products",
            ),
          );
        }
      }

      return Left(ServerFailure(errorMessage: "Invalid server response"));
    } catch (e) {
      return Left(ServerFailure(errorMessage: "Unexpected error: $e"));
    }
  }
}
