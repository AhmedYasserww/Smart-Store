import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/recommendation_entity.dart';
import '../models/product_model.dart';
import '../models/product_query_params_model.dart';

abstract class ProductsRepo {
  Future<Either<Failure, ProductsResponse>> getAllProducts({
    ProductQueryParams? params,
  });

  Future<Either<Failure, ProductModel>> getProductById({required String id});

  Future<Either<Failure, List<ProductModel>>> getRecentlyViewedProducts({
    String? token,
  });
  Future<Either<Failure, List<RecommendationEntity>>> getRecommendations({
    required String productId,
    required String imageId,
  });
}
