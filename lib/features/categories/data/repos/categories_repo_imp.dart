import 'package:dartz/dartz.dart';
import 'package:smart_store/features/categories/data/models/category_model.dart';
import 'package:smart_store/features/categories/data/repos/categories_repo.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/services/api_service.dart';
import '../../../../core/services/end_points.dart';

class CategoriesRepoImpl implements CategoriesRepo {
  CategoriesRepoImpl({required this.apiService});

  final ApiService apiService;

  @override
  Future<Either<Failure, List<CategoryModel>>> getAllCategories() async {
    try {
      final response = await apiService.get(
        endPoint: EndPoints.getAllCategories,
      );

      if (response is! Map<String, dynamic>) {
        return Left(ServerFailure(errorMessage: 'Invalid server response'));
      }

      final statusCode = response['statusCode'];
      final succeeded = response['succeeded'] ?? false;
      if (statusCode != 200 || !succeeded) {
        return Left(
          ServerFailure(
            errorMessage: response['message'] ?? 'Failed to fetch categories',
          ),
        );
      }

      final data = response['data'];
      if (data is! List) {
        return const Right([]);
      }

      final categories = data
          .whereType<Map<String, dynamic>>()
          .map(CategoryModel.fromJson)
          .toList();

      return Right(categories);
    } catch (e) {
      return Left(ServerFailure(errorMessage: 'Unexpected error: $e'));
    }
  }
}
