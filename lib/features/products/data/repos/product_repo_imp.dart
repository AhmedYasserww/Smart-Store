import 'package:dartz/dartz.dart';
import 'package:smart_store/features/products/data/repos/product_repo.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/services/api_service.dart';
import '../../../../core/services/end_points.dart';
import '../models/product_model.dart';
import '../models/product_query_params_model.dart';

class ProductsRepoImpl implements ProductsRepo {
  final ApiService apiService;

  ProductsRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, ProductsResponse>> getAllProducts({
    ProductQueryParams? params,
  }) async {
    try {
      final response = await apiService.get(
        endPoint: EndPoints.getAllProducts,
        queryParameters: params?.toQueryParameters(),
      );

      if (response is Map<String, dynamic>) {
        final statusCode = response["statusCode"];
        final succeeded = response["succeeded"] ?? false;

        if (statusCode == 200 && succeeded) {
          return Right(ProductsResponse.fromJson(response));
        } else {
          final errorMessage =
              response["message"] ?? "Failed to fetch products";
          return Left(ServerFailure(errorMessage: errorMessage));
        }
      } else {
        return Left(ServerFailure(errorMessage: "Invalid server response"));
      }
    } catch (e) {
      return Left(ServerFailure(errorMessage: "Unexpected error: $e"));
    }
  }

  @override
  Future<Either<Failure, ProductModel>> getProductById({
    required String id,
  }) async {
    try {
      final response = await apiService.get(
        endPoint: '${EndPoints.getAllProducts}/$id',
      );

      if (response is! Map<String, dynamic>) {
        return Left(ServerFailure(errorMessage: 'Invalid server response'));
      }

      final statusCode = response['statusCode'];
      final succeeded = response['succeeded'] ?? false;
      if (statusCode != 200 || !succeeded) {
        return Left(
          ServerFailure(
            errorMessage: response['message'] ?? 'Failed to fetch product',
          ),
        );
      }

      final data = response['data'];
      if (data is! Map<String, dynamic>) {
        return Left(ServerFailure(errorMessage: 'Invalid product response'));
      }

      return Right(ProductModel.fromJson(data));
    } catch (e) {
      return Left(ServerFailure(errorMessage: 'Unexpected error: $e'));
    }
  }

  @override
  Future<Either<Failure, List<ProductModel>>> getRecentlyViewedProducts({
    String? token,
  }) async {
    try {
      final response = await apiService.get(
        endPoint: EndPoints.getRecentlyViewedProducts,
        token: token,
      );

      if (response is! Map<String, dynamic>) {
        return Left(ServerFailure(errorMessage: 'Invalid server response'));
      }

      final statusCode = response['statusCode'];
      final succeeded = response['succeeded'] ?? false;
      if (statusCode != 200 || !succeeded) {
        return Left(
          ServerFailure(
            errorMessage:
                response['message'] ?? 'Failed to fetch recently viewed',
          ),
        );
      }

      final data = response['data'];
      if (data is! Map<String, dynamic>) {
        return const Right([]);
      }

      final items = data['items'];
      if (items is! List) {
        return const Right([]);
      }

      final products = items
          .whereType<Map<String, dynamic>>()
          .map(ProductModel.fromJson)
          .toList();

      return Right(products);
    } catch (e) {
      return Left(ServerFailure(errorMessage: 'Unexpected error: $e'));
    }
  }
}
