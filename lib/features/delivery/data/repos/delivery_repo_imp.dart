// features/delivery/data/repos/delivery_repo_impl.dart

import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/services/api_service.dart';
import '../../../../core/services/end_points.dart';
import '../entities/delivery_address_entity.dart';
import '../models/delivery_address_model.dart';
import 'delivery_repo.dart';

class DeliveryRepoImpl implements DeliveryRepo {
  final ApiService apiService;

  DeliveryRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, DeliveryAddressEntity>> addAddress({
    required String fullName,
    required String phoneNumber,
    required String city,
    required String street,
    required String building,
    required String apartment,
    required String landmark,
    required bool isDefault,
    double? latitude,
    double? longitude,
  }) async {
    try {
      final response = await apiService.post(
        endPoint: EndPoints.addAddress,
        data: {
          'fullName': fullName,
          'phoneNumber': phoneNumber,
          'city': city,
          'street': street,
          'building': building,
          'apartment': apartment,
          'landmark': landmark,
          'isDefault': isDefault,
          if (latitude != null) 'latitude': latitude,
          if (longitude != null) 'longitude': longitude,
        },
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
}