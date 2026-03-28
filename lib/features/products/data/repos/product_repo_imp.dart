import 'package:dartz/dartz.dart';
import 'package:smart_store/features/products/data/repos/product_repo.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/services/api_service.dart';
import '../../../../core/services/end_points.dart';
import '../models/product_model.dart';

class ProductsRepoImpl implements ProductsRepo {
  final ApiService apiService;

  ProductsRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, ProductsResponse>> getAllProducts() async {
    try {
      final response = await apiService.get(
        endPoint: EndPoints.getAllProducts,
      );

      if (response is Map<String, dynamic>) {
        final statusCode = response["statusCode"];
        final succeeded = response["succeeded"] ?? false;

        if (statusCode == 200 && succeeded) {
          return Right(ProductsResponse.fromJson(response));
        } else {
          final errorMessage = response["message"] ?? "Failed to fetch products";
          return Left(ServerFailure(errorMessage: errorMessage));
        }
      } else {
        return Left(ServerFailure(errorMessage: "Invalid server response"));
      }
    } catch (e) {
      return Left(ServerFailure(errorMessage: "Unexpected error: $e"));
    }
  }
}