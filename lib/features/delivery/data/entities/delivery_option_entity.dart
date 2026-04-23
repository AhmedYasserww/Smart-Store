// features/delivery/data/entities/delivery_option_entity.dart
class DeliveryOptionEntity {
  final String id;
  final String name;
  final double shoppingFee;
  final int minDays;
  final int maxDays;

  DeliveryOptionEntity({
    required this.id,
    required this.name,
    required this.shoppingFee,
    required this.minDays,
    required this.maxDays,
  });

  String get deliveryDays => '$minDays-$maxDays Days';
  String get formattedFee => '\$${shoppingFee.toStringAsFixed(2)}';
}