// features/payment/data/entities/payment_intent_entity.dart
class PaymentIntentEntity {
  final String clientSecret;
  final String paymentIntentId;

  PaymentIntentEntity({
    required this.clientSecret,
    required this.paymentIntentId,
  });
}