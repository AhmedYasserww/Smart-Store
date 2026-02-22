import 'package:flutter/material.dart';
import 'package:smart_store/features/delivery/presentation/views/widgets/review_and_confirm_delivery_view_body.dart';
class ReviewAndConfirmDeliveryView extends StatelessWidget {
  const ReviewAndConfirmDeliveryView({super.key});
  static const String routeName = 'ReviewAndConfirmDeliveryView';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:ReviewAndConfirmDeliveryViewBody() ,
    );
  }
}
