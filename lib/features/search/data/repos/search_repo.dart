import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/failure.dart';
import '../../../products/data/models/product_model.dart';

abstract class SearchRepo {

  Future<Either<Failure, List<ProductModel>>> searchForProduct({
    required String product,
    CancelToken? cancelToken,
  });

}