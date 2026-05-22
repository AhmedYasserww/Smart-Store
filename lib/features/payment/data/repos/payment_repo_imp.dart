import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/services/api_service.dart';
import '../../../../core/services/end_points.dart';
import '../entites/payment_intent_entity.dart';
import 'payment_repo.dart';

class PaymentRepoImpl implements PaymentRepo {
  final ApiService apiService;
  PaymentRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, PaymentIntentEntity>> getClientSecret({
    required String deliveryAddressId,
    required String deliveryOptionId,
  }) async {
    try {
      final response = await apiService.post(
        endPoint: EndPoints.createPaymentIntent,
        data: {
          "deliveryAddressId": deliveryAddressId,
          "deliveryOptionId": deliveryOptionId,
        },
      );

      log("💳 Payment Intent Response: $response");

      if (response is Map<String, dynamic>) {
        final statusCode = response['statusCode'];
        final message = response['message'];

        if (statusCode == 200 &&
            response['succeeded'] == true &&
            response['data'] != null) {
          return right(PaymentIntentEntity(
            clientSecret: response['data']['clientSecret'],
            paymentIntentId: response['data']['paymentIntentId'],
          ));
        } else {
          return left(ServerFailure(
            errorMessage: message ?? "Failed to create payment intent",
          ));
        }
      }
      return left(ServerFailure(errorMessage: "Unexpected response format"));
    } on DioException catch (e) {
      log('❌ DioException (Payment): ${e.message}');
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      log('❌ Unexpected Error (Payment): $e');
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
  }
