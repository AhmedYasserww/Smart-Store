// features/delivery/data/entities/delivery_address_entity.dart

class DeliveryAddressEntity {
  final String id;
  final String fullName;
  final String phoneNumber;
  final String city;
  final String street;
  final String building;
  final String apartment;
  final bool isDefault;
  final double? latitude;
  final double? longitude;
  final String createdAt;
  final String landmark;

  DeliveryAddressEntity({
    required this.id,
    required this.fullName,
    required this.phoneNumber,
    required this.city,
    required this.street,
    required this.building,
    required this.apartment,
    required this.isDefault,
    required this.latitude,
    required this.longitude,
    required this.createdAt,
    required this.landmark,
  });

  String get fullAddress => '$city, $street, $building, $apartment';
}