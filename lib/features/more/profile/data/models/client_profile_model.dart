
import '../entities/cart_profile_entity.dart';

class ClientProfileModel extends ClientProfileEntity {
  ClientProfileModel({
    required super.id,
    required super.fullName,
    required super.age,
    required super.address,
    required super.profileImageUrl,
    required super.isActive,
    required super.email,
    required super.createdAt,
    required super.ordersCount,
    required super.ratingsCount,
  });

  factory ClientProfileModel.fromJson(Map<String, dynamic> json) {
    return ClientProfileModel(
      id: json['id'] ?? '',
      fullName: json['fullName'] ?? '',
      age: json['age'] ?? 0,
      address: json['address'] ?? '',
      profileImageUrl: json['profileImageUrl'],
      isActive: json['isActive'] ?? true,
      email: json['email'] ?? '',
      createdAt: json['createdAt'] ?? '',
      ordersCount: json['ordersCount'] ?? 0,
      ratingsCount: json['ratingsCount'] ?? 0,
    );
  }
}