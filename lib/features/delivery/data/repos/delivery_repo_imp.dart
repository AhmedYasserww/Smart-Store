// features/delivery/data/repos/delivery_repo_impl.dart

import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/services/api_service.dart';
import '../../../../core/services/end_points.dart';
import '../entities/add_address_request_entity.dart';
import '../entities/delivery_address_entity.dart';
import '../entities/delivery_option_entity.dart';
import '../models/delivery_address_model.dart';
import '../models/delivery_option_model.dart';
import 'delivery_repo.dart';

class DeliveryRepoImpl implements DeliveryRepo {
  final ApiService apiService;

  DeliveryRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, DeliveryAddressEntity>> addAddress({
    required AddAddressRequestEntity request,
  }) async {
    try {
      final response = await apiService.post(
        endPoint: EndPoints.addAddress,
        data: request.toJson(),
      );

      log('📍 AddAddress Response: $response');

      if (response is Map<String, dynamic>) {
        final statusCode = response['statusCode'];
        final message = response['message'];

        if (statusCode == 200 && response['succeeded'] == true) {
          return right(DeliveryAddressModel.fromJson(response['data']));
        } else {
          return left(ServerFailure(errorMessage: message ?? 'Failed to add address'));
        }
      }
      return left(ServerFailure(errorMessage: 'Unexpected API response format'));
    } on DioException catch (e) {
      log('❌ DioException (AddAddress): ${e.message}');
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      log('❌ Unexpected Error (AddAddress): $e');
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<DeliveryAddressEntity>>> getAddresses() async {
    try {
      final response = await apiService.get(
        endPoint: EndPoints.getAddresses,
      );

      log('📍 GetAddresses Response: $response');

      if (response is Map<String, dynamic>) {
        final statusCode = response['statusCode'];
        final message = response['message'];

        if (statusCode == 200 && response['succeeded'] == true) {
          final data = response['data'] as List<dynamic>? ?? [];
          final addresses = data
              .map((e) => DeliveryAddressModel.fromJson(e))
              .toList();
          return right(addresses);
        } else {
          return left(ServerFailure(errorMessage: message ?? 'Failed to get addresses'));
        }
      }
      return left(ServerFailure(errorMessage: 'Unexpected API response format'));
    } on DioException catch (e) {
      log('❌ DioException (GetAddresses): ${e.message}');
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      log('❌ Unexpected Error (GetAddresses): $e');
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, DeliveryAddressEntity>> updateAddress({
    required String addressId,
    required AddAddressRequestEntity request,
  }) async {
    try {
      final response = await apiService.put(
        endPoint: EndPoints.updateAddress(addressId),
        data: request.toJson(),
      );

      log('📍 UpdateAddress Response: $response');

      if (response is Map<String, dynamic>) {
        final statusCode = response['statusCode'];
        final message = response['message'];

        if (statusCode == 200 && response['succeeded'] == true) {
          return right(DeliveryAddressModel.fromJson(response['data']));
        } else {
          return left(ServerFailure(
            errorMessage: message ?? 'Failed to update address',
          ));
        }
      }
      return left(ServerFailure(errorMessage: 'Unexpected API response format'));
    } on DioException catch (e) {
      log('❌ DioException (UpdateAddress): ${e.message}');
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      log('❌ Unexpected Error (UpdateAddress): $e');
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
  // DeliveryRepoImpl
  @override
  Future<Either<Failure, List<DeliveryOptionEntity>>> getDeliveryOptions() async {
    try {
      final response = await apiService.get(
        endPoint: EndPoints.getDeliveryOptions,
      );

      log('🚚 GetDeliveryOptions Response: $response');

      if (response is Map<String, dynamic>) {
        final statusCode = response['statusCode'];
        final message = response['message'];

        if (statusCode == 200 && response['succeeded'] == true) {
          final data = response['data'] as List<dynamic>? ?? [];
          return right(data
              .map((e) => DeliveryOptionModel.fromJson(e))
              .toList());
        } else {
          return left(ServerFailure(
            errorMessage: message ?? 'Failed to get delivery options',
          ));
        }
      }
      return left(ServerFailure(errorMessage: 'Unexpected API response format'));
    } on DioException catch (e) {
      log('❌ DioException (GetDeliveryOptions): ${e.message}');
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      log('❌ Unexpected Error (GetDeliveryOptions): $e');
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

}

