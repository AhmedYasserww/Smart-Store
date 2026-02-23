import 'package:flutter/material.dart';
import 'package:smart_store/features/delivery/presentation/views/widgets/custom_delivery_app_bar.dart';
class ReviewAndConfirmDeliveryViewBody extends StatelessWidget {
  const ReviewAndConfirmDeliveryViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomDeliveryAppBar(
          isHaveSubtitle: false,
          title: "Review & Confirm",
            nextStepValue: "",
            value: 1, textValue:"4/4")
      ],
    );
  }
}
