import 'package:dartz/dartz.dart';
import 'package:smart_store/features/categories/data/models/category_model.dart';

import '../../../../core/errors/failure.dart';

abstract class CategoriesRepo {
  Future<Either<Failure, List<CategoryModel>>> getAllCategories();
}
