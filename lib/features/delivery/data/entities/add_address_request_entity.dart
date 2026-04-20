// features/delivery/data/entities/add_address_request_entity.dart

class AddAddressRequestEntity {
  final String fullName;
  final String phoneNumber;
  final String city;
  final String street;
  final String building;
  final String apartment;
  final String landmark;
  final bool isDefault;
  final double? latitude;
  final double? longitude;

  const AddAddressRequestEntity({
    required this.fullName,
    required this.phoneNumber,
    required this.city,
    required this.street,
    required this.building,
    required this.apartment,
    required this.landmark,
    this.isDefault = false,
    this.latitude,
    this.longitude,
  });

  Map<String, dynamic> toJson() => {
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
  };
}