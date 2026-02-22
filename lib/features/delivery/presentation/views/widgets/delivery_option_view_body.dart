import 'package:flutter/material.dart';
import 'package:smart_store/features/delivery/presentation/views/payment_method_view.dart';

import '../../../../../core/utils/app_dimensions.dart';
import '../../../../../core/utils/app_style.dart';
import 'back_and_continue_buttons.dart';
import 'custom_delivery_app_bar.dart';
import 'delivery_option_widgets/delivery_option_item.dart';

class DeliveryOptionViewBody extends StatefulWidget {

  const DeliveryOptionViewBody({super.key});
  @override
  State<DeliveryOptionViewBody> createState() => _DeliveryOptionViewBodyState();
}
class _DeliveryOptionViewBodyState extends State<DeliveryOptionViewBody> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {

    return Column(

      children: [

        const CustomDeliveryAppBar(
          value: .5,
          textValue: "2/4",
        ),
        Padding(

            padding: EdgeInsets.symmetric(
              horizontal:
              AppDimensions.homeScreenPadding,
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 32),
                Text("Delivery Option",style: AppStyle.styleBold16,),
                SizedBox(height: 24,),
                DeliveryOptionItem(
                  title: "Standard Delivery",
                  subtitle: "Shipping Fee: \$4.99",
                  isSelected:
                  selectedIndex == 1,
                  onTap: () {
                    setState(() {
                      selectedIndex = 1;
                    });
                  },

                ),
                const SizedBox(height: 16),
                DeliveryOptionItem(
                  title: "Express Delivery",
                  subtitle: "Shipping Fee: \$11.99",
                  isSelected:
                  selectedIndex == 0,
                  onTap: () {
                    setState(() {
                      selectedIndex = 0;
                    });
                  },

                ),
              ],

            ),

          ),
        Spacer(),


        BackAndContinueButtons(
          isEnabled:
          selectedIndex != -1,

          onContinue: () {
            Navigator.of(context).pushNamed(PaymentMethodView.routeName);
          },

        ),

      ],

    );
  }
}