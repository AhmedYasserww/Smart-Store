
import '../entities/delivery_address_entity.dart';

class DeliveryAddressModel extends DeliveryAddressEntity {
  DeliveryAddressModel({
    required super.id,
    required super.fullName,
    required super.phoneNumber,
    required super.city,
    required super.street,
    required super.building,
    required super.apartment,
    required super.isDefault,
    required super.latitude,
    required super.longitude,
    required super.createdAt,
    required super.landmark,
  });

  factory DeliveryAddressModel.fromJson(Map<String, dynamic> json) {
    return DeliveryAddressModel(
      id: json['id'] ?? '',
      fullName: json['fullName'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      city: json['city'] ?? '',
      street: json['street'] ?? '',
      building: json['building'] ?? '',
      apartment: json['apartment'] ?? '',
      isDefault: json['isDefault'] ?? false,
      latitude: json['latitude'] != null
          ? (json['latitude'] as num).toDouble()
          : null,
      longitude: json['longitude'] != null
          ? (json['longitude'] as num).toDouble()
          : null,
      createdAt: json['createdAt'] ?? '',
      landmark: json['landmark'] ?? '',
    );
  }
}