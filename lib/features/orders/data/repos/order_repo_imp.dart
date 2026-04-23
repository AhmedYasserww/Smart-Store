// features/order/data/repos/order_repo_impl.dart

import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/services/api_service.dart';
import '../../../../core/services/end_points.dart';
import '../entities/create_order_entity.dart';
import '../models/create_order_model.dart';
import 'order_repo.dart';

class OrderRepoImpl implements OrderRepo {
  final ApiService apiService;

  OrderRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, CreateOrderEntity>> createOrder({
    required String addressId,
    required String deliveryOption,
  }) async {
    try {
      final response = await apiService.post(
        endPoint: EndPoints.createOrder(addressId),
        data: {'deleveryOption': deliveryOption},
      );

      log('🛒 CreateOrder Response: $response');

      if (response is Map<String, dynamic>) {
        final statusCode = response['statusCode'];
        final message = response['message'];

        if (statusCode == 200 && response['succeeded'] == true) {
          return right(CreateOrderModel.fromJson(response['data']));
        } else {
          return left(ServerFailure(
            errorMessage: message ?? 'Failed to create order',
          ));
        }
      }
      return left(ServerFailure(errorMessage: 'Unexpected API response format'));
    } on DioException catch (e) {
      log('❌ DioException (CreateOrder): ${e.message}');
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      log('❌ Unexpected Error (CreateOrder): $e');
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}