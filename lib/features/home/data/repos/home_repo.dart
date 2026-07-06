import 'package:dartz/dartz.dart';
import 'package:smart_store/core/errors/failure.dart';
import 'package:smart_store/features/home/data/models/product_home_model.dart';

abstract class HomeRepo {
  Future<Either<ServerFailure, List<HomeProductModel>>> getRecentlyProducts();
  Future<Either<ServerFailure, List<HomeProductModel>>> getHighlightsProducts();
  Future<Either<ServerFailure, List<HomeProductModel>>> getTopSellingProducts();
}
