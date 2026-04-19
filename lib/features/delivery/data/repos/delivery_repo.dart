
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/delivery_address_entity.dart';

abstract class DeliveryRepo {
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
  });

  Future<Either<Failure, List<DeliveryAddressEntity>>> getAddresses();
}