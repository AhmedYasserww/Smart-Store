// features/delivery/data/entities/order_summary_arguments.dart
import 'package:smart_store/features/delivery/data/entities/delivery_address_entity.dart';
import 'package:smart_store/features/delivery/data/entities/delivery_option_entity.dart';

class OrderSummaryArguments {
  final DeliveryAddressEntity address;
  final DeliveryOptionEntity deliveryOption;
  final String paymentMethod;

  const OrderSummaryArguments({
    required this.address,
    required this.deliveryOption,
    required this.paymentMethod,
  });
}