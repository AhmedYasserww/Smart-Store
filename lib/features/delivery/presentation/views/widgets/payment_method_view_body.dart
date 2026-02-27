import 'package:flutter/material.dart';
import '../../../../../core/utils/app_dimensions.dart';
import '../../../../../core/utils/app_style.dart';
import '../review_and_confirm_delivery_view.dart';
import 'gereral_saved_address_widgets/back_and_continue_buttons.dart';
import 'gereral_saved_address_widgets/custom_delivery_app_bar.dart';
import 'delivery_option_widgets/delivery_option_item.dart';
class PaymentMethodViewBody extends StatefulWidget {
  const PaymentMethodViewBody({super.key});
  @override
  State<PaymentMethodViewBody> createState() => _PaymentMethodViewBodyState();
}
class _PaymentMethodViewBodyState extends State<PaymentMethodViewBody> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomDeliveryAppBar(
          title: "Payment Method",
          nextStepValue: "Next Review & Confirm",
          value: .75,
          textValue: "3/4",
        ),

        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppDimensions.homeScreenPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                const SizedBox(height: 32),

                Text(
                  "Payment Method",
                  style: AppStyle.styleBold16,
                ),
                const SizedBox(height: 24),
                DeliveryOptionItem(
                  title: "Cash On Delivery",
                  isSelected: selectedIndex == 0,
                  onTap: () {
                    setState(() {
                      selectedIndex = 0;
                    });
                  },
                ),
                const SizedBox(height: 16),
                DeliveryOptionItem(
                  title: "Card ",
                  isSelected: selectedIndex == 1,
                  onTap: () {
                    setState(() {
                      selectedIndex = 1;
                    });
                  },
                ),
                const SizedBox(height: 16),
                DeliveryOptionItem(
                  title: "PayPal",
                  isSelected: selectedIndex == 2,
                  onTap: () {
                    setState(() {
                      selectedIndex = 2;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
        BackAndContinueButtons(
          isEnabled: selectedIndex != -1,
          onContinue: () {
            Navigator.of(context).pushNamed(ReviewAndConfirmDeliveryView.routeName);
          },
        ),
      ],
    );
  }
}