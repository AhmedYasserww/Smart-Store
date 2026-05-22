// features/order/data/repos/order_repo_impl.dart

import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/services/api_service.dart';
import '../../../../core/services/end_points.dart';
import '../entities/create_order_entity.dart';
import '../entities/order_details_entity.dart';
import '../entities/order_entity.dart';
import '../models/create_order_model.dart';
import '../models/order_details_model.dart';
import '../models/order_model.dart';
import 'order_repo.dart';

class OrderRepoImpl implements OrderRepo {
  final ApiService apiService;

  OrderRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, CreateOrderEntity>> createOrder({
    required String deliveryAddressId,
    required String deliveryOptionId,
  }) async {
    try {
      final response = await apiService.post(
        endPoint: EndPoints.createOrder,
        data: {
          'deliveryAddressId': deliveryAddressId,
          'deliveryOptionId': deliveryOptionId,
        },
      );

      log('🛒 CreateOrder Response: $response');

      if (response is Map<String, dynamic>) {
        final statusCode = response['statusCode'];
        final message = response['message'];

        if (statusCode == 200 && response['succeeded'] == true) {
          return right(CreateOrderModel.fromJson(response['data']));
        } else {
          return left(ServerFailure(errorMessage: message ?? 'Failed to create order'));
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

  @override
  Future<Either<Failure, OrderDetailsEntity>> getOrderDetails({
    required String orderId,
  }) async {
    try {
      final response = await apiService.get(
        endPoint: '${EndPoints.orderDetails}/$orderId',
      );

      log("📦 OrderDetails Response: $response");

      if (response is Map<String, dynamic>) {
        final statusCode = response['statusCode'];
        final message = response['message'];

        if (statusCode == 200 &&
            response['succeeded'] == true &&
            response['data'] != null) {
          return right(OrderDetailsModel.fromJson(response['data']));
        } else {
          return left(ServerFailure(errorMessage: message ?? "Failed to get order details"));
        }
      }
      return left(ServerFailure(errorMessage: "Unexpected response format"));
    } on DioException catch (e) {
      log('❌ DioException (OrderDetails): ${e.message}');
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      log('❌ Unexpected Error (OrderDetails): $e');
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
  @override
  Future<Either<Failure, OrdersResponseEntity>> getOrders() async {
    try {
      final response = await apiService.get(endPoint: EndPoints.getOrders);
      log("📦 GetOrders Response: $response");

      if (response is Map<String, dynamic> &&
          response['statusCode'] == 200 &&
          response['succeeded'] == true) {
        return right(OrdersResponseModel.fromJson(response['data']));
      }
      return left(ServerFailure(errorMessage: response['message'] ?? "Failed"));
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> cancelOrder({required String orderId}) async {
    try {
      final response = await apiService.put(
        endPoint: '${EndPoints.cancelOrder}/$orderId',
        data: {},
      );
      log("❌ CancelOrder Response: $response");

      if (response is Map<String, dynamic> &&
          response['statusCode'] == 200 &&
          response['succeeded'] == true) {
        return right(response['message'] ?? "Order canceled successfully");
      }
      return left(ServerFailure(errorMessage: response['message'] ?? "Failed"));
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}