import 'package:flutter/material.dart';
import 'package:smart_store/features/delivery/presentation/views/widgets/payment_method_widgets/payment_method_item.dart';
import '../../../../../core/utils/app_dimensions.dart';
import '../../../../../core/utils/app_style.dart';
import '../../../data/entities/delivery_address_entity.dart';
import '../../../data/entities/delivery_option_entity.dart';
import '../../../data/models/order_summary_argument.dart';
import '../review_and_confirm_delivery_view.dart';
import 'general_saved_address_widgets/back_and_continue_buttons.dart';
import 'general_saved_address_widgets/custom_delivery_app_bar.dart';
class PaymentMethodViewBody extends StatefulWidget {
  const PaymentMethodViewBody({
    super.key,
    required this.address,
    required this.deliveryOption,
  });
  final DeliveryAddressEntity address;
  final DeliveryOptionEntity deliveryOption;

  @override
  State<PaymentMethodViewBody> createState() => _PaymentMethodViewBodyState();
}

class _PaymentMethodViewBodyState extends State<PaymentMethodViewBody> {
  int selectedIndex = -1;

  static const _methods = ['Cash On Delivery', 'Card', 'PayPal'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomDeliveryAppBar(
          title: 'Payment Method',
          nextStepValue: 'Next Review & Confirm',
          value: .75,
          textValue: '3/4',
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimensions.homeScreenPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 32),
                Text('Payment Method', style: AppStyle.styleBold16),
                const SizedBox(height: 24),
                ...List.generate(_methods.length, (i) => Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: PaymentMethodItem(
                    title: _methods[i],
                    isSelected: selectedIndex == i,
                    onTap: () => setState(() => selectedIndex = i),
                  ),
                )),
              ],
            ),
          ),
        ),
        BackAndContinueButtons(
          isEnabled: selectedIndex != -1,
          onContinue: () {
            Navigator.of(context).pushNamed(
              ReviewAndConfirmDeliveryView.routeName,
              arguments: OrderSummaryArguments(
                address: widget.address,
                deliveryOption: widget.deliveryOption,
                paymentMethod: _methods[selectedIndex],
              ),
            );
          },
        ),
      ],
    );
  }
}