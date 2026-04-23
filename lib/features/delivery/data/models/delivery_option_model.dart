import '../entities/delivery_option_entity.dart';

class DeliveryOptionModel extends DeliveryOptionEntity {
  DeliveryOptionModel({
    required super.id,
    required super.name,
    required super.shoppingFee,
    required super.minDays,
    required super.maxDays,
  });

  factory DeliveryOptionModel.fromJson(Map<String, dynamic> json) {
    return DeliveryOptionModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      shoppingFee: (json['shopingFee'] as num).toDouble(),
      minDays: json['minDays'] ?? 0,
      maxDays: json['maxDays'] ?? 0,
    );
  }
}