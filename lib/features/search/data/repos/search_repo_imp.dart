import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:smart_store/core/services/end_points.dart';
import 'package:smart_store/features/search/data/repos/search_repo.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/services/api_service.dart';
import '../../../products/data/models/product_model.dart';

class SearchRepoImp implements SearchRepo {
  final ApiService apiService;

  SearchRepoImp({required this.apiService});

  @override
  Future<Either<Failure, List<ProductModel>>> searchForProduct({
    required String product,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await apiService.get(
        endPoint: EndPoints.searchForProduct,
        queryParameters: {
          "searchQuery": product,
        },
        cancelToken: cancelToken,
      );

      log("Search Response: $response");

      if (response['succeeded'] == true) {
        final List data = response['data'] ?? [];

        final products = data
            .map((e) => ProductModel.fromJson(e))
            .toList();

        return Right(products);
      } else {
        return Left(
          ServerFailure(
            errorMessage: response['message'] ?? "Search failed",
          ),
        );
      }
    } on DioException catch (e) {
      log("Dio Error: ${e.message}");

      return Left(
        ServerFailure(
          errorMessage:
          e.response?.data?['message'] ?? "Network error",
        ),
      );
    } catch (e) {
      return Left(
        ServerFailure(
          errorMessage: "Unexpected error: $e",
        ),
      );
    }
  }
}