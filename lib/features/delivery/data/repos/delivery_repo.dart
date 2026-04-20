
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/add_address_request_entity.dart';
import '../entities/delivery_address_entity.dart';

 abstract class DeliveryRepo {
//   Future<Either<Failure, DeliveryAddressEntity>> addAddress({
//     required String fullName,
//     required String phoneNumber,
//     required String city,
//     required String street,
//     required String building,
//     required String apartment,
//     required String landmark,
//     required bool isDefault,
//     double? latitude,
//     double? longitude,
//   });
Future<Either<Failure, DeliveryAddressEntity>> addAddress({
  required AddAddressRequestEntity request,
});

  Future<Either<Failure, List<DeliveryAddressEntity>>> getAddresses();
  Future<Either<Failure, DeliveryAddressEntity>> updateAddress({
    required String addressId,
    required AddAddressRequestEntity request,
  });
}